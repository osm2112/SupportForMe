
  create or replace PROCEDURE pay_confirm_process (  p_out out varchar2) is
  --프로젝트 마감일에 투자금액이 목표금액 달성,미달성에 따라 자동결제 승인 or 취소. 
  -- 1.해당프로젝트에 투자된 금액 합계
  -- 2.해당프로젝트의 목표금액과 비교
  -- 달성 - 결제승인, 미달성 - 결제취소.
  v_sum varchar2(50);
  v_pno varchar2(50);
  v_total varchar2(10);
  
   --Cursor : 마감일이 오늘인 프로젝트의 프로젝트코드와, 목표금액을 구함.
  cursor dead_project IS
  select project_no, target_amount
  from project
  where project_deadline = TO_CHAR(sysdate, ('yyyymmdd'));
   
BEGIN
  FOR dead_project_rec IN dead_project LOOP
  v_pno  := dead_project_rec.project_no ; 
  v_total := dead_project_rec.target_amount;
 
  --프로젝트코드별로 투자금액합계를 알아낸다.
  select sum(investment_amount)
  into v_sum
  from invest
  where project_no = v_pno;
  
  IF (v_total > v_sum) THEN
   update invest
   set payment_state = '자동결제취소'
   where project_no = v_pno;
   commit;
   --dbms_output.put_line('자동결제취소.');
   --p_out := '결제취소';
  ELSIF (v_total <= v_sum) THEN 
   update invest
   set payment_state = '자동결제승인'
   where project_no = v_pno;
   commit;
   --dbms_output.put_line('자동결제승인');
   --p_out := '결제승인';
  END IF; 
  END LOOP;

END pay_confirm_process;




create or replace procedure project_manage_procedure is
    -- 현재날짜 > 마감날짜인 모든 프로젝트
    cursor c_project_cursor is
    select *
    from project
    where sysdate > to_date(project_deadline, 'yyyy-mm-dd');
  
    --Cursor : 마감일이 오늘인 프로젝트의 프로젝트코드와, 목표금액을 구함.
    cursor dead_project IS
    select project_no, target_amount
    from project
    where project_deadline = TO_CHAR(sysdate, ('yyyymmdd'));
  
  v_project_record c_project_cursor%rowtype;
  v_total_invest_amount number;
  
  v_sum varchar2(50);
  v_pno varchar2(50);
  v_total varchar2(10);
   
begin
  for v_project_record in c_project_cursor
    loop
      -- 한 프로젝트에 대한 투자자들의 모금액의 총합
      -- 무산: 현재날짜 > 마감날짜 and 총모금액 < 목표금액
      if  func_total_invest_amount(v_project_record.project_no) < to_number(v_project_record.target_amount)
      then 
        update project set progress = '무산' where project_no = v_project_record.project_no;
      -- 마감: 현재날짜 > 마감날짜 and  총모금액 >= 목표금액 and 현재날짜 <= 결제예정일
      else 
        if sysdate <= to_date(v_project_record.project_deadline, 'yyyy-mm-dd')
        then
          update project set progress = '마감' where project_no = v_project_record.project_no;
        -- 완료: 현재날짜 > 예상배송일 and 총 모금액 >= 목표금액  
        elsif sysdate > to_date(v_project_record.delivery_date, 'yyyy-mm-dd')
          then
            update project set progress = '완료' where project_no = v_project_record.project_no;
        end if;
      end if;
    end loop;
    
    FOR dead_project_rec IN dead_project LOOP
    v_pno  := dead_project_rec.project_no ; 
    v_total := dead_project_rec.target_amount;
 
    --프로젝트코드별로 투자금액합계를 알아낸다.
    select sum(investment_amount)
    into v_sum
    from invest
    where project_no = v_pno;
  
    IF (v_total > v_sum) THEN
    update invest
    set payment_state = '자동결제취소'
    where project_no = v_pno;
    commit;
   --dbms_output.put_line('자동결제취소.');
   --p_out := '결제취소';
    ELSIF (v_total <= v_sum) THEN 
    update invest
    set payment_state = '자동결제승인'
    where project_no = v_pno;
    commit;
   --dbms_output.put_line('자동결제승인');
   --p_out := '결제승인';
    END IF; 
  END LOOP;
end project_manage_procedure;



create or replace PROCEDURE project_rank5
(p_cur_project_rank5 OUT SYS_REFCURSOR)
IS
CURSOR v_invest_rank5 IS
SELECT project_no 
FROM (select project_no, count(*) as count 
      from invest 
      group by project_no 
      order by count desc)
where rownum <=5 ; 
BEGIN
FOR rank5 IN v_invest_rank5
LOOP 
  OPEN p_cur_project_rank5 FOR 
  SELECT project_no, project_name, image
  FROM project 
  WHERE project_no = rank5.project_no;
END LOOP;
END project_rank5;



create or replace procedure delete_comments (p_comment_no varchar2)is

v_comment_no comments.comment_no%type := p_comment_no;
v_cnt number;

begin
  select count(*) into v_cnt
  from comments
  where top_comment_no = v_comment_no;
  -- 댓글에 답변이 달린 상태이면 댓글을 삭제하지 않음
  if v_cnt >= 1 then
    update comments set comment_content='삭제된 댓글입니다.',
    					comment_date=null,
    					user_id=null
    where comment_no = v_comment_no;
  else
    delete from comments where comment_no = v_comment_no;
  end if;
end;



create or replace FUNCTION PROJECT_PROGRESS_RATE (
P_PROJECT_NO IN VARCHAR2
)
RETURN NUMBER
IS
  V_SUM_PROJECT   NUMBER(18);
  V_TARGET_AMOUNT VARCHAR(4000) ;
BEGIN
  SELECT SUM(INVESTMENT_AMOUNT)
  INTO	V_SUM_PROJECT
  FROM   INVEST 
  WHERE  PROJECT_NO  = P_PROJECT_NO;

  SELECT TARGET_AMOUNT
  INTO V_TARGET_AMOUNT
  FROM PROJECT 
  WHERE  PROJECT_NO  = P_PROJECT_NO;
  
  RETURN(NVL(ROUND(((V_SUM_PROJECT/V_TARGET_AMOUNT)*100)),0)) ;
END;
  
  
  
  
create or replace FUNCTION func_total_invset_amount
(p_projectNo varchar2)
RETURN NUMBER
IS
v_total_invest_amount number(18) := 0;
BEGIN 
SELECT sum(to_number(investment_amount)) INTO v_total_invest_amount
FROM invest
WHERE project_no = p_projectNo;
RETURN v_total_invest_amount;
END;
  
 
create or replace PROCEDURE insertProject
( p_userId varchar2, 
  p_projectNo out varchar2)
IS
v_projectNo project.project_no%type;
BEGIN
  SELECT (TO_CHAR(SYSDATE, 'rrrrMMdd') || LPAD((PROJECT_SEQ.NEXTVAL),4,0)) INTO v_projectNo FROM DUAL;
  INSERT INTO PROJECT (PROJECT_NO,  USER_ID, PROGRESS)
               VALUES (v_projectNo, p_userId, '004');
  p_projectNo := v_projectNo;
END;
  
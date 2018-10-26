<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트 등록</title>
    <style>
        .save_button {
	    font-size : 15px;
            font-weight : 800;
            color: rgb(26, 188, 156);
	    background-color: white;
            border-radius: 5px;
            border : 1px solid rgb(26, 188, 156);
            padding : 5px 50px; 
            margin-top : 5px;
            margin-left : 50px;
	}
	.next_button {
	    font-size : 15px;
            font-weight : 800;
            color: white;
            background-color : rgb(26, 188, 156);
            border-radius: 5px;
            border : none;
            padding : 5px 50px; 
            margin-top : 5px;
            margin-left : 50px;
	}
    </style>
</head>
<body>
    <div style="height:50px"></div>
	    <div id="basic_subject">
		<div>프로젝트의 제목을 적어주세요</div>
		<input type="text">
	     </div>
	     <div id="basic_target">
		<div>목표 금액을 적어주세요</div>
		<input type="text" value="0">
	     </div>
	     <div id="basic_">
		<div>프로젝트의 진행기간을 적어주세요</div>
		<div>최소 7일부터 최대 50일까지 가능합니다.</div>
		<input type="text" disabled> 일 남음 <input type="date">
	     </div>
	      <div id="basic_">
		<div>프로젝트 대표 이미지를 등록해주세요</div>
		<div>이미지</div>
	     </div>
	    <div id="basic_keyword">
		<div>프로젝트 키워드를 적어주세요  (선택사항)</div>
		<div>제목 외에도 키워드 검색 시 검색 결과에 프로젝트가 나타납니다.</div>
		<input type="text" name="keyword" style="width:500px;" placeholder="최대 5개까지 등록 가능합니다. 키워드 입력 후 엔터를 눌러주세요.">
	     </div>		
	     <input type="button" class="save_button" value="저장하기">
	     <input type="button" class="next_button" value="다음 단계">
</body>
</html>
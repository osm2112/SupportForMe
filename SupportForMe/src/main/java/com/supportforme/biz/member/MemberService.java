package com.supportforme.biz.member;

import java.util.List;

import com.supportforme.biz.test.UserDTO;
import com.supportforme.biz.test.UserSearchDTO;

public interface MemberService {

	//등록
	public int insertMember(MemberDTO dto);
	//수정
	public int updateMember(MemberDTO dto);
	//삭제(회원 탈퇴)
	public int deleteMember(MemberDTO dto);
	//단건 조회
	public MemberDTO getMember(MemberDTO dto);
	
	//전체 조회
	public List<MemberDTO> getMembers(MemberSerachDTO serachDTO);
	
	public int getCnt(MemberSerachDTO searchDTO); 
	
}

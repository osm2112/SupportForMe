package com.supportforme.biz.member.impl;

import java.util.List;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;
import com.supportforme.biz.test.UserDTO;

public class MemberDAO {
	public int insertMember(MemberDTO dto) {
		return 0;
	};

	// 수정
	public int updateMember(MemberDTO dto) {
		return 0;
	};

	// 삭제(회원 탈퇴)
	public int deleteMember(MemberDTO dto) {
		return 0;
	};

	// 단건 조회
	public UserDTO getMember(MemberDTO dto) {
		return null;
	
	};

	// 전체 조회
	public List<UserDTO> getMembers(MemberSerachDTO serachDTO){
		return null;
		
	};

	public int getCnt(MemberSerachDTO searchDTO) {
		return 0;
	}
}

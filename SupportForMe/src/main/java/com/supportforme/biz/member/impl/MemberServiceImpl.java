package com.supportforme.biz.member.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;
import com.supportforme.biz.member.MemberService;
import com.supportforme.biz.test.UserDTO;
import com.supportforme.biz.test.UserSearchDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Override
	public int insertMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO getMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberDTO> getMembers(MemberSerachDTO serachDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCnt(MemberSerachDTO searchDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

}

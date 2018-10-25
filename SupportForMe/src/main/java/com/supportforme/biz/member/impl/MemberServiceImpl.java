package com.supportforme.biz.member.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;
import com.supportforme.biz.member.MemberService;
import com.supportforme.biz.test.UserDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired	MemberDAO dao;
	@Override
	public int insertMember(MemberDTO dto) {
		return dao.insertMember(dto);
	}

	@Override
	public int updateMember(MemberDTO dto) {
		return dao.updateMember(dto);
	}

	@Override
	public int deleteMember(MemberDTO dto) {
		return dao.deleteMember(dto);
	}

	@Override
	public UserDTO getMember(MemberDTO dto) {
		return dao.getMember(dto);
	}

	@Override
	public List<MemberDTO> getMembers(MemberSerachDTO searchDTO) {
		return dao.getMembers(searchDTO);
	}

	@Override
	public int getCnt(MemberSerachDTO searchDTO) {
		return dao.getCnt(searchDTO);
	}

}

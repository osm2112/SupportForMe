package com.supportforme.biz.web.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;
import com.supportforme.biz.member.MemberService;

@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
	@RequestMapping("/insertMember.do")
	public String insertMember(MemberDTO dto) {
		memberService.insertMember(dto);
		return "redirect:";
	}
	
	//수정
	@RequestMapping("/updateMember.do")
	public String updateMember(MemberDTO dto) {
		memberService.updateMember(dto);
		return "redirect:";
	}
	//삭제(회원 탈퇴)
	@RequestMapping("/deleteMember.do")
	public String deleteMember(MemberDTO dto) {
		memberService.deleteMember(dto);
		return "redirect:";
	}
	
	//단건 조회
	@RequestMapping("/getMembers.do")
	public String getMember(Model model, MemberDTO dto) {
		memberService.getMember(dto);
		return "member/getMembers.jsp";
	}
	
	//전체 조회
	@RequestMapping("/getMember.do")
	public String getMembers(Model model, MemberSerachDTO serachDTO) {
		memberService.getMembers(serachDTO);
		return "member/getMember.jsp";
	}
	
}

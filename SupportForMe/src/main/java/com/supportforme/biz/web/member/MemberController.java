package com.supportforme.biz.web.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;
import com.supportforme.biz.member.MemberService;

@Controller
public class MemberController {
	@Autowired MemberService memberService;
	
	@RequestMapping("/InsertMember.do")
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
		model.addAttribute("member",memberService.getMember(dto));
		return "member/getMembers";
	}
	
	//전체 조회
	@RequestMapping("/getMember.do")
	public String getMembers(Model model, MemberSerachDTO serachDTO) {
		model.addAttribute("member",memberService.getMembers(serachDTO));
		return "member/getMember";
	}
	
	
	@RequestMapping("/MemberJoinForm.do")
	public String MemberJoinForm() {
		return "member/memberJoinForm";
	}
	
	
	@RequestMapping("/MemberLoginForm.do")
	public String LoininForm() {
		return "member/memberLoginForm";
	}
	
	@RequestMapping("/MemberUpdateForm.do")
	public String MemberUpdateForm(Model model, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");
		model.addAttribute("member", dto);
		return "member/memberUpdateForm";
	}
	
	
}

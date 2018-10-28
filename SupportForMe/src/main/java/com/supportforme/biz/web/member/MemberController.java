package com.supportforme.biz.web.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/InsertMember.do")
	public String insertMember(MemberDTO dto) {
		memberService.insertMember(dto);
		return "redirect:";
	}
	
	//수정
	@RequestMapping("/UpdateMember.do")
	public String updateMember(Model model,MemberDTO dto,HttpSession session) {
		memberService.updateMember(dto);
		session.removeAttribute("LoginInfo");
		session.setAttribute("LoginInfo", dto);
		model.addAttribute("msg","회원 정보가 정상 수정 되었습니다.");
		model.addAttribute("url","./MemberUpdateForm.do");
		return "commons/alertRedirect";
	}
	
/*	
 	//삭제(회원 탈퇴)
	@RequestMapping("/deleteMember.do")
	public String deleteMember(MemberDTO dto) {
		memberService.deleteMember(dto);
		return "redirect:";
	}
*/
	
	//단건 조회
	@RequestMapping("/getMember.do")
	public String getMember(Model model, MemberDTO dto) {
		model.addAttribute("member",memberService.getMember(dto));
		return "member/getMembers";
	}
	
	//전체 조회
	@RequestMapping("/getMembers.do")
	public String getMembers(Model model, MemberSerachDTO serachDTO) {
		model.addAttribute("member",memberService.getMembers(serachDTO));
		return "member/getMember";
	}
	
	
	@RequestMapping("/MemberJoinForm.do")
	public String MemberJoinForm() {
		return "member/memberJoinForm";
	}
	
	
	@RequestMapping("/MemberLoginForm.do")
	public String loininForm() {
		return "member/memberLoginForm";
	}
	
	@RequestMapping("/MemberTermsConfirmForm.do")
	public String memberTermsConfirmForm() {
		return "member/memberTermsConfirmForm";
	}
	
	@RequestMapping("/MemberUpdateConfirmForm.do")
	public String memberUpdateConfirmForm() {
		return "member/memberUpdateConfirmForm";
	}
	
	@RequestMapping("/MemberDeleteConfirmForm.do")
	public String memberDeleteConfirmForm() {
		return "member/memberDeleteConfirmForm";
	}
	
	
	@RequestMapping("/MemberUpdateForm.do")
	public String memberUpdateForm(Model model, HttpSession session, HttpServletRequest request) {
		MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");
		String ref =null;
		if(request.getHeader("referer") != null) {
			ref = request.getHeader("referer");
		}
	
		if (ref != null) {
			if (ref.equals("http://localhost:8181/SupportForMe/MemberUpdatePassWordCheck.do")) {
				model.addAttribute("member", dto);
				return "member/memberUpdateForm";
			} else {
				model.addAttribute("url", "./MemberUpdateConfirmForm.do");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("url", "./MemberUpdateConfirmForm.do");
			return "commons/alertRedirect";
		}
	}
	
	@RequestMapping("/MemberUpdatePassWordCheck.do")
	public String memberUpdatePassWordCheck(Model model,MemberDTO dto, HttpSession session, HttpServletRequest request) {
		String pw = null;
		String ref = null;
		if (request.getHeader("referer") != null) {
			ref = request.getHeader("referer");
		}
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		if (ref != null) {
			if (ref.equals("http://localhost:8181/SupportForMe/MemberUpdateConfirmForm.do")) {
				if (memberDTO != null) {
					pw = memberService.passwordCheck(memberDTO).getPassword();
				}
				if (pw != null) {
					if (pw.equals(dto.getPassword())) {
						model.addAttribute("url", "./MemberUpdateForm.do");
						return "commons/alertRedirect";
					} else {
						model.addAttribute("msg", "비밀번호가 틀렸습니다.");
						model.addAttribute("url", "./MemberUpdateConfirmForm.do");
						return "commons/alertRedirect";
					}
				} else {
					model.addAttribute("url", "./MemberUpdateConfirmForm.do");
					return "commons/alertRedirect";
				}
			} else {
				model.addAttribute("url", "./MemberUpdateConfirmForm.do");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("url", "./MemberUpdateConfirmForm.do");
			return "commons/alertRedirect";
		}
	}
	
	@RequestMapping("/MemberDeletePassWordCheck.do")
	public String memberDeletePassWordCheck(Model model,MemberDTO dto, HttpSession session, HttpServletRequest request) {
		String pw =null;
		String ref =null;
		if (request.getHeader("referer") != null) {
			ref = request.getHeader("referer");
		}
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		if(memberDTO != null) {
			pw = memberService.passwordCheck(memberDTO).getPassword();
		}
		if (ref != null) {
			if (ref.equals("http://localhost:8181/SupportForMe/MemberDeleteConfirmForm.do")) {
				if (pw != null) {
					if (pw.equals(dto.getPassword())) {
						memberService.deleteMember(memberDTO);
						session.invalidate();
						model.addAttribute("msg", "정상 탈퇴 되었습니다.");
						model.addAttribute("url", "./login.do");
						return "commons/alertRedirect";
					} else {
						model.addAttribute("msg", "비밀번호가 틀렸습니다.");
						model.addAttribute("url", "./MemberDeleteConfirmForm.do");
						return "commons/alertRedirect";
					}
				} else {
					model.addAttribute("url", "./MemberDeleteConfirmForm.do");
					return "commons/alertRedirect";
				}
			} else {
				model.addAttribute("url", "./MemberDeleteConfirmForm.do");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("url", "./MemberDeleteConfirmForm.do");
			return "commons/alertRedirect";
		}
	}
}

package com.supportforme.biz.web.member;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;
import com.supportforme.biz.member.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	JavaMailSender mailSender;

	@RequestMapping("/support/InsertMember")
	public String insertMember(MemberDTO dto, Model model) {
		memberService.insertMember(dto);
		model.addAttribute("url", "../main.jsp");
		return "commons/alertRedirect";
	}

	// 수정
	@RequestMapping("/forme/UpdateMember")
	public String updateMember(Model model, MemberDTO dto, HttpSession session) {
		memberService.updateMember(dto);
		session.removeAttribute("LoginInfo");
		session.setAttribute("LoginInfo", dto);
		model.addAttribute("msg", "회원 정보가 정상 수정 되었습니다.");
		model.addAttribute("url", "../forme/MemberUpdateForm");
		return "commons/alertRedirect";
	}

	/*
	 * //삭제(회원 탈퇴)
	 * 
	 * @RequestMapping("/deleteMember.do") public String deleteMember(MemberDTO dto)
	 * { memberService.deleteMember(dto); return "redirect:"; }
	 */

	// 단건 조회
	@RequestMapping("/forme/getMember")
	public String getMember(Model model, MemberDTO dto) {
		model.addAttribute("member", memberService.getMember(dto));
		return "member/getMembers";
	}

	// 전체 조회
	@RequestMapping("/forme/getMembers")
	public String getMembers(Model model, MemberSerachDTO serachDTO) {
		model.addAttribute("member", memberService.getMembers(serachDTO));
		return "member/getMember";
	}

	@RequestMapping("/support/MemberJoinForm")
	public String MemberJoinForm() {
		return "member/memberJoinForm";
	}

	@RequestMapping("/support/MemberLoginForm")
	public String loininForm() {
		return "member/memberLoginForm";
	}

	@RequestMapping("/support/MemberTermsConfirmForm")
	public String memberTermsConfirmForm() {
		return "member/memberTermsConfirmForm";
	}

	@RequestMapping("/forme/MemberUpdateConfirmForm")
	public String memberUpdateConfirmForm() {
		return "member/memberUpdateConfirmForm";
	}

	@RequestMapping("/forme/MemberDeleteConfirmForm")
	public String memberDeleteConfirmForm() {
		return "member/memberDeleteConfirmForm";
	}

	@RequestMapping("/forme/MemberUpdateForm")
	public String memberUpdateForm(Model model, HttpSession session, HttpServletRequest request) {
		MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");
		String ref = null;
		if (request.getHeader("referer") != null) {
			ref = request.getHeader("referer");
		}

		if (ref != null) {
			if (ref.equals("http://localhost:8181/SupportForMe/forme/MemberUpdatePassWordCheck")) {
				model.addAttribute("member", dto);
				return "/member/memberUpdateForm";
			} else {
				model.addAttribute("url", "../forme/MemberUpdateConfirmForm");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("url", "../forme/MemberUpdateConfirmForm");
			return "commons/alertRedirect";
		}
	}

	@RequestMapping("/forme/MemberUpdatePassWordCheck")
	public String memberUpdatePassWordCheck(Model model, MemberDTO dto, HttpSession session,
			HttpServletRequest request) {
		String pw = null;
		String ref = null;
		if (request.getHeader("referer") != null) {
			ref = request.getHeader("referer");
		}
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		if (ref != null) {
			if (ref.equals("http://localhost:8181/SupportForMe/forme/MemberUpdateConfirmForm")) {
				if (memberDTO != null) {
					pw = memberService.passwordCheck(memberDTO).getPassword();
				}
				if (pw != null) {
					if (pw.equals(dto.getPassword())) {
						model.addAttribute("url", "../forme/MemberUpdateForm");
						return "commons/alertRedirect";
					} else {
						model.addAttribute("msg", "비밀번호가 틀렸습니다.");
						model.addAttribute("url", "../forme/MemberUpdateConfirmForm");
						return "commons/alertRedirect";
					}
				} else {
					model.addAttribute("url", "../forme/MemberUpdateConfirmForm");
					return "commons/alertRedirect";
				}
			} else {
				model.addAttribute("url", "../forme/MemberUpdateConfirmForm");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("url", "../forme/MemberUpdateConfirmForm");
			return "commons/alertRedirect";
		}
	}

	@RequestMapping("/forme/MemberDeletePassWordCheck")
	public String memberDeletePassWordCheck(Model model, MemberDTO dto, HttpSession session,
			HttpServletRequest request) {
		String pw = null;
		String ref = null;
		if (request.getHeader("referer") != null) {
			ref = request.getHeader("referer");
		}
		MemberDTO memberDTO = new MemberDTO();
		memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		if (memberDTO != null) {
			pw = memberService.passwordCheck(memberDTO).getPassword();
		}
		if (ref != null) {
			if (ref.equals("http://localhost:8181/SupportForMe/forme/MemberDeleteConfirmForm")) {
				if (pw != null) {
					if (pw.equals(dto.getPassword())) {
						memberService.deleteMember(memberDTO);
						session.invalidate();
						model.addAttribute("msg", "정상 탈퇴 되었습니다.");
						model.addAttribute("url", "../support/login");
						return "commons/alertRedirect";
					} else {
						model.addAttribute("msg", "비밀번호가 틀렸습니다.");
						model.addAttribute("url", "../forme/MemberDeleteConfirmForm");
						return "commons/alertRedirect";
					}
				} else {
					model.addAttribute("url", "../forme/MemberDeleteConfirmForm");
					return "commons/alertRedirect";
				}
			} else {
				model.addAttribute("url", "../forme/MemberDeleteConfirmForm");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("url", "../forme/MemberDeleteConfirmForm");
			return "commons/alertRedirect";
		}
	}

	@RequestMapping("/support/CheckId")
	@ResponseBody
	public int CheckId(Model model, MemberDTO dto) {
		return memberService.CheckId(dto);
	}

	@RequestMapping("/support/FindId")
	public String findId(HttpServletRequest request, Model model, MemberDTO dto) {

		MemberDTO dto2 = new MemberDTO();
		dto2 = memberService.findId(dto);

		if (dto2 != null) {
			String email = dto2.getEmail();
			String userId = dto2.getUserId();

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom("ad20181029@gmail.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(email); // 받는사람 이메일
				messageHelper.setSubject("[중요] SupportForMe 관리자로부터"); // 메일제목은 생략이 가능하다
				messageHelper.setText(userId); // 메일 내용
				mailSender.send(message);
				model.addAttribute("msg", "메일이 정상적으로 발송되었습니다. 메일을 확인해 주세요 ");
				model.addAttribute("url", "../support/MemberLoginForm");
				return "commons/alertRedirect";
				
			} catch (Exception e) {
				System.out.println(e);
				model.addAttribute("msg", "메일 전송에 실패 하였습니다. 관리자에게 문의해 주세요.");
				model.addAttribute("url", "../support/MemberFindIdForm");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("msg", "입력하신 정보가 잘못되었습니다..");
			model.addAttribute("url", "../support/MemberFindIdForm");
			return "commons/alertRedirect";
		}
	}
	
	@RequestMapping("/support/MemberFindIdForm")
	public String memberFindIdForm() {
		return "member/memberFindIdForm";
	}
	
	
}

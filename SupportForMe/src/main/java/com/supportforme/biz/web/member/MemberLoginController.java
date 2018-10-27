package com.supportforme.biz.web.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberService;

@Controller
public class MemberLoginController {
	@Autowired
	MemberService memberService;

	// 로그인 폼
	@RequestMapping(value = { "/login.do"}, method = RequestMethod.GET)
	public String memberLogin(MemberDTO dto, HttpSession session, HttpServletRequest requset) {
		return "member/memberLoginForm";
	}

	// 로그인처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String memberLoginProc(Model model, MemberDTO dto, HttpSession session, HttpServletResponse response) throws IOException {
		MemberDTO memberDTO = memberService.getMember(dto);
		PrintWriter out = response.getWriter();
		if (memberDTO != null) {
			if (memberDTO.getUserId() != null) {
				if (memberDTO.getPassword() == null) {
					model.addAttribute("msg","탈퇴한 회원 입니다");
					model.addAttribute("url","./MemberLoginForm.do");
					return "commons/alertRedirect";
				} else {
					if (!memberDTO.getPassword().equals(dto.getPassword())) {
						model.addAttribute("msg","ID 또는 비밀번호가 잘못되었습니다.");
						model.addAttribute("url","./MemberLoginForm.do");
						return "commons/alertRedirect";
					} else {
						session.setAttribute("LoginInfo", memberDTO);
						MemberDTO memberDTO2 = (MemberDTO) session.getAttribute("LoginInfo");
						model.addAttribute("msg",memberDTO2.getName() + "님 로그인을 환영합니다.");
						model.addAttribute("url","./MemberLoginForm.do");
						return "commons/alertRedirect";
					}
				}
			} else {
				model.addAttribute("msg","ID 또는 비밀번호가 잘못되었습니다.");
				model.addAttribute("url","./MemberLoginForm.do");
				return "commons/alertRedirect";
			}
		} else {
			model.addAttribute("msg","ID 또는 비밀번호가 잘못되었습니다.");
			model.addAttribute("url","./MemberLoginForm.do");
			return "commons/alertRedirect";
		}
	}
	// 로그아웃처리
	@RequestMapping(value = "/logout.do")
	public String memberLogoutProc(HttpSession session) {
		session.invalidate();
		return "member/memberLoginForm";
	}
}

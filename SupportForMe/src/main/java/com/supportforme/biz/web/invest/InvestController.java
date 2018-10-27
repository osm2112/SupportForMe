package com.supportforme.biz.web.invest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supportforme.biz.invest.InvestSearchDTO;
import com.supportforme.biz.invest.InvestService;
import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;
import com.supportforme.biz.member.MemberService;

@Controller
public class InvestController {
	@Autowired InvestService investService;
	


	@RequestMapping("/get.do")
	public String getInvest(Model model, InvestSearchDTO searchDTO) {
		model.addAttribute("invest", investService.getInvests(searchDTO));
		return "member/getMembers";
	}
	

}

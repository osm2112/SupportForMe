package com.supportforme.biz.web.invest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.invest.InvestSearchDTO;
import com.supportforme.biz.invest.InvestService;
import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberService;


@Controller
public class InvestController {
	@Autowired InvestService investService;
	@Autowired MemberService memberService;
/*	
	@RequestMapping("/forme/InvestSelectRewardForm")
	public String investSelectRewardForm() {
		return "noNav/invest/investSelectRewardForm";
	}	
*/	
	@RequestMapping("/forme/AddrInput")
	@ResponseBody
	public MemberDTO addrInput(HttpSession session) {
		/*
		MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");
		*/
		MemberDTO dto = new MemberDTO();
		dto.setUserId("user2");
		return memberService.getMember(dto);
	}
	
	@RequestMapping("/forme/PaymentInfo")
	@ResponseBody
	public InvestDTO paymentInfo(HttpSession session, HttpServletRequest request) {
		/*
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		InvestDTO investDTO = new InvestDTO();
		investDTO.setInvestmentAmount(session.getAttribute("allAmount").toString());
		investDTO.setPostcode(request.getParameter("postcode"));
		investDTO.setAddress(request.getParameter("address"));
		investDTO.setAddrDetail(request.getParameter("addrDetail"));
		investDTO.setEmail(request.getParameter("email"));
		investDTO.setUserId(memberDTO.getUserId().toString());
		*/
		
		InvestDTO investDTO = new InvestDTO();
		investDTO.setInvestmentAmount(session.getAttribute("allAmount").toString());
		investDTO.setPostcode(request.getParameter("postcode"));
		investDTO.setAddress(request.getParameter("address"));
		investDTO.setAddrDetail(request.getParameter("addrDetail"));
		investDTO.setEmail(request.getParameter("email"));
		investDTO.setName(request.getParameter("name"));
		
		return investDTO;
	}
		
	@RequestMapping("/forme/InvestPaymentInfoForm")
	public String investPaymentInfoForm(InvestDTO dto, Model model, HttpSession session, HttpServletRequest request) {
		
		session.setAttribute("presentNo",request.getParameter("presentNo"));
		session.setAttribute("projectNo",request.getParameter("projectNo"));
		session.setAttribute("allAmount",request.getParameter("allAmount"));
		
		model.addAttribute("presentName", request.getParameter("presentName"));
		model.addAttribute("allAmount", request.getParameter("allAmount"));
		model.addAttribute("price2", request.getParameter("price2"));
		
		return "noNav/invest/investPaymentInfoForm";
	}
	
	
	@RequestMapping("/forme/InvestSelectReward")
	public String getPresentList(InvestDTO dto, Model model) {
		InvestDTO dto2 = new InvestDTO();
		dto2.setProjectNo("201810310005");
		List<Map<String,Object>> list = investService.getPresentList(dto2);
		model.addAttribute("presentList", list);
		return "noNav/invest/investSelectRewardForm";
	}
}

package com.supportforme.biz.web.invest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.supportforme.biz.common.Paging;
import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.invest.InvestSearchDTO;
import com.supportforme.biz.invest.InvestService;
import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberService;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectDetailPageService;
import com.supportforme.biz.project.ProjectService;
import com.supportforme.biz.test.UserSearchDTO;


@Controller
public class InvestController {
	@Autowired InvestService investService;
	@Autowired MemberService memberService;
	
	@RequestMapping("/forme/AddrInput")
	@ResponseBody
	public MemberDTO addrInput(HttpSession session) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");
		return dto;
	}
	
	
	
	@RequestMapping("/forme/MyInvestList")
	
	public String getMyInvestList(Model model, HttpSession session, InvestSearchDTO dto) {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		dto.setUserId(memberDTO.getUserId());
		dto.setStart(1);
		dto.setEnd(10);
		model.addAttribute("list",investService.getMyInvestList(dto));
		return "myNav/invest/investMyInvestList";
	}
	
	
	
	
	@RequestMapping("/forme/MyInvestListScroll")
	@ResponseBody
	public List<Map<String, Object>> getMyInvestListScroll(Model model, HttpSession session, InvestSearchDTO dto) {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		dto.setUserId(memberDTO.getUserId());
		dto.setStart(1);
		dto.setEnd(10);
		investService.getMyInvestList(dto);
		return investService.getMyInvestList(dto);
	}
	
	
	
	
	@RequestMapping("/forme/InvestList")	
	public String getInvests(Model model,InvestSearchDTO searchDTO, Paging paging, HttpSession session,HttpServletRequest request) {
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("LoginInfo");
		searchDTO.setUserId(memberDTO.getUserId());
		paging.setPageUnit(5);
		
		//현재페이지 번호 파라미터
		if(paging.getPage() ==null) {
			paging.setPage(1);
		}
		//전체 건수
		int total = investService.getCnt(searchDTO);
		paging.setTotalRecord(total);
		model.addAttribute("paging",paging);
		
		//시작 /마지막 레코드 번호
		searchDTO.setStart(paging.getFirst());
		searchDTO.setEnd(paging.getLast());

		model.addAttribute("searchCondition",request.getParameter("searchCondition"));
		model.addAttribute("searchKeyword",request.getParameter("searchKeyword"));
		model.addAttribute("startdate",request.getParameter("startdate"));
		model.addAttribute("enddate",request.getParameter("enddate"));
		model.addAttribute("payType",request.getParameter("payType"));
		
		model.addAttribute("list", investService.getInvests(searchDTO));
		return "myNav/invest/investLIstForm";
	}
	
	
	@RequestMapping("/forme/InvestDetail")	
	public String getInvest(Model model, InvestDTO dto) {
		model.addAttribute("invest", investService.getInvest(dto));
		return "myNav/invest/investDetailForm";
	}
	
	
	
	
	
	
	
	@RequestMapping("/forme/PaymentInfo")
	@ResponseBody
	public InvestDTO paymentInfo(HttpSession session, HttpServletRequest request) {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		InvestDTO investDTO = new InvestDTO();
		
		investDTO.setUserId(memberDTO.getUserId());
		investDTO.setInvestmentAmount(session.getAttribute("allAmount").toString());
		investDTO.setPostcode(request.getParameter("postcode"));
		investDTO.setAddress(request.getParameter("address"));
		investDTO.setAddrDetail(request.getParameter("addrDetail"));
		investDTO.setEmail(request.getParameter("email"));
		investDTO.setName(request.getParameter("name"));
		investDTO.setRequest(request.getParameter("request"));
		investDTO.setPhoneNum(request.getParameter("tel1")+'-'+request.getParameter("tel2")+'-'+request.getParameter("tel3"));
		investDTO.setPresentNo(session.getAttribute("presentNo").toString());
		investDTO.setProjectNo(session.getAttribute("projectNo").toString());
	
		return investDTO;
	}	
	
	@RequestMapping("/forme/PaymentEndProcess")
	@ResponseBody
	public void paymentEndProcess(HttpSession session, HttpServletRequest request) {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		InvestDTO investDTO = new InvestDTO();	
		investDTO.setUserId(memberDTO.getUserId());
		investDTO.setInvestmentAmount(session.getAttribute("allAmount").toString());
		investDTO.setPostcode(request.getParameter("postcode"));
		investDTO.setAddress(request.getParameter("address"));
		investDTO.setAddrDetail(request.getParameter("addrDetail"));
		investDTO.setEmail(request.getParameter("email"));
		investDTO.setName(request.getParameter("name"));
		investDTO.setRequest(request.getParameter("request"));
		investDTO.setPhoneNum(request.getParameter("tel1")+'-'+request.getParameter("tel2")+'-'+request.getParameter("tel3"));
		investDTO.setPresentNo(session.getAttribute("presentNo").toString());
		investDTO.setProjectNo(session.getAttribute("projectNo").toString());
		investDTO.setUuid(request.getParameter("uuid"));
		investService.insertInvest(investDTO);

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
	public String getPresentList(InvestDTO dto, Model model, HttpServletRequest request) {
		
		InvestDTO investDTO = new InvestDTO();
		investDTO.setProjectNo(request.getParameter("projectNo"));
		List<Map<String,Object>> list = investService.getPresentList(investDTO);
		model.addAttribute("presentList", list);
		return "noNav/invest/investSelectRewardForm";
	}
	
	//마이페이지 나의 투자자들 페이지 이동
	@RequestMapping("/forme/MyInvestors")
	public String myInvestors(InvestDTO dto, Model model) {
		return "myNav/mypage/mypageMyInvestor";
	}
	@RequestMapping("/forme/getInvestors")
	@ResponseBody
	public List<Map<String,Object>> getInvestors(InvestSearchDTO searchDTO, Paging paging, Model model, HttpSession session){
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("LoginInfo");
		System.out.println("==========아이디"+memberDTO.getUserId());
		searchDTO.setUserId(memberDTO.getUserId());
		
		paging.setPageUnit(5);
		
		//현재페이지 번호 파라미터
		if(paging.getPage() ==null) {
			paging.setPage(1);
		}
		//전체 건수
		int total = investService.getInvestorCnt(searchDTO);
		System.out.println("==========전체개수"+total);
		paging.setTotalRecord(total);
		model.addAttribute("paging",paging);
		
		//시작 /마지막 레코드 번호
		searchDTO.setStart(paging.getFirst());
		searchDTO.setEnd(paging.getLast());
		
		
		return investService.getMyInvestorList(searchDTO);
	}
}

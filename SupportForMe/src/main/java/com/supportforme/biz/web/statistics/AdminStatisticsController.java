package com.supportforme.biz.web.statistics;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.supportforme.biz.member.MemberDTO;


@Controller
public class AdminStatisticsController {

	
	@RequestMapping("/forme/AdminStatistics")
	@ResponseBody
	public MemberDTO addrInput(HttpSession session) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");
		return dto;
	}
	
	

}


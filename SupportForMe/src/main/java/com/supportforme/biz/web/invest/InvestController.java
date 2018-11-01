package com.supportforme.biz.web.invest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.invest.InvestSearchDTO;
import com.supportforme.biz.invest.InvestService;


@Controller
public class InvestController {
	@Autowired InvestService investService;
/*	
	@RequestMapping("/forme/InvestSelectRewardForm")
	public String investSelectRewardForm() {
		return "noNav/invest/investSelectRewardForm";
	}	
*/	
	
	
	@RequestMapping("/forme/investPaymentInfoForm")
	public String investPaymentInfoForm() {
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

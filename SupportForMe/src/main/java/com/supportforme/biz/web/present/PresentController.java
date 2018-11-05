package com.supportforme.biz.web.present;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supportforme.biz.present.PresentDTO;
import com.supportforme.biz.present.PresentService;

@Controller
public class PresentController {
	
	@Autowired PresentService presentService;
	
	@RequestMapping("/forme/insertReward")
	public Map<String,String> insertReward(PresentDTO pdto){
		
		presentService.insertPresent(pdto);
		
		System.out.println("presentNo=============="+pdto.getPresentNo());
		Map<String,String> map = new HashMap<String,String>();
		map.put("presentNo",pdto.getPresentNo());
		map.put("presentName", pdto.getPresentName());
		map.put("presentPrice", pdto.getPresentPrice());
		map.put("presentDeliveryDate", pdto.getPresentDeliveryDate());
		return map;
	}
}

package com.supportforme.biz.web.ex;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.hashtag.HashtagDTO;
import com.supportforme.biz.hashtag.HashtagService;

@Controller
public class HashtagController {
	
	@Autowired HashtagService service;
	
	@RequestMapping("/forme/insertHashtag")
	@ResponseBody
	public Map<String,String> insertHashtag(@ModelAttribute("hashtag") HashtagDTO htdto) {
		Set<String> set = new HashSet<String>();
		
		for(String st : htdto.getArrHashtag()) {
			set.add(st);
		}
		Iterator<String> hashIter = set.iterator();
		while(hashIter.hasNext()) {
			htdto.setHashtagName(hashIter.next().toString());
			service.insertHashtag(htdto);
		}
		Map<String,String> map = new HashMap<String,String>();
		map.put("code", "success");
		return map;
	}
	
}

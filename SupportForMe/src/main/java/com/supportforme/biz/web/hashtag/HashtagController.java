package com.supportforme.biz.web.hashtag;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.hashtag.HashtagDTO;
import com.supportforme.biz.hashtag.HashtagService;
import com.supportforme.biz.project.ProjectDTO;

@Controller
public class HashtagController {
	
	@Autowired HashtagService service;

	private Map<String,String> map = new HashMap<String,String>();
	
	@RequestMapping("/forme/insertHashtag")
	@ResponseBody
	public Map<String,String> insertHashtag(@ModelAttribute("hashtag") HashtagDTO htdto) {
		ProjectDTO dto = new ProjectDTO();
		
		dto.setProjectNo(htdto.getProjectNo());
		List<HashtagDTO> list = service.getHashtags(dto);
		
		Set<String> set = new HashSet<String>();
		for(String stHash : htdto.getArrHashtag()) {
			set.add(stHash);
		}
		Iterator<String> hashIter = set.iterator();
		
		if(list.size()>0) {
			for(HashtagDTO ht : list) {
				while(hashIter.hasNext()) {
					String tempHash = hashIter.next().toString();
					if(tempHash.equals(ht.getHashtagName())) {
						set.remove(tempHash);
					}
					
				}
				hashIter = set.iterator();	
			}
		}
		
		while(hashIter.hasNext()) {
			String tempHash = hashIter.next().toString();
			htdto.setHashtagName(tempHash);
			service.insertHashtag(htdto);
		}
		
		map.put("code", "success");
		return map;
	}
	
	@RequestMapping("/forme/deleteHashtag")
	@ResponseBody
	public Map<String,String> deleteHashtag(@ModelAttribute("hashtag") HashtagDTO htdto){
		service.deleteHashtag(htdto);
		map.put("code", "success");
		return map;
	}
	
}

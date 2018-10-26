package com.supportforme.biz.web.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.supportforme.biz.common.Paging;
import com.supportforme.biz.project.ProjectSearchDTO;
import com.supportforme.biz.project.ProjectService;

@Controller 	
public class ProjectController {

	@Autowired	 
	ProjectService projectService;
	//메인
	@RequestMapping("/main.do")  
	public String updateUserForm() {
		return "test/main";						
	}
	//검색
	@RequestMapping("/getProjects.do") 
	public ModelAndView getProjects(ModelAndView mv 
						  ,ProjectSearchDTO searchDto
						  ,Paging paging) {
		
		paging.setPageUnit(8);
		if ( paging.getPage() == null) { 
			searchDto.setStart(1);
		}	
		//전체 건수
		
		
		int total = projectService.getCnt(searchDto); 
		paging.setTotalRecord(total);
		mv.addObject("paging", paging); // 페이징객체를 뷰페이지로 전달
		// 시작/마지막 레코드 번호
		searchDto.setStart(paging.getFirst());
		searchDto.setEnd(paging.getLast());
		
		mv.addObject("count", total);
		mv.addObject("searchDTO", searchDto);
		mv.addObject("list", projectService.getProjects(searchDto)); // 목록조회해서 그결과를 model에 주고 뷰페이지로 return.
		mv.setViewName("projectselect/getProjects"); // ModelAndView의 view페이지
		return mv;				
	}
}

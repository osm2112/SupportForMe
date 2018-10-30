package com.supportforme.biz.web.project;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.supportforme.biz.common.Paging;
import com.supportforme.biz.project.ProjectDTO;
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
	@RequestMapping(value="/support/getProjects", method=RequestMethod.GET) 
	public String getProjects(Model model,
							ProjectSearchDTO searchDto
						  ,Paging paging) {
		System.out.println(searchDto.getSearchKeyword()+ ":               "+ searchDto.getStart());

		//전체 건수	
		int total = projectService.getCnt(searchDto); 
		paging.setTotalRecord(total);
		
		// 시작/마지막 레코드 번호
		searchDto.setStart(1);
		searchDto.setEnd(8);
		
		model.addAttribute("count", total);
		model.addAttribute("searchDTO", searchDto);
		model.addAttribute("list", projectService.getProjects(searchDto)); // 목록조회해서 그결과를 model에 주고 뷰페이지로 return.
		
		return "projectselect/getProjects";				
	}
	//test용
	@RequestMapping(value="/support/getProjects" , method=RequestMethod.POST)
	@ResponseBody
	public List<ProjectDTO> scrollData(ProjectSearchDTO searchDto){
		searchDto.setStart(1);
		searchDto.setEnd(4);
		return projectService.getProjects(searchDto);
	
	}
}


package com.supportforme.biz.web.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectRegisterService;

@Controller
public class projectRegisterController {
		
	@Autowired ProjectRegisterService projectService;
	
	@RequestMapping("/forme/tempMain")
	public String main() {
		return "register/main/tempMain";
	}
	
	
	@RequestMapping(value="/forme/registerProject", method=RequestMethod.GET )
	public String protectInsertProject() {
		return "register/main/tempMain";
	}
	
	@RequestMapping(value="/forme/registerProject", method=RequestMethod.POST )
	public String insertProject(@ModelAttribute("project") ProjectDTO dto , HttpSession session) {
//		MemberDTO member = (MemberDTO) session.getAttribute("LoginInfo");
//		dto.setUserId(member.getUserId());
		dto.setUserId("user2");
		projectService.insertProject(dto);
		return "redirect:/forme/make/"+dto.getProjectNo();	
	}
	
	@RequestMapping("/forme/make/{projectNo}")			
	public String makeProject(@ModelAttribute("project") ProjectDTO dto,@PathVariable String projectNo) {
		dto.setProjectNo(projectNo);
		return "register/projectRegisterBasic";
	}
	
	@RequestMapping("/forme/updateProject")
	public String updateProject(@ModelAttribute("project") ProjectDTO dto) {
//		MemberDTO member = (MemberDTO) session.getAttribute("LoginInfo");
//		dto.setUserId(member.getUserId());
		dto.setUserId("user2");
		projectService.updateProject(dto);
		return "register/projectRegisterStory";
	}
	
}

package com.supportforme.biz.web.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectRegisterService;

@Controller
public class projectRegisterController {
		
	@Autowired ProjectRegisterService projectService;
	
	//임시 메인 페이지
	@RequestMapping("/tempMain.do")
	public String tempMain() {
		return "register/main/tempMain";
	}
	
	@RequestMapping("/registerProject.do")
	public String insertProject(Model model, ProjectDTO dto , HttpSession session) {
//		MemberDTO member = (MemberDTO) session.getAttribute("LoginInfo");
//		dto.setUserId(member.getUserId());
		dto.setUserId("user2");
		projectService.insertProject(dto);
		model.addAttribute("project",dto);
		return "register/projectRegisterBasic";
	}
	
	@RequestMapping("/updateProject.do")
	public String updateProject(Model model,ProjectDTO dto) {
		projectService.updateProject(dto);
		model.addAttribute("project", dto);
		System.out.println("==========" + dto.getProjectNo());
		return "register/projectRegisterStory";
	}
	
}

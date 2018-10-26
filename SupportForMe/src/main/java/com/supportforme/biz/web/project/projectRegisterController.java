package com.supportforme.biz.web.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/insertProject.do")
	public String insertProject(Model model, ProjectDTO dto , HttpSession session) {
		//session.getAttribute();
		dto.setUserId("user2");
		model.addAttribute("projectNo", projectService.insertProject(dto));
		return "register/projectRegisterBasic";
	}
	
}

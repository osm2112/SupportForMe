package com.supportforme.biz;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.supportforme.biz.project.ProjectService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired	 
	ProjectService projectService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("Pick",projectService.getSupportForMePicks());
		model.addAttribute("Performance",projectService.getPerformanceProjects());
		model.addAttribute("Art",projectService.getArtProjects());
		model.addAttribute("Rank",projectService.getInvsetTop5());
		return "noNav/home";
	}
	
}

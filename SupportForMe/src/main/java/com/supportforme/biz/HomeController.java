package com.supportforme.biz;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.project.ProjectDTO;
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
		//최신 프로젝트조회
		model.addAttribute("Latest",projectService.getLatestProjects());
		model.addAttribute("Pick",projectService.getSupportForMePicks());
		model.addAttribute("Performance",projectService.getPerformanceProjects());
		model.addAttribute("Art",projectService.getArtProjects());
		model.addAttribute("Book",projectService.getBookProjects());
		model.addAttribute("Movie",projectService.getMovieProjects());
		model.addAttribute("Rank",projectService.getInvsetTop5());
		return "noNav/home";
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody
	public List<ProjectDTO> Rank(){
		return projectService.getInvsetTop5();
		
	
	}
}

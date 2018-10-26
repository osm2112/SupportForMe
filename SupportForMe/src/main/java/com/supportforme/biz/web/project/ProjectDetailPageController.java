package com.supportforme.biz.web.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supportforme.biz.comments.CommentsDTO;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectDetailPageService;

@Controller
public class ProjectDetailPageController {

	@Autowired ProjectDetailPageService projectDetailPageService;
	
	//
	@RequestMapping("/getProjectDetailPage.do")
	public String getProjectDetailPage(Model model,
									   ProjectDTO pjdto,
									   CommentsDTO cdto,
									   HttpSession session) {
		pjdto.setProjectNo("201810260001");
		cdto.setTopCommentNo("201810260001");	//댓글의 답글조회하려고
		model.addAttribute("project", projectDetailPageService.getProjectDetail(pjdto));
		model.addAttribute("hashtag", projectDetailPageService.getProjectHashtags(pjdto));
		model.addAttribute("present", projectDetailPageService.getProjectPresents(pjdto));
		model.addAttribute("comments", projectDetailPageService.getComments(pjdto));
		model.addAttribute("comments", projectDetailPageService.getReplyComments(cdto));
		return "/projectdetail/projectDetail";
	}
}

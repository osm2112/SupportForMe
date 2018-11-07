package com.supportforme.biz.web.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberService;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectDetailPageService;

@Controller
public class ProjectDetailPageController {

	@Autowired ProjectDetailPageService projectDetailPageService;
	@Autowired MemberService memberService;
	
	//프로젝트 상세 페이지
	@RequestMapping("/support/getProjectDetailPage")
	public String getProjectDetailPage(Model model,
									   ProjectDTO pjdto,
									   //CommentsDTO cdto,
									   HttpSession session) {
		pjdto.setProjectNo(pjdto.getProjectNo());		//"201810310001"
//		cdto.setTopCommentNo("201810260001");	//댓글의 답글조회하려고   
		
		model.addAttribute("project", projectDetailPageService.getProjectDetail(pjdto));
		model.addAttribute("hashtag", projectDetailPageService.getProjectHashtags(pjdto));
		model.addAttribute("invest", projectDetailPageService.getProjectAboutInvest(pjdto));
		model.addAttribute("present", projectDetailPageService.getProjectPresents(pjdto));
		model.addAttribute("presentCount", projectDetailPageService.getProjectPresentsCount(pjdto));
		model.addAttribute("member", (MemberDTO)session.getAttribute("LoginInfo"));
//		model.addAttribute("comments", projectDetailPageService.getComments(pjdto));
//		model.addAttribute("replyComments", projectDetailPageService.getReplyComments(cdto));
		return "noNav/projectdetail/projectDetail";
	}
}

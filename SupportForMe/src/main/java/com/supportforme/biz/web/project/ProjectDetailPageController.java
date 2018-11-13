package com.supportforme.biz.web.project;

import javax.servlet.http.HttpServletRequest;
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
									   HttpSession session,
									   HttpServletRequest request) {
		
		String refer = request.getHeader("referer");
		if(refer != null) {
			if(refer.contains("preview")) {
				model.addAttribute("preview", "p");
			};
		}
		pjdto.setProjectNo(pjdto.getProjectNo());
		
		model.addAttribute("project", projectDetailPageService.getProjectDetail(pjdto));
		model.addAttribute("hashtag", projectDetailPageService.getProjectHashtags(pjdto));
		model.addAttribute("invest", projectDetailPageService.getProjectAboutInvest(pjdto));
		model.addAttribute("present", projectDetailPageService.getProjectPresents(pjdto));
		model.addAttribute("presentCount", projectDetailPageService.getProjectPresentsCount(pjdto));
		model.addAttribute("pMember", (MemberDTO)session.getAttribute("LoginInfo"));

		return "noNav/projectdetail/projectDetail";
	}
}

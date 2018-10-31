package com.supportforme.biz.web.project;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectRegisterService;

@Controller
@SessionAttributes("project")
public class projectRegisterController {
		
	@Autowired ProjectRegisterService projectService;
	
	@RequestMapping("/forme/tempMain")
	public String main() {
		return "noNav/register/main/tempMain";
	}
	
	
	@RequestMapping(value="/forme/registerProject", method=RequestMethod.GET )
	public String protectInsertProject() {
		return "register/main/tempMain";
	}
	
	@RequestMapping(value="/forme/registerProject", method=RequestMethod.POST )
	public String insertProject(ProjectDTO dto , HttpSession session) {
//		MemberDTO member = (MemberDTO) session.getAttribute("LoginInfo");
//		dto.setUserId(member.getUserId());
		dto.setUserId("user2");
		projectService.insertProject(dto);
		return "redirect:/forme/make/"+dto.getProjectNo();	
	}
	
	@RequestMapping(value={"/forme/updateProject/story","/forme/updateProject/reward","/forme/updateProject/pay"})
	public String updateProject(@ModelAttribute("project") ProjectDTO dto,HttpServletRequest request
								,HttpSession session , SessionStatus status) {
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1);
		
		String introductionImg = "";
		if(dto.getArrImage() != null && dto.getArrImage().length>0) {
			for(String img : dto.getArrImage()) {
				introductionImg += (img + "||");
			}
			dto.setIntroductionImage(introductionImg);
		}
		projectService.updateProject(dto);
		
		if(("story").equals(com)) {
			return "ajax/register/projectRegisterStory";
		}else if(("reward").equals(com)){
			return "ajax/register/projectRegisterReward";
		}else if(("pay").equals(com)) {
			return "ajax/register/projectRegisterPay";
		}else {
			status.setComplete();
			session.removeAttribute("project");
			return "";
		}
		
		
	}
	
	@RequestMapping("/forme/make/{projectNo}")			
	public String makeProject(Model model,ProjectDTO dto,@PathVariable String projectNo) {
		dto.setProjectNo(projectNo);
		model.addAttribute("project", projectService.getProject(dto));
		return "rgNav/register/projectRegister";
	}
	
	
	
	@RequestMapping(value="/forme/make/fileUpload" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> fileUpload(@ModelAttribute("project") ProjectDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
		String folder = request.getSession().getServletContext().getRealPath("/upload");
		System.out.println("=========folder경로" + folder);
		
		//첨부파일 처리
		MultipartFile uploadFile = dto.getUploadFile();
		String filename = "";
		if(!uploadFile.isEmpty() && uploadFile.getSize() > 0) {
			String tempFn = uploadFile.getOriginalFilename();
			int index = tempFn.lastIndexOf(".");
			String realfilename = tempFn.substring(0, index);
			String extension = "." + tempFn.substring(index+1);
			filename = realfilename + System.currentTimeMillis() + extension; 
			uploadFile.transferTo(new File(folder,filename));
			System.out.println("=========이미지 업로드 파일명 " + filename);
		}
		

		Map<String,String> map = new HashMap<String,String>();
		map.put("code", "success");
		map.put("filename", filename);
		return map;
	}
	
}

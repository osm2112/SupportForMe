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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.supportforme.biz.hashtag.HashtagService;
import com.supportforme.biz.present.PresentService;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectRegisterService;

@Controller
public class projectRegisterController {
		
	@Autowired ProjectRegisterService projectService;
	@Autowired HashtagService hashtagService;
	@Autowired PresentService presentService;
	
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
	
	
	@RequestMapping("/forme/updateProject/story")
	public String updateProjectBasic(Model model, ProjectDTO dto) {
		
		if(dto.getProjectDeadline() != null) {
			String[] deadLine = dto.getProjectDeadline().split("-");
			dto.setProjectDeadline(deadLine[0].toString()+"."+deadLine[1].toString()+"."+deadLine[2].toString());
		}
		
		projectService.updateProject(dto);
		model.addAttribute("project", projectService.getProject(dto));
		return "ajax/register/projectRegisterStory";
	}
	
	@RequestMapping("/forme/updateProject/reward")
	public String updateProjectStory(Model model, ProjectDTO dto) {
		
		String introductionImg = "";
		if(dto.getArrImage() != null && dto.getArrImage().length>0) {
			for(String img : dto.getArrImage()) {
				introductionImg += (img + "||");
			}
		}
		dto.setIntroductionImage(introductionImg);

		String introductionVideo = "";
		if(dto.getArrVideo() != null && dto.getArrVideo().length>0) {
			for(String video : dto.getArrVideo()) {
				if(video != null && video != "") {
					int index = video.lastIndexOf("/");
					introductionVideo += (video.substring(index+1) + "||");	
				}
							
			}
		}
		dto.setIntroductionVideo(introductionVideo);
		
		projectService.updateProject(dto);
		model.addAttribute("project", projectService.getProject(dto));
		model.addAttribute("presentList",presentService.getPresents(dto));
		return "ajax/register/projectRegisterReward";
	}
	
	@RequestMapping("/forme/updateProject/pay")
	public String updateProject(Model model, ProjectDTO dto) {
		model.addAttribute("project", projectService.getProject(dto));	
		return "ajax/register/projectRegisterPay";
		
	}
	
	@RequestMapping("/forme/make/{projectNo}")			
	public String makeProject(Model model,ProjectDTO dto,@PathVariable String projectNo) {
		dto.setProjectNo(projectNo);
		model.addAttribute("hashtag", hashtagService.getHashtags(dto));  
		model.addAttribute("project", projectService.getProject(dto));
		return "rgNav/register/projectRegister";
	}
	
	
	
	@RequestMapping(value="/forme/fileUpload" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> fileUpload(@ModelAttribute("project") ProjectDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
		String folder = request.getSession().getServletContext().getRealPath("/upload");
//		String folder2 = "C:\\Users\\hyeon\\git\\SupportForMe\\SupportForMe\\src\\main\\webapp\\upload";
        
		File file = new File(folder);
        //디렉토리 존재하지 않을경우 디렉토리 생성
        if(!file.exists()) {
        	file.mkdirs();
        }
		
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
//			uploadFile.transferTo(new File(folder2,filename));
		}
		

		Map<String,String> map = new HashMap<String,String>();
		map.put("code", "success");
		map.put("filename", filename);
		return map;
	}
	
	@RequestMapping(value="/forme/deleteIntroductionImg")
	@ResponseBody
	public void deleteIntroductionImg(@RequestParam(value="removeIntroductionImg",required=false)String removeImg,HttpServletRequest request){
		 String folder =  request.getSession().getServletContext().getRealPath("/upload");// 삭제할 파일의 경로
		 File file = new File(folder,removeImg);
		 if(file.exists()){
			 file.delete();
		}
	}  
	
}

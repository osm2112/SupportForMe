package com.supportforme.biz.web.project;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value="/forme/make/fileUpload" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> fileUpload(@ModelAttribute("project") ProjectDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
		String folder = request.getSession().getServletContext().getRealPath("/upload");
		System.out.println("=========folder경로" + folder);
		
		//첨부파일 처리
		MultipartFile[] uploadFile = dto.getUploadFile();
		
		String Iimg = "";
		if(uploadFile.length == 1) {
			if(!uploadFile[0].isEmpty() && uploadFile[0].getSize() > 0) {
				dto.setImage(uploadFile[0].getOriginalFilename());
				uploadFile[0].transferTo(new File(folder,dto.getImage()));
				System.out.println("=========대표 이미지 업로드 " + dto.getImage());
			}
		}else {
			for(int i=0;i<uploadFile.length;i++) {
				//uploadfile size를 체크하여 제대로 업로드 되었는지 확인 
				if(!uploadFile[i].isEmpty() && uploadFile[i].getSize() > 0) {
					//파일명 중복 처리(FileRenamePolicy 추가)
					String filename = uploadFile[i].getOriginalFilename();
					uploadFile[i].transferTo(new File(folder,filename));
					Iimg += filename;
					dto.setIntroductionImage(Iimg);
				}
				Iimg += "||";
			}
			
		}

		Map<String,String> map = new HashMap<String,String>();
		map.put("code", "success");
		return map;
	}
	
}

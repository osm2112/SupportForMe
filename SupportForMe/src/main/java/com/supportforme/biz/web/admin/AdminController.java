package com.supportforme.biz.web.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.supportforme.biz.admin.AdminSearchDTO;
import com.supportforme.biz.admin.AdminService;
import com.supportforme.biz.common.Paging;
import com.supportforme.biz.member.MemberDTO;



@Controller
public class AdminController {
	@Autowired AdminService adminService;


	
	@RequestMapping("/forme/AdminMemberList")	
	public String getAdminMembers(Model model, AdminSearchDTO adminSearchDTO, Paging paging, HttpServletRequest request,HttpSession session ) {
		
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("LoginInfo");
		
		paging.setPageUnit(5);
		
		//현재페이지 번호 파라미터
		if(paging.getPage() ==null) {
			paging.setPage(1);
		}
		//전체 건수
		int total = adminService.getCntAdminMember(adminSearchDTO);
		paging.setTotalRecord(total);
		model.addAttribute("paging",paging);
		
		//시작 /마지막 레코드 번호
		adminSearchDTO.setStart(paging.getFirst());
		adminSearchDTO.setEnd(paging.getLast());

		model.addAttribute("searchCondition",request.getParameter("searchCondition"));
		model.addAttribute("searchKeyword",request.getParameter("searchKeyword"));		
		model.addAttribute("list", adminService.getAdminMembers(adminSearchDTO));
		
		return "adminNav/admin/adminMemberListForm";
	}
	

	@RequestMapping("/forme/AdminDeleteMembers")
	public String deleteAdminMembers(Model model,AdminSearchDTO adminSearchDTO, HttpServletRequest request) {
		String getIds =request.getParameter("ids");
		System.out.println(getIds);
		String[] ids = getIds.split("[|]");
		System.out.println(ids[0]);
		adminSearchDTO.setIds(ids);
		int result = adminService.deleteAdminMembers(adminSearchDTO);	
		if(result > 0) {
			model.addAttribute("msg", "선택한 회원은 탈퇴 처리 되었습니다.");
			model.addAttribute("url", "../forme/AdminMemberList");
			return "commons/alertRedirect";
		} else {
			model.addAttribute("msg", "선택한 회원이 없습니다.");
			model.addAttribute("url", "../forme/AdminMemberList");
			return "commons/alertRedirect";
		}	
	}
	
	@RequestMapping("/forme/AdminSupportForMePickList")	
	public String getAdminSupportForMePickList(Model model, AdminSearchDTO adminSearchDTO, Paging paging, HttpServletRequest request ) {
		
		paging.setPageUnit(5);
		
		//현재페이지 번호 파라미터
		if(paging.getPage() ==null) {
			paging.setPage(1);
		}
		//전체 건수
		int total = adminService.getCntAdminSupportForMePickUpList(adminSearchDTO);
		paging.setTotalRecord(total);
		model.addAttribute("paging",paging);
		
		//시작 /마지막 레코드 번호
		adminSearchDTO.setStart(paging.getFirst());
		adminSearchDTO.setEnd(paging.getLast());

		model.addAttribute("searchCondition",request.getParameter("searchCondition"));
		model.addAttribute("searchKeyword",request.getParameter("searchKeyword"));
		model.addAttribute("supportForMePickUp",request.getParameter("supportForMePickUp"));
		model.addAttribute("list", adminService.getAdminSupportForMePickUpList(adminSearchDTO));
		
		return "adminNav/admin/adminSupportForMePickListForm";
	}
	
	@RequestMapping("/forme/AdminSupportForMePick")
	public String adminSupportForMePick(Model model,AdminSearchDTO adminSearchDTO, HttpServletRequest request) {
		String getIds =request.getParameter("ids");
		String flag =request.getParameter("flag");			
		String[] ids = getIds.split("[|]");
		adminSearchDTO.setIds(ids);
		adminSearchDTO.setFlag(flag);
		
		int result = adminService.adminSupportForMePick(adminSearchDTO);	
		if(result > 0) {
			model.addAttribute("msg", "정상 처리 되었습니다.");
			model.addAttribute("url", "../forme/AdminSupportForMePickList");
			return "commons/alertRedirect";
		} else {
			model.addAttribute("msg", "선택한 회원이 없습니다.");
			model.addAttribute("url", "../forme/AdminSupportForMePickList");
			return "commons/alertRedirect";
		}	

	}
	

}

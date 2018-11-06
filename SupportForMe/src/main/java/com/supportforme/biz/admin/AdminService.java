package com.supportforme.biz.admin;


import java.util.List;
import java.util.Map;

import com.supportforme.biz.member.MemberDTO;


public interface AdminService {

	public List<Map<String, Object>> getAdminMembers(AdminSearchDTO serachDTO);
	
	public int getCntAdminMember(AdminSearchDTO searchDTO);
	
	public int deleteAdminMembers(AdminSearchDTO searchDTO);
	
}

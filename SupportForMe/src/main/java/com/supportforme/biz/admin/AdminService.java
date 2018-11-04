package com.supportforme.biz.admin;


import java.util.List;
import java.util.Map;


public interface AdminService {

	public List<Map<String, Object>> getAdminMembers(AdminSearchDTO serachDTO);
	
	public int getCntAdminMember(AdminSearchDTO searchDTO);
	
}

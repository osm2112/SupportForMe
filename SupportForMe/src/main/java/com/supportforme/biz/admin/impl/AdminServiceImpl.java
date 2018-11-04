package com.supportforme.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.admin.AdminDTO;
import com.supportforme.biz.admin.AdminSearchDTO;
import com.supportforme.biz.admin.AdminService;



@Service
public class AdminServiceImpl implements AdminService {

	
	@Autowired AdminDAO dao;

	@Override
	public List<Map<String, Object>> getAdminMembers(AdminSearchDTO serachDTO) {
		return dao.getAdminMembers(serachDTO);
	}

	@Override
	public int getCntAdminMember(AdminSearchDTO searchDTO) {
		return dao.getCntAdminMember(searchDTO);
	}
	
	
}

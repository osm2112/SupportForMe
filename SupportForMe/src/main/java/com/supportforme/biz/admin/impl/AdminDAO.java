package com.supportforme.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.admin.AdminDTO;
import com.supportforme.biz.admin.AdminSearchDTO;


@Repository
public class AdminDAO {
	@Autowired 
	SqlSessionTemplate mybatis;
	
	//단건 조회
	public Map<String, Object> getAdminMembers(AdminDTO dto) {
		return mybatis.selectOne("admin.getAdmin", dto);
	}

	


}

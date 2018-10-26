package com.supportforme.biz.project.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.project.ProjectDTO;

@Repository
public class ProjectRegisterDAO {
	
	@Autowired SqlSessionTemplate mybatis;
	
	//프로젝트 단건 조회
	public ProjectDTO getProject(ProjectDTO dto) {
		return mybatis.selectOne("project.getProject", dto);
	}
	
	//프로젝트 등록
	public int insertProject(ProjectDTO dto) {
		return mybatis.insert("project.insertProject", dto);
	}
	
	//프로젝트 수정
	public int updateProject(ProjectDTO dto) {
		return mybatis.update("project.updateProject", dto);
	}
	
}
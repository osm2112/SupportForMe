package com.supportforme.biz.project.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectSearchDTO;

@Repository
public class ProjectDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	//전체조회
	public List<ProjectDTO> getProjects(ProjectSearchDTO searchDto) {
		System.out.println("==============프로젝트 목록 조회==========="); 
		return mybatis.selectList("project.getProjects", searchDto);  
	}
	//건수 조회
	public int getCnt(ProjectSearchDTO searchDto) {
		System.out.println("==============프로젝트 전체 건수 조회==============");
		return mybatis.selectOne("project.getCnt", searchDto);
	}

}

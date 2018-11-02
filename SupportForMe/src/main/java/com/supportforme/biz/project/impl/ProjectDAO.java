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
	//공연조회
	public List<ProjectDTO> getPerformanceProjects() {
		return mybatis.selectList("project.getPerformanceProjects");
	}
	//미술조회
	public List<ProjectDTO> getArtProjects() {
		// TODO Auto-generated method stub
		return mybatis.selectList("project.getArtProjects");
	}
	
	//건수 조회
	public int getCnt(ProjectSearchDTO searchDto) {
		System.out.println("==============프로젝트 전체 건수 조회==============");
		return mybatis.selectOne("project.getCnt", searchDto);
	}
	//랭킹 조회
	public List<ProjectDTO> getInvsetTop5(){
		return mybatis.selectList("project.getInvsetTop5");
	}
	//서포미픽 조회
	public List<ProjectDTO> getSupportForMePicks(){
		return mybatis.selectList("project.getSupportForMePicks");
	}

}

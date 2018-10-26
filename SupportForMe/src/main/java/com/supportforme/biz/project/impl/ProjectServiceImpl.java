package com.supportforme.biz.project.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectSearchDTO;
import com.supportforme.biz.project.ProjectService;
import com.supportforme.biz.project.ProjectService;

//유저 서비스 실행
@Service 
public class ProjectServiceImpl implements ProjectService {

	@Autowired ProjectDAO dao; // Mybatis로 만든 ProjectDAO
	
	//전체조회
	@Override
	public List<ProjectDTO> getProjects(ProjectSearchDTO searchDto) {
		System.out.println("프로젝트 목록 조회"); 
		return dao.getProjects(searchDto); // 핵심관심
	}
	//건수조회
	@Override
	public int getCnt(ProjectSearchDTO searchDto) {
		// TODO Auto-generated method stub
		return dao.getCnt(searchDto);
	}
}

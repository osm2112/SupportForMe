package com.supportforme.biz.project;

public interface ProjectRegisterService {
	
	//프로젝트 단건 조회
	public ProjectDTO getProject(ProjectDTO dto);
	
	//프로젝트 등록
	public int insertProject(ProjectDTO dto);
	
	//프로젝트 수정
	public int updateProject(ProjectDTO dto);
}

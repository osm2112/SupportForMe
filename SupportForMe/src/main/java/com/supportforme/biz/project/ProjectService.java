package com.supportforme.biz.project;

import java.util.List;

public interface ProjectService {
	
	//전체조회
	public List<ProjectDTO> getProjects(ProjectSearchDTO searchDto);

	//공연조회
	public List<ProjectDTO> getPerformanceProjects();

	//미술조회
	public List<ProjectDTO> getArtProjects();

	//건수조회
	public int getCnt(ProjectSearchDTO searchDto);
	
}

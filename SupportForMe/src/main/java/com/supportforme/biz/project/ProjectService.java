package com.supportforme.biz.project;

import java.util.List;

public interface ProjectService {
	
	//전체검색결과조회, 분야별 결과 조회
	public List<ProjectDTO> getProjects(ProjectSearchDTO searchDto);

	//공연조회
	public List<ProjectDTO> getPerformanceProjects();

	//미술조회
	public List<ProjectDTO> getArtProjects();
	
	//도서조회
	public List<ProjectDTO> getBookProjects();
		
	//영화조회
	public List<ProjectDTO> getMovieProjects();

	//건수조회
	public int getCnt(ProjectSearchDTO searchDto);
	
	//랭크조회
	public List<ProjectDTO> getInvsetTop5();
	
	//서포미픽 조회
	public List<ProjectDTO> getSupportForMePicks();
}

package com.supportforme.biz.statistics.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectSearchDTO;

@Repository
public class AdminStatisticDAO {
	@Autowired
	SqlSessionTemplate mybatis;
/*	//전체검색 결과조회, 분야별 결과 조회
	public List<ProjectDTO> getProjects() {
		return mybatis.selectList("project.getProjects", searchDto);  
	}
*/

}

package com.supportforme.biz.statistics.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.statistics.AdminStatisticDTO;

@Repository
public class AdminStatisticDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	public List<Map<String, Object>> memberJoinStatisticsMonth(AdminStatisticDTO dto) {
		return mybatis.selectList("statistics.memberJoinStatisticsMonth", dto);
	}
}

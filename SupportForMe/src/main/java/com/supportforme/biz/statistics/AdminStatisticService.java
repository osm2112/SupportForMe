package com.supportforme.biz.statistics;

import java.util.List;
import java.util.Map;

public interface AdminStatisticService {
	public List<Map<String, Object>>  memberJoinStatisticsMonth(AdminStatisticDTO dto);
	
}

package com.supportforme.biz.invest.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.invest.InvestSearchDTO;


@Repository
public class InvestDAO {
	@Autowired 
	SqlSessionTemplate mybatis;
	
	//등록
	public int insertInvest(InvestDTO dto) {
		return mybatis.insert("insertInvest", dto);
	}
	
	//수정
	public int updateInvest(InvestDTO dto) {
		return 0;
	}
	
	//삭제(회원 탈퇴)
	public int deleteInvest(InvestDTO dto) {
		return 0;
	}
	
	//단건 조회
	public InvestDTO getInvest(InvestDTO dto) {
		return null;
	}
	 
	//전체 조회
	public List<InvestDTO> getInvests(InvestSearchDTO serachDTO) {
		return null;
	}
	
	public int getCnt(InvestSearchDTO searchDTO) {
		return 0;
	}

	public List<Map<String, Object>>  getPresentList(InvestDTO dto){
		return mybatis.selectList("getPresentList", dto);
		
	}

}

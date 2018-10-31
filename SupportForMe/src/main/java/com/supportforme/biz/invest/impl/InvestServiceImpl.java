package com.supportforme.biz.invest.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.invest.InvestSearchDTO;
import com.supportforme.biz.invest.InvestService;



@Service
public class InvestServiceImpl implements InvestService {

	
	@Autowired InvestDAO dao;
	
	@Override
	public int insertInvest(InvestDTO dto) {
		return dao.insertInvest(dto);
	}

	@Override
	public int updateInvest(InvestDTO dto) {
		return dao.updateInvest(dto);
	}

	@Override
	public int deleteInvest(InvestDTO dto) {
		return dao.deleteInvest(dto);
	}

	@Override
	public InvestDTO getInvest(InvestDTO dto) {
		return dao.getInvest(dto);
	}

	@Override
	public List<InvestDTO> getInvests(InvestSearchDTO serachDTO) {
		return dao.getInvests(serachDTO);
	}

	@Override
	public int getCnt(InvestSearchDTO searchDTO) {
		return dao.getCnt(searchDTO);
	}

	@Override
	public List<Map<String, Object>> getPresentList(InvestDTO dto) {
		return dao.getPresentList(dto);
	}
}

package com.supportforme.biz.present.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.present.PresentDTO;
import com.supportforme.biz.present.PresentService;

@Service
public class PresentServicelImpl implements PresentService {

	@Autowired PresentDAO pdao;
	
	@Override
	public PresentDTO getPresent(PresentDTO pdto) {
		return pdao.getPresent(pdto);
	}

	@Override
	public int insertPresent(PresentDTO pdto) {
		return pdao.insertPresent(pdto);
	}

	@Override
	public int updatePresent(PresentDTO pdto) {
		return pdao.updatePresent(pdto);
	}

	@Override
	public int deletePresent(PresentDTO pdto) {
		return pdao.deletePresent(pdto);
	}

}

package com.supportforme.biz.present;

public interface PresentService {
	
	//선물 단건 조회
	public PresentDTO getPresent(PresentDTO pdto);
	
	//선물 등록
	public int insertPresent(PresentDTO pdto);
	
	//선물 수정
	public int updatePresent(PresentDTO pdto);
	
	//선물 삭제
	public int deletePresent(PresentDTO pdto);
}

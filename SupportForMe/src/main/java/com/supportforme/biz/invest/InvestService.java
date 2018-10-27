package com.supportforme.biz.invest;


import java.util.List;


public interface InvestService {

	//등록
	public int insertInvest(InvestDTO dto);
	//수정
	public int updateInvest(InvestDTO dto);
	//삭제(회원 탈퇴)
	public int deleteInvest(InvestDTO dto);
	//단건 조회
	public InvestDTO getInvest(InvestDTO dto);
	 
	//전체 조회
	public List<InvestDTO> getInvests(InvestSearchDTO serachDTO);
	
	public int getCnt(InvestSearchDTO searchDTO); 
	

	
}

package com.supportforme.biz.web.invest;

public class InvestDTO {
	private String investNo;
	private String investmentAmount;
	private String totalInvestAmount;  //컬럼엔 없는데 필요해서 만들었어요(김효정^^
	private String payType;
	private String presentNo;
	private String userId;
	private String projectNo;
	private String paymentState;
	
	public String getTotalInvestAmount() {
		return totalInvestAmount;
	}
	public void setTotalInvestAmount(String totalInvestAmount) {
		this.totalInvestAmount = totalInvestAmount;
	}
	public String getInvestNo() {
		return investNo;
	}
	public void setInvestNo(String investNo) {
		this.investNo = investNo;
	}
	public String getInvestmentAmount() {
		return investmentAmount;
	}
	public void setInvestmentAmount(String investmentAmount) {
		this.investmentAmount = investmentAmount;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPresentNo() {
		return presentNo;
	}
	public void setPresentNo(String presentNo) {
		this.presentNo = presentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getPaymentState() {
		return paymentState;
	}
	public void setPaymentState(String paymentState) {
		this.paymentState = paymentState;
	}
	
	@Override
	public String toString() {
		return "InvestDTO [investNo=" + investNo + ", investmentAmount=" + investmentAmount + ", totalInvestAmount="
				+ totalInvestAmount + ", payType=" + payType + ", presentNo=" + presentNo + ", userId=" + userId
				+ ", projectNo=" + projectNo + ", paymentState=" + paymentState + "]";
	}
	
}

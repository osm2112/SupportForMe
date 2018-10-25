package com.supportforme.biz.invest;

public class InvestDTO {
	private String investNo;
	private String investmentAmount;
	private String payType;
	private String presentNo;
	private String userId;
	private String projectNo;
	private String paymentState;
	
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
		return "InvestDTO [investNo=" + investNo + ", investmentAmount=" + investmentAmount + ", payType=" + payType
				+ ", presentNo=" + presentNo + ", userId=" + userId + ", projectNo=" + projectNo + ", paymentState="
				+ paymentState + "]";
	}
	
}
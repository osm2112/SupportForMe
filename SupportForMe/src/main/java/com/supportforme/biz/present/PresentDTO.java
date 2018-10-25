package com.supportforme.biz.present;

public class PresentDTO {
	private String presentNo;
	private String presentPrice;
	private String presentName;
	private String projectNo;
	
	public String getPresentNo() {
		return presentNo;
	}
	public void setPresentNo(String presentNo) {
		this.presentNo = presentNo;
	}
	public String getPresentPrice() {
		return presentPrice;
	}
	public void setPresentPrice(String presentPrice) {
		this.presentPrice = presentPrice;
	}
	public String getPresentName() {
		return presentName;
	}
	public void setPresentName(String presentName) {
		this.presentName = presentName;
	}
	
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	@Override
	public String toString() {
		return "PresentDTO [presentNo=" + presentNo + ", presentPrice=" + presentPrice + ", presentName=" + presentName
				+ ", projectNo=" + projectNo + "]";
	}
	
	
}

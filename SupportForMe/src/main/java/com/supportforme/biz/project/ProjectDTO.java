package com.supportforme.biz.project;

public class ProjectDTO {
	private String projectNo;
	private String projectName;
	private String image;
	private String targetAmount;
	private String projectDeadline;
	private String introductionVideo;
	private String story;
	private String depositAccount;
	private String bankCode;
	private String progress;
	private String userId;
	private String introductionImage;
	private String supportPickYn;
	private String deliveryDate;
	private String categoryCode;
	
	
	
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTargetAmount() {
		return targetAmount;
	}
	public void setTargetAmount(String targetAmount) {
		this.targetAmount = targetAmount;
	}
	public String getProjectDeadline() {
		return projectDeadline;
	}
	public void setProjectDeadline(String projectDeadline) {
		this.projectDeadline = projectDeadline;
	}
	public String getIntroductionVideo() {
		return introductionVideo;
	}
	public void setIntroductionVideo(String introductionVideo) {
		this.introductionVideo = introductionVideo;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getDepositAccount() {
		return depositAccount;
	}
	public void setDepositAccount(String depositAccount) {
		this.depositAccount = depositAccount;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getIntroductionImage() {
		return introductionImage;
	}
	public void setIntroductionImage(String introductionImage) {
		this.introductionImage = introductionImage;
	}
	public String getSupportPickYn() {
		return supportPickYn;
	}
	public void setSupportPickYn(String supportPickYn) {
		this.supportPickYn = supportPickYn;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	@Override
	public String toString() {
		return "ProjectDTO [projectNo=" + projectNo + ", projectName=" + projectName + ", image=" + image
				+ ", targetAmount=" + targetAmount + ", projectDeadline=" + projectDeadline + ", introductionVideo="
				+ introductionVideo + ", story=" + story + ", depositAccount=" + depositAccount + ", bankCode="
				+ bankCode + ", progress=" + progress + ", userId=" + userId + ", introductionImage="
				+ introductionImage + ", supportPickYn=" + supportPickYn + ", deliveryDate=" + deliveryDate
				+ ", categoryCode=" + categoryCode + "]";
	}
	
	
}

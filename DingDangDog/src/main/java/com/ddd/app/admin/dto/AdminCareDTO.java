package com.ddd.app.admin.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class AdminCareDTO {

	private int careNumber;
	private int userNumber;
	private String careTitle;
	private String carePost;
	private LocalDateTime careDate;
	private int careRecruit;
	private LocalDateTime careWriteDate;
	private String careStatus;
	private String userNickname;
	private String userName;
	private String userPhone;
	private int applyNumber;
	private String applyStatus;
	private int applyCount;
	
	public int getApplyCount() {
		return applyCount;
	}
	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}
	public String getApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}
	public int getCareNumber() {
		return careNumber;
	}
	public void setCareNumber(int careNumber) {
		this.careNumber = careNumber;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public String getCareTitle() {
		return careTitle;
	}
	public void setCareTitle(String careTitle) {
		this.careTitle = careTitle;
	}
	public String getCarePost() {
		return carePost;
	}
	public void setCarePost(String carePost) {
		this.carePost = carePost;
	}
	public String getCareDate() {
		if (careDate == null)
			return "";
		return careDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	public void setCareDate(LocalDateTime careDate) {
		this.careDate = careDate;
	}
	public int getCareRecruit() {
		return careRecruit;
	}
	public void setCareRecruit(int careRecruit) {
		this.careRecruit = careRecruit;
	}
	public String getCareWriteDate() {
		if (careWriteDate == null)
			return "";
		return careWriteDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	public void setCareWriteDate(LocalDateTime careWriteDate) {
		this.careWriteDate = careWriteDate;
	}
	public String getCareStatus() {
		return careStatus;
	}
	public void setCareStatus(String careStatus) {
		this.careStatus = careStatus;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getApplyNumber() {
		return applyNumber;
	}
	public void setApplyNumber(int applyNumber) {
		this.applyNumber = applyNumber;
	}
	
	@Override
	public String toString() {
		return "AdminCareDTO [careNumber=" + careNumber + ", userNumber=" + userNumber + ", careTitle=" + careTitle
				+ ", carePost=" + carePost + ", careDate=" + careDate + ", careRecruit=" + careRecruit
				+ ", careWriteDate=" + careWriteDate + ", careStatus=" + careStatus + ", userNickname=" + userNickname
				+ ", userName=" + userName + ", userPhone=" + userPhone + ", applyNumber=" + applyNumber + "]";
	}

}

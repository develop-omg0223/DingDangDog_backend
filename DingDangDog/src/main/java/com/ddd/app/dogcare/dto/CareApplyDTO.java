package com.ddd.app.dogcare.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CareApplyDTO {
//	CREATE TABLE ddd_care_apply(
//			   apply_number NUMBER,
//			   care_number NUMBER,
//			   user_number NUMBER,
//			   apply_date DATE DEFAULT SYSDATE NOT NULL,
	
	private int applyNumber;
	private int careNumber;
	private String userNickname;
	private int userNumber;
	private LocalDateTime applyDate;
	private String userName;
	private String userPhone;

	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getApplyNumber() {
		return applyNumber;
	}
	public void setApplyNumber(int applyNumber) {
		this.applyNumber = applyNumber;
	}
	public int getCareNumber() {
		return careNumber;
	}
	public void setCareNumber(int careNumber) {
		this.careNumber = careNumber;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public LocalDateTime getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(LocalDateTime applyDate) {
		this.applyDate = applyDate;
	}
	
	private static final DateTimeFormatter DATE_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	public String getCareDateStr() {
		if (applyDate == null)
			return "";
		return applyDate.format(DATE_FORMAT);
	}
	
	@Override
	public String toString() {
		return "CareApplyDTO [applyNumber=" + applyNumber + ", careNumber=" + careNumber + ", userNickname="
				+ userNickname + ", userNumber=" + userNumber + ", applyDate=" + applyDate + "]";
	}
	
}

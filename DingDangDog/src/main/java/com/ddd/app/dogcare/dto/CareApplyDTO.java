package com.ddd.app.dogcare.dto;

import java.sql.Date;

public class CareApplyDTO {
//	CREATE TABLE ddd_care_apply(
//			   apply_number NUMBER,
//			   care_number NUMBER,
//			   user_number NUMBER,
//			   apply_date DATE DEFAULT SYSDATE NOT NULL,
	
	private int applyNumber;
	private int careNumber;
	private int userNumber;
	private Date applyDate;
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
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	
	@Override
	public String toString() {
		return "CareApplyDTO [applyNumber=" + applyNumber + ", careNumber=" + careNumber + ", userNumber=" + userNumber
				+ ", applyDate=" + applyDate + "]";
	}
	
}

package com.ddd.app.dogcare.dto;

import java.sql.Date;

public class CareListDTO {
	private int careNumber;
	private String careTitle;
	private Date careDate;
	private String userNickname;
	private Date careWriteDate;
	
	public int getCareNumber() {
		return careNumber;
	}
	public void setCareNumber(int careNumber) {
		this.careNumber = careNumber;
	}
	public String getCareTitle() {
		return careTitle;
	}
	public void setCareTitle(String careTitle) {
		this.careTitle = careTitle;
	}
	public Date getCareDate() {
		return careDate;
	}
	public void setCareDate(Date careDate) {
		this.careDate = careDate;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public Date getCareWriteDate() {
		return careWriteDate;
	}
	public void setCareWriteDate(Date careWriteDate) {
		this.careWriteDate = careWriteDate;
	}
	
	@Override
	public String toString() {
		return "CareListDTO [careNumber=" + careNumber + ", careTitle=" + careTitle + ", careDate=" + careDate
				+ ", userNickname=" + userNickname + ", careWriteDate=" + careWriteDate + "]";
	}
	
	
}

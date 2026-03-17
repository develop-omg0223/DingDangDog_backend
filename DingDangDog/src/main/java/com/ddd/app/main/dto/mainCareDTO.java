package com.ddd.app.main.dto;

import java.util.Date;

public class mainCareDTO {
	private int careNumber;
	private String careTitle;
	private Date careDate;
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
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	
}

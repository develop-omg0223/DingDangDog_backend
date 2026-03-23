package com.ddd.app.dogcare.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CareListDTO {
	private int careNumber;
	private String careTitle;
	private LocalDateTime careDate;
	private String shelterName;
	private LocalDateTime careWriteDate;
	private String applyStatus;
	
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
	public String getCareTitle() {
		return careTitle;
	}
	public void setCareTitle(String careTitle) {
		this.careTitle = careTitle;
	}
	public String getCareDate() {
		if (careDate == null)
			return "";
		return careDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	public void setCareDate(LocalDateTime careDate) {
		this.careDate = careDate;
	}
	public String getShelterName() {
		return shelterName;
	}
	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}
	public String getCareWriteDate() {
		if (careWriteDate == null)
			return "";
		return careWriteDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	public void setCareWriteDate(LocalDateTime careWriteDate) {
		this.careWriteDate = careWriteDate;
	}
	@Override
	public String toString() {
		return "CareListDTO [careNumber=" + careNumber + ", careTitle=" + careTitle + ", careDate=" + careDate
				+ ", shelterName=" + shelterName + ", careWriteDate=" + careWriteDate + ", applyStatus=" + applyStatus
				+ "]";
	}
	

	
	
}

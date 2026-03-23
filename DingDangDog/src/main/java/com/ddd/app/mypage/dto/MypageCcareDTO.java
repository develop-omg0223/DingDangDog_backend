package com.ddd.app.mypage.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MypageCcareDTO {
//	-- 멍케어 신청목록 조회
//	SELECT
//	    CA.APPLY_NUMBER,
//	    C.CARE_NUMBER,
//	    TO_CHAR(C.CARE_DATE, 'YYYY-MM-DD') AS CARE_DATE,
//	    C.CARE_TITLE,
//	    US.SHELTER_NAME
//	FROM DDD_CARE_APPLY CA, DDD_CARE C, DDD_USER_SHELTER US
//	WHERE CA.CARE_NUMBER = C.CARE_NUMBER
//	  AND C.USER_NUMBER = US.USER_NUMBER
//	  AND CA.USER_NUMBER = 10002
//	ORDER BY CA.APPLY_NUMBER DESC;
//
//	-- 봉사 신청취소
//	DELETE FROM DDD_CARE_APPLY
//	WHERE APPLY_NUMBER = 17 AND USER_NUMBER = 10002;
	
	private int applyNumber;
	private int careNumber;
	private LocalDateTime careDate;
	private String shelterName;
	private int userNumber;
	private String careTitle;
	
	public String getCareTitle() {
		return careTitle;
	}
	public void setCareTitle(String careTitle) {
		this.careTitle = careTitle;
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
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	
	@Override
	public String toString() {
		return "MypageCcareDTO [applyNumber=" + applyNumber + ", careNumber=" + careNumber + ", careDate=" + careDate
				+ ", shelterName=" + shelterName + ", userNumber=" + userNumber + "]";
	}
	
}

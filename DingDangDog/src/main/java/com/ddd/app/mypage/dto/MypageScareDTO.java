package com.ddd.app.mypage.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MypageScareDTO {
//	SELECT
//    C.CARE_NUMBER,
//    C.CARE_TITLE,
//    TO_CHAR(C.CARE_WRITE_DATE, 'YYYY-MM-DD') AS CARE_WRITE_DATE,
//    NVL(A.APPLY_COUNT, 0) AS APPLY_COUNT,
//    C.CARE_RECRUIT
//FROM DDD_CARE C
//LEFT JOIN (
//    SELECT 
//        CA.CARE_NUMBER, 
//        COUNT(*) AS APPLY_COUNT
//    FROM DDD_CARE_APPLY CA
//    GROUP BY CA.CARE_NUMBER
//) A ON C.CARE_NUMBER = A.CARE_NUMBER
//WHERE C.USER_NUMBER = 3
//ORDER BY C.CARE_NUMBER DESC;
	
	private int careNumber;
	private String careTitle;
	private LocalDateTime careDate;
	private int careRecruit;
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
	public int getCareRecruit() {
		return careRecruit;
	}
	public void setCareRecruit(int careRecruit) {
		this.careRecruit = careRecruit;
	}
	
	@Override
	public String toString() {
		return "MypageScareDTO [careNumber=" + careNumber + ", careTitle=" + careTitle + ", careDate=" + careDate
				+ ", careRecruit=" + careRecruit + "]";
	}
	
}

package com.ddd.app.mypage.dto;

import java.sql.Date;

public class mypageScareDTO {
//	SELECT
//    C.CARE_NUMBER,
//    C.CARE_TITLE,
//    TO_CHAR(C.CARE_WRITE_DATE, 'YYYY-MM-DD') AS CARE_WRITE_DATE,
//    NVL(A.APPLY_COUNT, 0) AS APPLY_COUNT,
//    C.CARE_RECRUIT
//		FROM DDD_CARE C,
//     (SELECT CA.CARE_NUMBER,COUNT(*) AS APPLY_COUNT
//      FROM DDD_CARE_APPLY CA
//      GROUP BY CA.CARE_NUMBER)A
//WHERE C.CARE_NUMBER = A.CARE_NUMBER(+)
//  AND C.USER_NUMBER = 3
//ORDER BY C.CARE_NUMBER DESC;
	
	private int careNumber;
	private String careTitle;
	private Date careDate;
	private int careRecruit;
	
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
	public int getCareRecruit() {
		return careRecruit;
	}
	public void setCareRecruit(int careRecruit) {
		this.careRecruit = careRecruit;
	}
	
	@Override
	public String toString() {
		return "mypageScareDTO [careNumber=" + careNumber + ", careTitle=" + careTitle + ", careDate=" + careDate
				+ ", careRecruit=" + careRecruit + "]";
	}
	
}

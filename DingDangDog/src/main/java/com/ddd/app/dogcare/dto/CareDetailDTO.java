package com.ddd.app.dogcare.dto;

import java.sql.Date;

public class CareDetailDTO {

//	SELECT c.care_number, c.care_title, c.care_post, c.care_date, c.care_recruit, 
//	u.user_nickname, c.care_write_date, COUNT(a.apply_number) AS apply_count
//	FROM DDD_CARE c
//	JOIN DDD_USER u ON c.user_number = u.user_number
//	LEFT JOIN DDD_CARE_APPLY a ON c.care_number = a.care_number
//	WHERE c.care_number = ? AND c.care_status <> 'delete'
//	GROUP BY c.care_number, c.care_title, c.care_post, c.care_date, c.care_recruit, u.user_nickname, c.care_write_date;

	private int careNumber;
	private String careTitle;
	private String carePost;
	private Date careDate;
	private int careRecruit;
	private String userNickname;
	private Date careWriteDate;
	private int applyNumber;
	private int userNumber;
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
	public String getCarePost() {
		return carePost;
	}
	public void setCarePost(String carePost) {
		this.carePost = carePost;
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
	public int getApplyNumber() {
		return applyNumber;
	}
	public void setApplyNumber(int applyNumber) {
		this.applyNumber = applyNumber;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	
	@Override
	public String toString() {
		return "CareDetailDTO [careNumber=" + careNumber + ", careTitle=" + careTitle + ", carePost=" + carePost
				+ ", careDate=" + careDate + ", careRecruit=" + careRecruit + ", userNickname=" + userNickname
				+ ", careWriteDate=" + careWriteDate + ", applyNumber=" + applyNumber + ", userNumber=" + userNumber
				+ "]";
	}
	
}

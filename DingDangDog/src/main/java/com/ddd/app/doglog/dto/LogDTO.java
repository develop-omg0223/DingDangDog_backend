package com.ddd.app.doglog.dto;

import java.sql.Date;

public class LogDTO {
	private int logNumber;
	private int userNumber;
	private String logTitle;
	private String logPost;
	private Date logDate;
	private Date logModifyDate;
	private String userNickname;
	private String representativeImgPath;
	
	

	public LogDTO() {
	}

	public LogDTO(int logNumber, int userNumber, String logTitle, String logPost, Date logDate, Date logModifyDate,
			String userNickname, String representativeImgPath) {
		this.logNumber = logNumber;
		this.userNumber = userNumber;
		this.logTitle = logTitle;
		this.logPost = logPost;
		this.logDate = logDate;
		this.logModifyDate = logModifyDate;
		this.userNickname = userNickname;
		this.representativeImgPath = representativeImgPath;
	}

	public int getLogNumber() {
		return logNumber;
	}

	public void setLogNumber(int logNumber) {
		this.logNumber = logNumber;
	}

	public int getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}

	public String getLogTitle() {
		return logTitle;
	}

	public void setLogTitle(String logTitle) {
		this.logTitle = logTitle;
	}

	public String getLogPost() {
		return logPost;
	}

	public void setLogPost(String logPost) {
		this.logPost = logPost;
	}

	public Date getLogDate() {
		return logDate;
	}

	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}

	public Date getLogModifyDate() {
		return logModifyDate;
	}

	public void setLogModifyDate(Date logModifyDate) {
		this.logModifyDate = logModifyDate;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getRepresentativeImgPath() {
		return representativeImgPath;
	}

	public void setRepresentativeImgPath(String representativeImgPath) {
		this.representativeImgPath = representativeImgPath;
	}

	@Override
	public String toString() {
		return "LogDTO [logNumber=" + logNumber + ", userNumber=" + userNumber + ", logTitle=" + logTitle
				+ ", logPost=" + logPost + ", logDate=" + logDate + ", logModifyDate=" + logModifyDate
				+ ", userNickname=" + userNickname + ", representativeImgPath=" + representativeImgPath + "]";
	}
}
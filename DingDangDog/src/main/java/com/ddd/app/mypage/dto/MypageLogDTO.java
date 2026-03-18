package com.ddd.app.mypage.dto;

public class MypageLogDTO {
	private int logNumber;
	private int userNumber;
	private String userNickname;
	private String logTitle;
	private String logPost;
	private String logDate;
	private String logModifyDate;
	private String representativeImgPath;

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

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
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

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	public String getLogModifyDate() {
		return logModifyDate;
	}

	public void setLogModifyDate(String logModifyDate) {
		this.logModifyDate = logModifyDate;
	}

	public String getRepresentativeImgPath() {
		return representativeImgPath;
	}

	public void setRepresentativeImgPath(String representativeImgPath) {
		this.representativeImgPath = representativeImgPath;
	}

	@Override
	public String toString() {
		return "MypageLogDTO [logNumber=" + logNumber + ", userNumber=" + userNumber + ", userNickname=" + userNickname
				+ ", logTitle=" + logTitle + ", logPost=" + logPost + ", logDate=" + logDate + ", logModifyDate="
				+ logModifyDate + ", representativeImgPath=" + representativeImgPath + "]";
	}
}
package com.ddd.app.doglog.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class LogCommentDTO {
	private int commentNumber;
	private int logNumber;
	private int userNumber;
	private String commentPost;
	private LocalDateTime commentDate;
	private String userNickname;

	public LogCommentDTO() {
	}

	public LogCommentDTO(int commentNumber, int logNumber, int userNumber, String commentPost, LocalDateTime commentDate,
			String userNickname) {
		this.commentNumber = commentNumber;
		this.logNumber = logNumber;
		this.userNumber = userNumber;
		this.commentPost = commentPost;
		this.commentDate = commentDate;
		this.userNickname = userNickname;
	}

	public int getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
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

	public String getCommentPost() {
		return commentPost;
	}

	public void setCommentPost(String commentPost) {
		this.commentPost = commentPost;
	}

	public String getCommentDate() {
		if (commentDate == null) {
			return "";
		}
		return commentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	@Override
	public String toString() {
		return "LogCommentDTO [commentNumber=" + commentNumber + ", logNumber=" + logNumber + ", userNumber="
				+ userNumber + ", commentPost=" + commentPost + ", commentDate=" + commentDate + ", userNickname="
				+ userNickname + "]";
	}
}
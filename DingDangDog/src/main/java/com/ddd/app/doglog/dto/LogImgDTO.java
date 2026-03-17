package com.ddd.app.doglog.dto;

public class LogImgDTO {
	private int logImgNumber;
	private int logNumber;
	private String logImgName;
	private String logImgPath;

	public LogImgDTO() {
	}

	public LogImgDTO(int logImgNumber, int logNumber, String logImgName, String logImgPath) {
		this.logImgNumber = logImgNumber;
		this.logNumber = logNumber;
		this.logImgName = logImgName;
		this.logImgPath = logImgPath;
	}

	public int getLogImgNumber() {
		return logImgNumber;
	}

	public void setLogImgNumber(int logImgNumber) {
		this.logImgNumber = logImgNumber;
	}

	public int getLogNumber() {
		return logNumber;
	}

	public void setLogNumber(int logNumber) {
		this.logNumber = logNumber;
	}

	public String getLogImgName() {
		return logImgName;
	}

	public void setLogImgName(String logImgName) {
		this.logImgName = logImgName;
	}

	public String getLogImgPath() {
		return logImgPath;
	}

	public void setLogImgPath(String logImgPath) {
		this.logImgPath = logImgPath;
	}

	@Override
	public String toString() {
		return "LogImgDTO [logImgNumber=" + logImgNumber + ", logNumber=" + logNumber
				+ ", logImgName=" + logImgName + ", logImgPath=" + logImgPath + "]";
	}
}
package com.ddd.app.report.dto;

import java.sql.Date;

public class ReportDTO {
//	CREATE TABLE ddd_report(
//			report_number NUMBER,
//			reporter_user_number number,
//			reported_user_number NUMBER,
//			apply_number number,
//			report_reason VARCHAR2(200) NOT NULL,
//			report_date DATE DEFAULT sysdate,

	private int reportNumber;
	private int reporterUserNumber;
	private int reportedUserNumber;
	private int applyNumber;
	private String reportReason;
	private Date reportDate;

	public int getReportNumber() {
		return reportNumber;
	}

	public void setReportNumber(int reportNumber) {
		this.reportNumber = reportNumber;
	}

	public int getReporterUserNumber() {
		return reporterUserNumber;
	}

	public void setReporterUserNumber(int reporterUserNumber) {
		this.reporterUserNumber = reporterUserNumber;
	}

	public int getReportedUserNumber() {
		return reportedUserNumber;
	}

	public void setReportedUserNumber(int reportedUserNumber) {
		this.reportedUserNumber = reportedUserNumber;
	}

	public int getApplyNumber() {
		return applyNumber;
	}

	public void setApplyNumber(int applyNumber) {
		this.applyNumber = applyNumber;
	}

	public String getReportReason() {
		return reportReason;
	}

	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	@Override
	public String toString() {
		return "ReportDTO [reportNumber=" + reportNumber + ", reporterUserNumber=" + reporterUserNumber
				+ ", reportedUserNumber=" + reportedUserNumber + ", applyNumber=" + applyNumber + ", reportReason="
				+ reportReason + ", reportDate=" + reportDate + "]";

	}
}
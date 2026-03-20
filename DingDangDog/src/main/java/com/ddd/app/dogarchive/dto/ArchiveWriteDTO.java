package com.ddd.app.dogarchive.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

// ===== 멍! 카이브 작성 DTO =====
public class ArchiveWriteDTO {
	/**
	 * @author 윤철민
	 * 
	 *         멍! 카이브 등록 (보호소 회원만 작성 가능),이미지 등록
	 */

//	   user_number NUMBER,	// int
//	   dog_name varchar2(50) NOT NULL,	// String
//	   dog_breed varchar2(50),	// String
//	   dog_gender char(1) NOT NULL,	// String
//	   dog_age varchar2(20),	// String
//	   dog_weight NUMBER,	// int
//	   dog_safe_date DATE,	// String
//	   dog_detail varchar2(4000),	// String

//	   dog_activity number NOT NULL,	// int
//	   dog_sociality number NOT NULL,	// int
//	   dog_independence NUMBER NOT NULL,	//int
//	   dog_barking NUMBER NOT NULL,	// int
//	   dog_grooming NUMBER NOT NULL,	// int

//	   archive_img_name VARCHAR2(200) NOT NULL,	// String
//	   archive_img_path VARCHAR2(200),	// Sting

	// ===== 필드 =====
	private int userNumber;
	private String dogName;
	private String dogBreed;
	private String dogGender;
	private String dogAge;
	private double dogWeight;
	private LocalDateTime dogSafeDate;
	private String dogDetail;

	// 성향 정보 등록
	private int dogActivity;
	private int dogSociality;
	private int dogIndependence;
	private int dogBarking;
	private int dogGrooming;

	// 이미지 정보 (최소 1개 필수 제약조건)
	private String archiveImgName;
	private String archiveImgPath;

	// ===== Getter,Setter =====
	public int getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public String getDogBreed() {
		return dogBreed;
	}

	public void setDogBreed(String dogBreed) {
		this.dogBreed = dogBreed;
	}

	public String getDogGender() {
		return dogGender;
	}

	public void setDogGender(String dogGender) {
		this.dogGender = dogGender;
	}

	public String getDogAge() {
		return dogAge;
	}

	public void setDogAge(String dogAge) {
		this.dogAge = dogAge;
	}

	public double getDogWeight() {
		return dogWeight;
	}

	public void setDogWeight(double dogWeight) {
		this.dogWeight = dogWeight;
	}

	public String getDogSafeDate() {
		if (dogSafeDate == null)
			return "";
		return dogSafeDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	public void setDogSafeDate(LocalDateTime dogSafeDate) {
		this.dogSafeDate = dogSafeDate;
	}

	public String getDogDetail() {
		return dogDetail;
	}

	public void setDogDetail(String dogDetail) {
		this.dogDetail = dogDetail;
	}

	public int getDogActivity() {
		return dogActivity;
	}

	public void setDogActivity(int dogActivity) {
		this.dogActivity = dogActivity;
	}

	public int getDogSociality() {
		return dogSociality;
	}

	public void setDogSociality(int dogSociality) {
		this.dogSociality = dogSociality;
	}

	public int getDogIndependence() {
		return dogIndependence;
	}

	public void setDogIndependence(int dogIndependence) {
		this.dogIndependence = dogIndependence;
	}

	public int getDogBarking() {
		return dogBarking;
	}

	public void setDogBarking(int dogBarking) {
		this.dogBarking = dogBarking;
	}

	public int getDogGrooming() {
		return dogGrooming;
	}

	public void setDogGrooming(int dogGrooming) {
		this.dogGrooming = dogGrooming;
	}

	public String getArchiveImgName() {
		return archiveImgName;
	}

	public void setArchiveImgName(String archiveImgName) {
		this.archiveImgName = archiveImgName;
	}

	public String getArchiveImgPath() {
		return archiveImgPath;
	}

	public void setArchiveImgPath(String archiveImgPath) {
		this.archiveImgPath = archiveImgPath;
	}

	// ===== Overried =====
	@Override
	public String toString() {
		return "ArchiveWriteDTO [userNumber=" + userNumber + ", dogName=" + dogName + ", dogBreed=" + dogBreed
				+ ", dogGender=" + dogGender + ", dogAge=" + dogAge + ", dogWeight=" + dogWeight + ", dogSafeDate="
				+ dogSafeDate + ", dogDetail=" + dogDetail + ", dogActivity=" + dogActivity + ", dogSociality="
				+ dogSociality + ", dogIndependence=" + dogIndependence + ", dogBarking=" + dogBarking
				+ ", dogGrooming=" + dogGrooming + ", archiveImgName=" + archiveImgName + ", archiveImgPath="
				+ archiveImgPath + "]";
	}

}
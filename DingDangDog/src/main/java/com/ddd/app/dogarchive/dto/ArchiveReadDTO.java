package com.ddd.app.dogarchive.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

// ===== 멍! 카이브 조회 DTO ===== 
public class ArchiveReadDTO {
	/**
	 * @author 윤철민
	 * 
	 *         유기견 점수 수정, 이미지 수정
	 */

//	   dog_number NUMBER,	// int
//	   user_number NUMBER,	// int
//	   admin_number Number,	// int
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
	// 기본 정보
	private int dogNumber;
	private int userNumber;
	private Integer adminNumber;
	private String dogName;
	private String dogBreed;
	private String dogGender;
	private String dogAge;
	private double dogWeight;
	private LocalDateTime dogSafeDate;
	private String dogDetail;

	// 성향 점수
	private int dogActivity;
	private int dogSociality;
	private int dogIndependence;
	private int dogBarking;
	private int dogGrooming;

	// 추가 - JOIN
	private String archiveImgPath;
	private String shelterName;

	// ===== Getter,Setter =====
	public int getDogNumber() {
		return dogNumber;
	}

	public void setDogNumber(int dogNumber) {
		this.dogNumber = dogNumber;
	}

	public int getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}

	public Integer getAdminNumber() {
		return adminNumber;
	}

	public void setAdminNumber(Integer adminNumber) {
		this.adminNumber = adminNumber;
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

	public String getArchiveImgPath() {
		return archiveImgPath;
	}

	public void setArchiveImgPath(String archiveImgPath) {
		this.archiveImgPath = archiveImgPath;
	}

	public String getShelterName() {
		return shelterName;
	}

	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}

	// ===== Overried =====
	@Override
	public String toString() {
		return "ArchiveReadDTO [dogNumber=" + dogNumber + ", userNumber=" + userNumber + ", adminNumber=" + adminNumber
				+ ", dogName=" + dogName + ", dogBreed=" + dogBreed + ", dogGender=" + dogGender + ", dogAge=" + dogAge
				+ ", dogWeight=" + dogWeight + ", dogSafeDate=" + dogSafeDate + ", dogDetail=" + dogDetail
				+ ", dogActivity=" + dogActivity + ", dogSociality=" + dogSociality + ", dogIndependence="
				+ dogIndependence + ", dogBarking=" + dogBarking + ", dogGrooming=" + dogGrooming + ", archiveImgPath="
				+ archiveImgPath + ", shelterName=" + shelterName + "]";
	}

}
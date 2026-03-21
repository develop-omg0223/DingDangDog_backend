package com.ddd.app.admin.dto;

import java.time.LocalDate;

public class AdminArchiveDTO {
//			   dog_number NUMBER,
//			   user_number NUMBER,
//			   dog_name varchar2(50) NOT NULL,
//			   dog_breed varchar2(50),
//			   dog_gender char(1) NOT NULL,
//			   dog_age varchar2(20),
//			   dog_weight NUMBER,
//			   dog_safe_date DATE,
//			   dog_archive_date DATE DEFAULT SYSDATE NOT NULL,
//			   archive_modify_date DATE DEFAULT sysdate ,
//			   dog_detail varchar2(4000),
//
//			   dog_number NUMBER,
//			   dog_activity number NOT NULL,
//			   dog_sociality number NOT NULL,
//			   dog_independence NUMBER NOT NULL,
//			   dog_barking NUMBER NOT NULL,
//			   dog_grooming NUMBER NOT NULL,
//
//			   archive_img_number NUMBER,
//			   dog_number NUMBER,
//			   archive_img_name VARCHAR2(200)
//			   archive_img_path VARCHAR2

	private int dogNumber;
	private int userNumber;
	private String dogName;
	private String dogBreed;
	private char dogGender;
	private String dogAge;
	private int dogWeight;
	private LocalDate dogSafeDate;
	private LocalDate dogArchiveDate;
	private LocalDate archiveModifyDate;
	private String dogDetail;
	private int dogActivity;
	private int dogSociality;
	private int dogIndependence;
	private int dogBarking;
	private int dogGrooming;
	private int archiveImgNumber;
	private String archiveImgName;
	private String archiveImgPath;
	private String shelterName;

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
	public char getDogGender() {
		return dogGender;
	}
	public void setDogGender(char dogGender) {
		this.dogGender = dogGender;
	}
	public String getDogAge() {
		return dogAge;
	}
	public void setDogAge(String dogAge) {
		this.dogAge = dogAge;
	}
	public int getDogWeight() {
		return dogWeight;
	}
	public void setDogWeight(int dogWeight) {
		this.dogWeight = dogWeight;
	}
	public LocalDate getDogSafeDate() {
		return dogSafeDate;
	}
	public void setDogSafeDate(LocalDate dogSafeDate) {
		this.dogSafeDate = dogSafeDate;
	}
	public LocalDate getDogArchiveDate() {
		return dogArchiveDate;
	}
	public void setDogArchiveDate(LocalDate dogArchiveDate) {
		this.dogArchiveDate = dogArchiveDate;
	}
	public LocalDate getArchiveModifyDate() {
		return archiveModifyDate;
	}
	public void setArchiveModifyDate(LocalDate archiveModifyDate) {
		this.archiveModifyDate = archiveModifyDate;
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
	public int getArchiveImgNumber() {
		return archiveImgNumber;
	}
	public void setArchiveImgNumber(int archiveImgNumber) {
		this.archiveImgNumber = archiveImgNumber;
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
	
	public String getShelterName() {
		return shelterName;
	}

	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}

	@Override
	public String toString() {
		return "AdminArchiveDTO [dogNumber=" + dogNumber + ", userNumber=" + userNumber + ", dogName=" + dogName
				+ ", dogBreed=" + dogBreed + ", dogGender=" + dogGender + ", dogAge=" + dogAge + ", dogWeight="
				+ dogWeight + ", dogSafeDate=" + dogSafeDate + ", dogArchiveDate=" + dogArchiveDate
				+ ", archiveModifyDate=" + archiveModifyDate + ", dogDetail=" + dogDetail + ", dogActivity="
				+ dogActivity + ", dogSociality=" + dogSociality + ", dogIndependence=" + dogIndependence
				+ ", dogBarking=" + dogBarking + ", dogGrooming=" + dogGrooming + ", archiveImgNumber="
				+ archiveImgNumber + ", archiveImgName=" + archiveImgName + ", archiveImgPath=" + archiveImgPath + ", shelterName="+ shelterName + "]";
	}
}
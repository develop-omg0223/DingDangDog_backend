package com.ddd.app.archive.dto;
// 1. 멍카이브 정보

public class ArchiveDTO {
	/**
	 * 	@author 윤철민
	 * 
	 * 	@since jdk17
	 * 
	 * 	멍카이브 정보를 담기 위한 DTO 클래스
	 *	유기견 번호, 보호소 회원 번호, 이름, 견종, 성별 
	 * 	나이, 몸무게, 보호시작일, 멍카이브 등록일, 수정일 저장 
	 */
	
//	-- 멍카이브 유기견 정보
//	CREATE TABLE ddd_archive(
//	   dog_number NUMBER,	// int
//	   user_number NUMBER,	.. int
//	   dog_name varchar2(50) NOT NULL,	// String
//	   dog_breed varchar2(50),	// String
//	   dog_gender char(1) NOT NULL,	// String
//	   dog_age varchar2(20),	// String
//	   dog_weight NUMBER,	// int
//	   dog_safe_date DATE,	// String
//	   dog_archive_date DATE DEFAULT SYSDATE NOT NULL,	// String
//	   archive_modify_date DATE DEFAULT sysdate ,	// String
//	   dog_detail varchar2(4000),	// String
//	   CONSTRAINT PK_archive_dog_number PRIMARY KEY (dog_number),
//	   CONSTRAINT CK_archive_dog_gender CHECK(dog_gender IN ('F', 'M')),
//	   CONSTRAINT CK_archive_dog_weight CHECK(dog_weight > 0),
//	   CONSTRAINT FK_archive_user_number FOREIGN KEY (user_number) REFERENCES ddd_user(user_number) ON DELETE CASCADE
//	);

//	----- 필드 -----

	private int dogNumber;
	private int userNumber;
	private String dogName;
	private String dogBreed;
	private String dogGender;
	private String dogAge;
	private int dogWeight;
	private String dogSafeDate;
	private String dogArchiveDate;
	private String archiveModifyDate;
	private String dogDetail;
	
//	----- Getter & Setter -----
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
	public int getDogWeight() {
		return dogWeight;
	}
	public void setDogWeight(int dogWeight) {
		this.dogWeight = dogWeight;
	}
	public String getDogSafeDate() {
		return dogSafeDate;
	}
	public void setDogSafeDate(String dogSafeDate) {
		this.dogSafeDate = dogSafeDate;
	}
	public String getDogArchiveDate() {
		return dogArchiveDate;
	}
	public void setDogArchiveDate(String dogArchiveDate) {
		this.dogArchiveDate = dogArchiveDate;
	}
	public String getArchiveModifyDate() {
		return archiveModifyDate;
	}
	public void setArchiveModifyDate(String archiveModifyDate) {
		this.archiveModifyDate = archiveModifyDate;
	}
	public String getDogDetail() {
		return dogDetail;
	}
	public void setDogDetail(String dogDetail) {
		this.dogDetail = dogDetail;
	}
	
//	----- Override -----
	@Override
	public String toString() {
		return "ArchiveDTO [dogNumber=" + dogNumber + ", userNumber=" + userNumber + ", dogName=" + dogName
				+ ", dogBreed=" + dogBreed + ", dogGender=" + dogGender + ", dogAge=" + dogAge + ", dogWeight="
				+ dogWeight + ", dogSafeDate=" + dogSafeDate + ", dogArchiveDate=" + dogArchiveDate
				+ ", archiveModifyDate=" + archiveModifyDate + ", dogDetail=" + dogDetail + "]";
	}

	


}
	

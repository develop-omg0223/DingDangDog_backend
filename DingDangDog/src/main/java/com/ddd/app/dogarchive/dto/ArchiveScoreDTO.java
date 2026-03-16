package com.ddd.app.dogarchive.dto;
// 3. 멍카이브 유기견점수

public class ArchiveScoreDTO {
	/**
	 *	@author 윤철민
	 * 
	 *	@since jdk17
	 * 
	 *	유기견 점수 정보를 담기 위한 DTO 클래스 유기견 번호,
	 *	활동성, 사회성, 독립성, 짖음수준, 털관리 저장
	 */

//	-- 멍카이브 유기견점수
//	CREATE TABLE ddd_archive_score(
//	   dog_number NUMBER,	// int
//	   dog_activity number NOT NULL,	// int
//	   dog_sociality number NOT NULL,	// int
//	   dog_independence NUMBER NOT NULL,	//int
//	   dog_barking NUMBER NOT NULL,	// int
//	   dog_grooming NUMBER NOT NULL,	// int
//	   CONSTRAINT PK_arch_scor_dog_number PRIMARY KEY (dog_number),
//	   CONSTRAINT FK_arch_scor_dog_number FOREIGN KEY (dog_number) REFERENCES ddd_archive(dog_number) ON DELETE CASCADE,
//	   CONSTRAINT CK_arch_scor_acti CHECK(dog_activity BETWEEN 1 AND 5),
//	   CONSTRAINT CK_arch_scor_soci CHECK(dog_sociality BETWEEN 1 AND 5),
//	   CONSTRAINT CK_arch_scor_inde CHECK(dog_independence BETWEEN 1 AND 5),
//	   CONSTRAINT CK_arch_scor_bark CHECK(dog_barking BETWEEN 1 AND 5),
//	   CONSTRAINT CK_arch_scor_groo CHECK(dog_grooming BETWEEN 1 AND 5)
//	);

//	----- 필드 -----
	private int dogNumber;
	private int dogActivity;
	private int dogSociality;
	private int dogIndependence;
	private int dogBarking;
	private int dogGrooming;

//	----- Getter & Setter -----
	public int getDogNumber() {
		return dogNumber;
	}

	public void setDogNumber(int dogNumber) {
		this.dogNumber = dogNumber;
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

//	----- Override -----
	@Override
	public String toString() {
		return "ArchiveScoreDTO [dogNumber=" + dogNumber + ", dogActivity=" + dogActivity + ", dogSociality="
				+ dogSociality + ", dogIndependence=" + dogIndependence + ", dogBarking=" + dogBarking
				+ ", dogGrooming=" + dogGrooming + "]";
	}

}
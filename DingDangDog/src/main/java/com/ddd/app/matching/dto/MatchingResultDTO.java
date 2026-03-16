package com.ddd.app.matching.dto;
// 1. 멍매칭 결과 

public class MatchingResultDTO {
	/**
	 *	@author 윤철민
	 * 
	 *	@since jdk17
	 * 
	 *	매칭 결과 정보를 담기 위한 DTO 클래스 결과번호, 회원번호,
	 *	활동성, 사회성, 독립성, 짖음수준, 털관리, 저장날짜/시간 저장 
	 */

//	--멍매칭결과
//	CREATE TABLE DDD_MATCH_RESULT (
//	   result_number NUMBER,	// int
//	   user_number NUMBER,	// int
//	   dog_activity NUMBER,	// int
//	   dog_sociality NUMBER,	// int
//	   dog_independence NUMBER,	// int
//	   dog_barking NUMBER,	// int	
//	   dog_grooming NUMBER,	// int
//	   result_created_date DATE DEFAULT SYSDATE NOT NULL,	// String
//	   CONSTRAINT PK_match_res_number PRIMARY KEY (result_number),
//	   CONSTRAINT FK_match_res_user_number FOREIGN KEY (user_number) REFERENCES ddd_user(user_number) ON DELETE CASCADE ,
//	   CONSTRAINT CK_match_res_acti CHECK (dog_activity BETWEEN 1 AND 5),
//	   CONSTRAINT CK_match_res_soci CHECK (dog_sociality BETWEEN 1 AND 5),
//	   CONSTRAINT CK_match_res_inde CHECK (dog_independence BETWEEN 1 AND 5),
//	   CONSTRAINT CK_match_res_bark CHECK (dog_barking BETWEEN 1 AND 5),
//	   CONSTRAINT CK_match_res_groo CHECK (dog_grooming BETWEEN 1 AND 5)
//	);
//
//	CREATE SEQUENCE seq_match_result nocache nocycle;

//	----- 필드 -----
	private int resultNumber;
	private int userNumber;
	private int dogActivity;
	private int dogSociality;
	private int dogIndependence;
	private int dogBarking;
	private int dogGrooming;
	private String resultCreatedDate;

//	----- Getter & Setter -----
	public int getResultNumber() {
		return resultNumber;
	}

	public void setResultNumber(int resultNumber) {
		this.resultNumber = resultNumber;
	}

	public int getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
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

	public String getResultCreatedDate() {
		return resultCreatedDate;
	}

	public void setResultCreatedDate(String resultCreatedDate) {
		this.resultCreatedDate = resultCreatedDate;
	}

//	----- Override -----
	@Override
	public String toString() {
		return "MatchingResultDTO [resultNumber=" + resultNumber + ", userNumber=" + userNumber + ", dogActivity="
				+ dogActivity + ", dogSociality=" + dogSociality + ", dogIndependence=" + dogIndependence
				+ ", dogBarking=" + dogBarking + ", dogGrooming=" + dogGrooming + ", resultCreatedDate="
				+ resultCreatedDate + "]";
	}

}

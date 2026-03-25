package com.ddd.app.dogarchive.dto;

public class ArchiveReadDTO {
	private int dogNumber;
	private int userNumber;
	private String dogName;
	private String dogBreed;
	private String dogGender;
	private String dogAge;
	private double dogWeight;
	private String dogSafeDate;
	private String dogDetail;

	// 성향 점수
	private int dogActivity;
	private int dogSociality;
	private int dogIndependence;
	private int dogBarking;
	private int dogGrooming;

	// [핵심 추가] 성향 상세 설명 (이게 없으면 상세페이지가 안 나옵니다!)
	private String dogActivityDetail;
	private String dogSocialityDetail;
	private String dogIndependenceDetail;
	private String dogBarkingDetail;
	private String dogGroomingDetail;

	private String archiveImgPath;

	// ===== Getter, Setter (중괄호 정석) =====

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

	public double getDogWeight() {
		return dogWeight;
	}

	public void setDogWeight(double dogWeight) {
		this.dogWeight = dogWeight;
	}

	public String getDogSafeDate() {
		return dogSafeDate;
	}

	public void setDogSafeDate(String dogSafeDate) {
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

	// [추가된 Getter/Setter]
	public String getDogActivityDetail() {
		return dogActivityDetail;
	}

	public void setDogActivityDetail(String dogActivityDetail) {
		this.dogActivityDetail = dogActivityDetail;
	}

	public String getDogSocialityDetail() {
		return dogSocialityDetail;
	}

	public void setDogSocialityDetail(String dogSocialityDetail) {
		this.dogSocialityDetail = dogSocialityDetail;
	}

	public String getDogIndependenceDetail() {
		return dogIndependenceDetail;
	}

	public void setDogIndependenceDetail(String dogIndependenceDetail) {
		this.dogIndependenceDetail = dogIndependenceDetail;
	}

	public String getDogBarkingDetail() {
		return dogBarkingDetail;
	}

	public void setDogBarkingDetail(String dogBarkingDetail) {
		this.dogBarkingDetail = dogBarkingDetail;
	}

	public String getDogGroomingDetail() {
		return dogGroomingDetail;
	}

	public void setDogGroomingDetail(String dogGroomingDetail) {
		this.dogGroomingDetail = dogGroomingDetail;
	}

	public String getArchiveImgPath() {
		return archiveImgPath;
	}

	public void setArchiveImgPath(String archiveImgPath) {
		this.archiveImgPath = archiveImgPath;
	}

	@Override
	public String toString() {
		return "ArchiveReadDTO [dogNumber=" + dogNumber + ", userNumber=" + userNumber + ", dogName=" + dogName
				+ ", dogBreed=" + dogBreed + ", dogGender=" + dogGender + ", dogAge=" + dogAge + ", dogWeight="
				+ dogWeight + ", dogSafeDate=" + dogSafeDate + ", dogDetail=" + dogDetail + ", dogActivity="
				+ dogActivity + ", dogSociality=" + dogSociality + ", dogIndependence=" + dogIndependence
				+ ", dogBarking=" + dogBarking + ", dogGrooming=" + dogGrooming + ", dogActivityDetail="
				+ dogActivityDetail + ", dogSocialityDetail=" + dogSocialityDetail + ", dogIndependenceDetail="
				+ dogIndependenceDetail + ", dogBarkingDetail=" + dogBarkingDetail + ", dogGroomingDetail="
				+ dogGroomingDetail + ", archiveImgPath=" + archiveImgPath + "]";
	}

}
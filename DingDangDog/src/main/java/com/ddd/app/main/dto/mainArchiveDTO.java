package com.ddd.app.main.dto;

public class mainArchiveDTO {

	private int dogNumber;
	private String dogName;
	private String dogBreed;
	private String dogGender;
	private String dogAge;
	private String archiveImgPath;
	public int getDogNumber() {
		return dogNumber;
	}
	public void setDogNumber(int dogNumber) {
		this.dogNumber = dogNumber;
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
	public String getArchiveImgPath() {
		return archiveImgPath;
	}
	public void setArchiveImgPath(String archiveImgPath) {
		this.archiveImgPath = archiveImgPath;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	
	
	
}

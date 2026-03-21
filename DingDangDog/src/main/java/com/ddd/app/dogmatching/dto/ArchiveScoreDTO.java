package com.ddd.app.dogmatching.dto;

public class ArchiveScoreDTO {
    private int dogNumber;
    private int dogActivity;
    private int dogSociality;
    private int dogIndependence;
    private int dogBarking;
    private int dogGrooming;
    
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
	
	@Override
	public String toString() {
		return "ArchiveScoreDTO [dogNumber=" + dogNumber + ", dogActivity=" + dogActivity + ", dogSociality="
				+ dogSociality + ", dogIndependence=" + dogIndependence + ", dogBarking=" + dogBarking
				+ ", dogGrooming=" + dogGrooming + "]";
	}
	
	
}

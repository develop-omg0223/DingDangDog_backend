package com.ddd.app.mypage.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MypageArchiveDTO {
    private int dogNumber;
    private String dogName;
    private String dogBreed;
    private int dogAge;
    private String dogGender;
    private String shelterName;
    private LocalDateTime dogSafeDate;
    private String archiveImgPath;
    private LocalDate dogArchiveDate;

    // Getter & Setter
    public int getDogNumber() { return dogNumber; }
    public void setDogNumber(int dogNumber) { this.dogNumber = dogNumber; }
    public String getDogName() { return dogName; }
    public void setDogName(String dogName) { this.dogName = dogName; }
    public String getDogBreed() { return dogBreed; }
    public void setDogBreed(String dogBreed) { this.dogBreed = dogBreed; }
    public int getDogAge() { return dogAge; }
    public void setDogAge(int dogAge) { this.dogAge = dogAge; }
    public String getDogGender() { return dogGender; }
    public void setDogGender(String dogGender) { this.dogGender = dogGender; }
    public String getShelterName() { return shelterName; }
    public void setShelterName(String shelterName) { this.shelterName = shelterName; }
    
    public String getDogSafeDate() {
        if (dogSafeDate == null) return "";
        return dogSafeDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }
    public void setDogSafeDate(LocalDateTime dogSafeDate) { this.dogSafeDate = dogSafeDate; }
    public String getArchiveImgPath() { return archiveImgPath; }
    public void setArchiveImgPath(String archiveImgPath) { this.archiveImgPath = archiveImgPath; }
    public LocalDate getDogArchiveDate() { return dogArchiveDate; }
    public void setDogArchiveDate(LocalDate dogArchiveDate) { this.dogArchiveDate = dogArchiveDate; }

    @Override
    public String toString() {
        return "MypageArchiveDTO [dogNumber=" + dogNumber + ", dogName=" + dogName + "]";
    }
}
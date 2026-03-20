package com.ddd.app.dogarchive.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

// ===== 멍! 카이브 리스트 DTO =====
public class ArchiveListDTO {
	/**
	 * @author 윤철민
	 * 
	 *         전체 리스트 검색 조건 : 보호소명, 견종 정렬 : 보호시작일 오래된 순 카드 대표 이미지
	 */

//	   dog_number NUMBER,	// int
//	   dog_name varchar2(50) NOT NULL,	// String
//	   dog_breed varchar2(50),	// String
//	   shelter_name varchar2(100) NOT NULL	// String
//	   dog_safe_date DATE,	// String
//	   archive_img_path VARCHAR2(200),	// String

	// ===== 필드 =====
	private int dogNumber;
	private String dogName;
	private String dogBreed;
	private String shelterName;
	private LocalDateTime dogSafeDate;
	private String archiveImgPath;

	// ===== Getter,Setter =====
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

	public String getShelterName() {
		return shelterName;
	}

	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}

	public String getDogSafeDate() {
		if (dogSafeDate == null)
			return "";
		return dogSafeDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}

	public void setDogSafeDate(LocalDateTime dogSafeDate) {
		this.dogSafeDate = dogSafeDate;
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
		return "ArchiveListDTO [dogNumber=" + dogNumber + ", dogName=" + dogName + ", dogBreed=" + dogBreed
				+ ", shelterName=" + shelterName + ", dogSafeDate=" + dogSafeDate + ", archiveImgPath=" + archiveImgPath
				+ "]";
	}

}

package com.ddd.app.archive.dto;
// 2. 멍카이브 이미지

public class ArchiveImgDTO {
	/**
	 * 	@author 윤철민
	 * 
	 * 	@since jdk17
	 * 
	 * 	멍카이브 이미지 정보를 담기 위한 DTO 클래스
	 * 	이미지 번호, 유기견 번호, 이미지 명, 이미지 경로 저장 
	 */
	
//	-- 멍카이브 이미지
//	CREATE TABLE ddd_archive_img(
//	   archive_img_number NUMBER,	// int
//	   dog_number NUMBER,	// int
//	   archive_img_name VARCHAR2(200) NOT NULL,	// String
//	   archive_img_path VARCHAR2(200),	// Sting
//	   CONSTRAINT PK_archive_img_img_number PRIMARY KEY (archive_img_number),
//	   CONSTRAINT FK_archive_img_dog_number FOREIGN KEY (dog_number) REFERENCES ddd_archive(dog_number) ON DELETE CASCADE
//	);
//	CREATE SEQUENCE seq_archive_img NOCACHE NOCYCLE;

//	----- 필드 -----
	private int archiveImgNumber;
	private int dogNumber;
	private String archiveImgName;
	private String archiveImgPath;

//	----- Getter & Setter -----
	public int getArchiveImgNumber() {
		return archiveImgNumber;
	}

	public void setArchiveImgNumber(int archiveImgNumber) {
		this.archiveImgNumber = archiveImgNumber;
	}

	public int getDogNumber() {
		return dogNumber;
	}

	public void setDogNumber(int dogNumber) {
		this.dogNumber = dogNumber;
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

//	----- Override -----
	@Override
	public String toString() {
		return "ArchiveImgDTO [archiveImgNumber=" + archiveImgNumber + ", dogNumber=" + dogNumber + ", archiveImgName="
				+ archiveImgName + ", archiveImgPath=" + archiveImgPath + "]";
	}

}

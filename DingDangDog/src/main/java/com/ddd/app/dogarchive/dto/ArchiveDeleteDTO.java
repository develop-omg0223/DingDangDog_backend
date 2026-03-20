package com.ddd.app.dogarchive.dto;

// ===== 멍! 카이브 삭제 DTO ===== 
public class ArchiveDeleteDTO {
	/**
	 * @author 윤철민
	 * 
	 *         유기견 삭제 보호소 회원(본인), 관리자(admin)만 삭제 가능
	 */

//		DOG_NUMBER (삭제할 게시글 번호 - PK)
//		DOG_NUMBER (삭제할 게시글 번호 - PK)
//		ADMIN_NUMBER (로그인한 관리자 번호 - 관리자 확인용)

	// ===== 필드 =====
	private int dogNumber;
	private int userNumber;
	private int adminNumber;

	// ===== Getter,Setter =====
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

	public int getAdminNumber() {
		return adminNumber;
	}

	public void setAdminNumber(int adminNumber) {
		this.adminNumber = adminNumber;
	}

	// ===== Overried =====
	@Override
	public String toString() {
		return "ArchiveDeleteDTO [dogNumber=" + dogNumber + ", userNumber=" + userNumber + ", adminNumber="
				+ adminNumber + "]";
	}

}
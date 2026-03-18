package com.ddd.app.mypage.dto;

public class MypageSInfoDTO {

	private int userNumber;
	private String userType;
	private String userId;
	private String userPassword;
	private String userName;
	private String userNickname;
	private String userGender;
	private String userBirth;
	private String userPhone;
	private String userEmail;
	private String userStatus;
	private String shelterName;
	private String shelterBusinessNumber;
	private String shelterAddress;
	private String shelterCertification;
//	파일 추가 예정

	public int getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getShelterName() {
		return shelterName;
	}

	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}

	public String getShelterBusinessNumber() {
		return shelterBusinessNumber;
	}

	public void setShelterBusinessNumber(String shelterBusinessNumber) {
		this.shelterBusinessNumber = shelterBusinessNumber;
	}

	public String getShelterAddress() {
		return shelterAddress;
	}

	public void setShelterAddress(String shelterAddress) {
		this.shelterAddress = shelterAddress;
	}

	public String getShelterCertification() {
		return shelterCertification;
	}

	public void setShelterCertification(String shelterCertification) {
		this.shelterCertification = shelterCertification;
	}

	@Override
	public String toString() {
		return "MypageSInfoDTO [userNumber=" + userNumber + ", userType=" + userType + ", userId=" + userId
				+ ", userPassword=" + userPassword + ", userName=" + userName + ", userNickname=" + userNickname
				+ ", userGender=" + userGender + ", userBirth=" + userBirth + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", userStatus=" + userStatus + ", shelterName=" + shelterName
				+ ", shelterBusinessNumber=" + shelterBusinessNumber + ", shelterAddress=" + shelterAddress
				+ ", shelterCertification=" + shelterCertification + "]";
	}

}

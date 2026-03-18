package com.ddd.app.admin.dto;

public class AdminDTO {

//	CREATE TABLE ddd_admin(
//		admin_number NUMBER,
//		admin_id varchar2(100) NOT NULL,
//		admin_password varchar2(100) NOT NULL,
//		user_type char(1) DEFAULT 'A',
//		CONSTRAINT PK_admin_admin_number PRIMARY KEY (admin_number),
//		CONSTRAINT UK_admin_admin_id UNIQUE (admin_id)
//	);

	private int adminNumber;
	private String adminId;
	private String adminPassword;
	private String userType;

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getAdminNumber() {
		return adminNumber;
	}

	public void setAdminNumber(int adminNumber) {
		this.adminNumber = adminNumber;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	@Override
	public String toString() {
		return "AdminDTO [adminNumber=" + adminNumber + ", adminId=" + adminId + ", adminPassword=" + adminPassword
				+ ", userType=" + userType + "]";
	}

}

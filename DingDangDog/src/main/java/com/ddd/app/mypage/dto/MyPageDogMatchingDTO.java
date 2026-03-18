package com.ddd.app.mypage.dto;

// 마이페이지 매칭 결과  
public class MyPageDogMatchingDTO {
	/**
	 * @author 윤철민
	 * 
	 * @since jdk17
	 * 
	 *        매칭 결과 정보를 담기 위한 DTO 클래스 결과번호, 회원번호, 활동성, 사회성, 독립성, 짖음수준, 털관리, 저장날짜/시간
	 *        저장
	 */

//	--멍매칭결과

//	   result_number NUMBER,	// int
//	   user_number NUMBER,	// int
//	   result_created_date DATE DEFAULT SYSDATE NOT NULL,	// String

	// ===== 필드 =====
	private int resultNumber;
	private int userNumber;
	private String resultCreatedDate;

	// ===== Getter,Setter =====
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

	public String getResultCreatedDate() {
		return resultCreatedDate;
	}

	public void setResultCreatedDate(String resultCreatedDate) {
		this.resultCreatedDate = resultCreatedDate;
	}

	// ===== Overried =====
	@Override
	public String toString() {
		return "MyPageDogMatchingDTO [resultNumber=" + resultNumber + ", userNumber=" + userNumber
				+ ", resultCreatedDate=" + resultCreatedDate + "]";
	}

}

package com.ddd.app.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.mypage.dto.MypageSInfoDTO;
import com.ddd.app.user.dto.UserDTO;
import com.ddd.config.MyBatisConfig;

public class MypageDAO {

	public SqlSession sqlSession;

	public MypageDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 비밀번호 체크
	public int checkPassword(UserDTO userDTO) {
		System.out.println("비밀번호 체크");
		return sqlSession.selectOne("MPCInfo.checkPassword", userDTO);
	}
	
	// 정보변경페이지용 일반회원 정보 조회
	public UserDTO selectMyPageInfo(int UserNumber) {
		System.out.println("일반회원 마이페이지 정보 조회");
		return sqlSession.selectOne("MPCInfo.selectMyPageInfo", UserNumber);
	}
	// 정보변경페이지용 보호소회원 정보 조회
	public MypageSInfoDTO selectMyPageInfoS(int UserNumber) {
		System.out.println("보호소회원 마이페이지 정보 조회");
		return sqlSession.selectOne("MPSInfo.selectMyPageInfo", UserNumber);
	}

	// 닉네임 체크
	public boolean checkNickName(Map<String, Object> checkMap) {
		System.out.println("닉네임 체크");
		return (Integer) (sqlSession.selectOne("MPCInfo.checkNickName", checkMap)) < 1;
	}

	// 일반회원 정보수정
	public void updateMyPageInfo(Map<String, Object> updateMap) {
		System.out.println("일반회원 마이페이지 정보 수정");
		sqlSession.update("MPCInfo.updateMyPageInfo", updateMap);
	}
	// 보호소회원 정보수정
	public void updateMyPageInfoS(Map<String, Object> updateMap) {
		System.out.println("보호소회원 마이페이지 정보 수정");
		sqlSession.update("MPSInfo.updateMyPageInfo", updateMap);
	}

	// 회원 탈퇴처리
	public void updateToWithdraw(int userNumber) {
		System.out.println("회원 탈퇴 처리 시작 " + userNumber + "번 회원");
		sqlSession.update("MPCInfo.updateToWithdraw", userNumber);
	}

}

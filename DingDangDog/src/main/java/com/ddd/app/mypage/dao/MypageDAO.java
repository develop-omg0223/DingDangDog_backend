package com.ddd.app.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.mypage.dto.MyPageDogMatchingDTO;
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
	// ===== 매칭 결과 저장 =====
	public void insertMatchingResult(MyPageDogMatchingDTO matchingDTO) {
		sqlSession.insert("myPageMatching.insertMatchingResult", matchingDTO);
	}

	// ===== userNumber 매칭 이력 전체 조회 =====
	public List<MyPageDogMatchingDTO> selectMatchingList(int userNumber) {
		return sqlSession.selectList("myPageMatching.selectMatchingList", userNumber);
	}

	// ===== userNumber 현재 저장된 매칭 이력 개수 확인 =====
	public int countSavedResults(int userNumber) {
		return sqlSession.selectOne("myPageMatching.countSavedResults", userNumber);
	}

	// ===== 가장 오래된 결과 삭제 =====
	public void deleteOldestResult(int userNumber) {
		sqlSession.delete("myPageMatching.deleteOldestResult", userNumber);
	}
}
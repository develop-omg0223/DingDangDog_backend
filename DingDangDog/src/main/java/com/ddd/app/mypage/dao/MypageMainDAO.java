package com.ddd.app.mypage.dao;

import java.util.List; // 추가 필수

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.dogarchive.dto.ArchiveListDTO;
import com.ddd.app.dogmatching.dto.MatchingResultDTO; // 정확한 경로로 추가
import com.ddd.app.user.dto.UserDTO;
import com.ddd.config.MyBatisConfig;

public class MypageMainDAO {

	private SqlSession sqlSession;

	public MypageMainDAO() {
		// sqlSessionFactory()인지 getSqlSession()인지 프로젝트 공통설정 확인 필요
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 1. 일반 회원 정보 조회
	public UserDTO selectMyPageInfo(int userNumber) {
		return sqlSession.selectOne("MPCInfo.selectMyPageInfo", userNumber);
	}

	// 2. 매칭 결과 리스트 조회
	public List<MatchingResultDTO> selectMyResults(int userNumber) {
		return sqlSession.selectList("matching.selectMyResults", userNumber);
	}

	// 3. 보호소 회원이 등록한 최근 멍! 카이브 리스트 조회 (최근 4개)
	public List<ArchiveListDTO> selectRecentArchives(int userNumber) {
		// MyBatis의 selectList를 호출하되, 필요하다면 필터링 로직을 쿼리에 추가하거나
		// 여기서는 전체 리스트 중 상위 4개만 추출하는 방식으로 예시를 듭니다.
		return sqlSession.selectList("archive.selectList", userNumber);
	}
}
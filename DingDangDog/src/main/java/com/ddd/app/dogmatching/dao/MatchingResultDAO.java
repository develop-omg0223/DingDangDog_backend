package com.ddd.app.dogmatching.dao;

// ===== 멍! 매칭 DAO =====
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.dogarchive.dto.ArchiveReadDTO;
import com.ddd.app.dogmatching.dto.ArchiveScoreDTO;
import com.ddd.app.dogmatching.dto.MatchingResultDTO;
import com.ddd.config.MyBatisConfig;

public class MatchingResultDAO {
	public SqlSession sqlSession;

	public MatchingResultDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);

	}

	// 멍 매칭 결과 저장
	public void insertResult(MatchingResultDTO matchingResultDTO) {
		sqlSession.insert("matching.insertResult", matchingResultDTO);
	}

	// 추천 결과 조회 - 거리순 가까운 8마리
	public List<ArchiveReadDTO> selectTop8RecommendedDogs(int userNumber) {
		return sqlSession.selectList("matching.selectTop8", userNumber);
	}

	// 저장 건수 확인 - 5건 제한 확인용
	public int countSavedResults(int userNumber) {
		return sqlSession.selectOne("matching.countSavedResults", userNumber);
	}

	// 가장 오래된 결과 삭제 - 5건 초과시 호출
	public void deleteOldestResult(int userNumber) {
		sqlSession.delete("matching.deleteOldestResult", userNumber);
	}

	// 결과 조회 - 마이페이지
	public List<MatchingResultDTO> selectMyResults(int userNumber) {
		return sqlSession.selectList("matching.selectMyResults", userNumber);
	}
	
	// 전체 유기견 점수별 조회
	public List<ArchiveScoreDTO>  selectAllDogScore(){
		return sqlSession.selectList("dogMatching.selectAllDogScore");
	}
	
	

}

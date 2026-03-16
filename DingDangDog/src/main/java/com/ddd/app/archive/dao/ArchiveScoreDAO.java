package com.ddd.app.archive.dao;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.archive.dto.ArchiveScoreDTO;
import com.ddd.config.MyBatisConfig;

public class ArchiveScoreDAO {
	public SqlSession sqlSession;

	public ArchiveScoreDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 점수 입력
	public void insertScore(ArchiveScoreDTO archiveScoreDTO) {
		sqlSession.insert("archiveScore.insertScore", archiveScoreDTO);
	}

	// 점수 조회
	public ArchiveScoreDTO selectScore(int dogNumber) {
		return sqlSession.selectOne("archiveScore.selectScore", dogNumber);
	}

	// 점수 수정
	public void updateScore(ArchiveScoreDTO archiveScoreDTO) {
		sqlSession.update("archiveScore.updateScore", archiveScoreDTO);
	}
}

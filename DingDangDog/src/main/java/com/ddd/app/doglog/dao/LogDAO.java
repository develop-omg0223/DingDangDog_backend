package com.ddd.app.doglog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.doglog.dto.LogDTO;
import com.ddd.config.MyBatisConfig;

public class LogDAO {
	private SqlSession sqlSession;

	public LogDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 게시글 목록 조회
	public List<LogDTO> selectAll() {
		return sqlSession.selectList("log.selectAll");
	}

	// 게시글 단건 조회
	public LogDTO select(int logNumber) {
		return sqlSession.selectOne("log.select", logNumber);
	}

	// 게시글 상세 조회(닉네임 포함)
	public LogDTO selectDetail(int logNumber) {
		return sqlSession.selectOne("log.selectDetail", logNumber);
	}

	// 게시글 등록
	public void insert(LogDTO logDTO) {
		sqlSession.insert("log.insert", logDTO);
	}

	// 게시글 수정
	public void update(LogDTO logDTO) {
		sqlSession.update("log.update", logDTO);
	}

	// 게시글 삭제
	public void delete(int logNumber) {
		sqlSession.delete("log.delete", logNumber);
	}

	// 본인 글 여부 확인
	public int checkLogOwner(LogDTO logDTO) {
		return sqlSession.selectOne("log.checkLogOwner", logDTO);
	}

	// 제목 검색
	public List<LogDTO> searchByTitle(String keyword) {
		return sqlSession.selectList("log.searchByTitle", keyword);
	}

	// 작성자 검색
	public List<LogDTO> searchByWriter(String keyword) {
		return sqlSession.selectList("log.searchByWriter", keyword);
	}
}
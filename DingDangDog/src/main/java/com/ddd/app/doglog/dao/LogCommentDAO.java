package com.ddd.app.doglog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.doglog.dto.LogCommentDTO;
import com.ddd.config.MyBatisConfig;

public class LogCommentDAO {
	private SqlSession sqlSession;

	public LogCommentDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 특정 게시글 댓글 목록 조회
	public List<LogCommentDTO> selectCommentList(int logNumber) {
		return sqlSession.selectList("log.selectCommentList", logNumber);
	}

	// 댓글 단건 조회
	public LogCommentDTO selectComment(int commentNumber) {
		return sqlSession.selectOne("log.selectComment", commentNumber);
	}

	// 댓글 등록
	public int insertComment(LogCommentDTO logCommentDTO) {
		return sqlSession.insert("log.insertComment", logCommentDTO);
	}

	// 댓글 수정
	public int updateComment(LogCommentDTO logCommentDTO) {
		return sqlSession.update("log.updateComment", logCommentDTO);
	}

	// 댓글 삭제
	public int deleteComment(LogCommentDTO logCommentDTO) {
		return sqlSession.delete("log.deleteComment", logCommentDTO);
	}

	// 게시글 기준 댓글 전체 삭제
	public int deleteByLogNumber(int logNumber) {
		return sqlSession.delete("log.deleteCommentsByLogNumber", logNumber);
	}
}
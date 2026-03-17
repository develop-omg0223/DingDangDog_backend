package com.ddd.app.doglog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.doglog.dto.LogImgDTO;
import com.ddd.config.MyBatisConfig;

public class LogImgDAO {
	private SqlSession sqlSession;

	public LogImgDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 특정 게시글 이미지 목록 조회
	public List<LogImgDTO> selectImageList(int logNumber) {
		return sqlSession.selectList("log.selectImageList", logNumber);
	}

	// 대표 이미지 조회
	public LogImgDTO selectRepresentativeImage(int logNumber) {
		return sqlSession.selectOne("log.selectRepresentativeImage", logNumber);
	}

	// 이미지 등록
	public void insertImage(LogImgDTO logImgDTO) {
		sqlSession.insert("log.insertImage", logImgDTO);
	}

	// 게시글 기준 이미지 전체 삭제
	public void deleteImageByLogNumber(int logNumber) {
		sqlSession.delete("log.deleteImageByLogNumber", logNumber);
	}
	
	// 이미지 번호로 특정 이미지 삭제
	public void deleteImageByImageNumber(int logImgNumber) {
		sqlSession.delete("log.deleteImageByImageNumber", logImgNumber);
	}
}
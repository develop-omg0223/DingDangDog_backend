package com.ddd.app.report.dao;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.report.dto.ReportDTO;
import com.ddd.config.MyBatisConfig;

public class ReportDAO {
	
	public SqlSession sqlSession;
	
	public ReportDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 신고 등록
	public void insertReport(ReportDTO reportDTO) {
	    sqlSession.insert("report.insertReport", reportDTO);
	}
	
	// 신고 횟수 증가
	public void reportCount(int userNumber) {
		sqlSession.update("report.reportCount", userNumber);
	}
	
	// 신고 3회 누적 시 블랙리스트 자동 업데이트
	public void updateBlacklist(int userNumber) {
	    sqlSession.update("report.updateBlacklist", userNumber);
	}
}

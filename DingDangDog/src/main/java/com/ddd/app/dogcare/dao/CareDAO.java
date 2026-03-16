package com.ddd.app.dogcare.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.dogcare.dto.CareDTO;
import com.ddd.config.MyBatisConfig;

public class CareDAO {
	public SqlSession sqlSession;

	public CareDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	// 멍! 케어 리스트 조회 하는 쿼리문 메소드
	public List<CareDTO> selectCareList() {
	    return sqlSession.selectList("CareMapper.selectCareList");
	}
}

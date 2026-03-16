package com.ddd.app.dogarchive.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.dogarchive.dto.ArchiveImgDTO;
import com.ddd.config.MyBatisConfig;

public class ArchiveImgDAO {
	public SqlSession sqlSession;

	public ArchiveImgDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 이미지 정보 저장
	public void insert(ArchiveImgDTO archiveImgDTO) {
		sqlSession.insert("archiveImg.insert", archiveImgDTO);
	}

	// 특정 유기견 이미지 조회
	public List<ArchiveImgDTO> selectImgList(int dogNumber) {
		return sqlSession.selectList("archiveImg.selectImgList", dogNumber);
	}

}

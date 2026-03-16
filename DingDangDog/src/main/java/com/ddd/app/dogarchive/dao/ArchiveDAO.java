package com.ddd.app.dogarchive.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.dogarchive.dto.ArchiveDTO;
import com.ddd.config.MyBatisConfig;

public class ArchiveDAO {
	public SqlSession sqlSession;

	public ArchiveDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 유기견 등록 - 보호소 회원
	public void insertArchive(ArchiveDTO archiveDTO) {
		sqlSession.insert("archive.insert", archiveDTO);

	}

	// 유기견 전체 목록 (리스트) - 보호시작일 오래된 순서 정렬
	public List<ArchiveDTO> selectAllOrderByDate() {
		return sqlSession.selectList("archive.selectAllOrderByDate");

	}

	// 유기견 상세 정보
	public ArchiveDTO selectDetail(int dogNumber) {
		return sqlSession.selectOne("archive.selectDetail", dogNumber);
	}

	// 견종으로 검색
	public List<ArchiveDTO> selectByBreed(String dogBreed) {
		return sqlSession.selectList("archive.selectByBreed", dogBreed);
	}

	// 보호소명으로 검색
	public List<ArchiveDTO> selectByShelterName(String ShelterName) {
		return sqlSession.selectList("archive.selectByShelterName", ShelterName);
	}

	// 유기견 정보 수정
	public void updateArchive(ArchiveDTO archiveDTO) {
		sqlSession.update("archive.update", archiveDTO);
	}

	// 유기건 정보 삭제
	public void deleteArchive(int dogNumber) {
		sqlSession.delete("archive.delete", dogNumber);
	}
}

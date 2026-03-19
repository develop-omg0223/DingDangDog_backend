package com.ddd.app.dogarchive.dao;

// ===== 멍 카이브 DAO =====
import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.ddd.app.dogarchive.dto.ArchiveDeleteDTO;
import com.ddd.app.dogarchive.dto.ArchiveListDTO;
import com.ddd.app.dogarchive.dto.ArchiveReadDTO;
import com.ddd.app.dogarchive.dto.ArchiveUpdateDTO;
import com.ddd.app.dogarchive.dto.ArchiveWriteDTO;
import com.ddd.config.MyBatisConfig;

public class ArchiveDAO {
	public SqlSession sqlSession;

	public ArchiveDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// ===== 정보 등록 =====
	public void insert(ArchiveWriteDTO writeDTO) {
		// 1. 기본 정보 등록
		sqlSession.insert("archiveWrite.insertArchive", writeDTO);
		// 2. 성향 점수 등록
		sqlSession.insert("archiveWrite.insertScore", writeDTO);
		// 3. 이미지 정보 등록
		sqlSession.insert("archiveWrite.insertImg", writeDTO);
	}

	// ===== 정보 수정 =====
	public void update(ArchiveUpdateDTO updateDTO) {
		// 1. 기본 정보 수정
		sqlSession.update("archiveUpdate.updateArchive", updateDTO);
		// 2. 성향 점수 수정
		sqlSession.update("archiveUpdate.updateScore", updateDTO);
		// 3. 이미지 수정
		sqlSession.update("archiveUpdate.updateImg", updateDTO);
	}

	// ===== 정보 삭제 =====
	// adminNumber, userNumber(보호소)
	public void delete(ArchiveDeleteDTO deleteDTO) {
		sqlSession.delete("archiveDelete.delete", deleteDTO);
	}

	// ===== 전체목록 & 검색 =====
	// 메인 이미지 카드 리스트
	// 정렬 조건(보호일순)
	public List<ArchiveListDTO> selectList(ArchiveListDTO listDTO) {
		return sqlSession.selectList("archiveList.selectList", listDTO);
	}

	// 페이징 - 페이지네이션 1~5를 구현하기 위한 전체 게시글 개수 조회
	public int getTotalCount(ArchiveListDTO listDTO) {
		return sqlSession.selectOne("archiveList.getTotalCount", listDTO);
	}

	// ===== 상세 내역 조회 =====
	// 이름, 품종, 성별, 점수 등 모든 상세 내역 조회
	public ArchiveReadDTO selectDetail(int dogNumber) {
		return sqlSession.selectOne("archiveRead.selectDetail", dogNumber);
	}

}
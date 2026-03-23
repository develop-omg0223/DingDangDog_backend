package com.ddd.app.dogcare.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.dogcare.dto.CareApplyDTO;
import com.ddd.app.dogcare.dto.CareDTO;
import com.ddd.app.dogcare.dto.CareDetailDTO;
import com.ddd.app.dogcare.dto.CareListDTO;
import com.ddd.config.MyBatisConfig;

public class CareDAO {

	public SqlSession sqlSession;

	public CareDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 멍! 케어 게시글 총 개수 (검색 조건 포함)
	public int getTotal(Map<String, Object> params) {
	    return sqlSession.selectOne("care.getTotal", params);
	}

	// 멍! 케어 목록 조회 (Map<String, Integer> -> Map<String, Object>)
	public List<CareListDTO> selectCareList(Map<String, Object> params) {
	    return sqlSession.selectList("care.selectCareList", params);
	}

	// 멍! 케어 상세 조회
	public CareDetailDTO selectCare(int careNumber) {
		System.out.println("멍! 케어 상세 조회 실행 : " + careNumber);
		CareDetailDTO dto = sqlSession.selectOne("care.getDetail", careNumber);
		System.out.println("조회 결과 : " + dto);
		return dto;
	}

	// 멍! 케어 글 작성
	public int insertCare(CareDTO careDTO) {
		System.out.println("멍! 케어 글 작성 실행");
		int insert = sqlSession.insert("care.insertCare", careDTO);
		System.out.println("insert 결과 : " + insert);
		System.out.println("생성된 careNumber : " + careDTO.getCareNumber());
		return careDTO.getCareNumber();
	}

	// 멍! 케어 수정
	public void updateCare(CareDTO careDTO) {
		System.out.println("멍! 케어 글 수정 실행");
		sqlSession.update("care.updateCare", careDTO);
		System.out.println("멍! 케어 수정 완료");
	}

	

    // 멍! 케어 글 삭제 (소프트 삭제)
    public void deleteCare(int careNumber) {
        System.out.println("멍! 케어 글 삭제 실행 : " + careNumber);

        // 소프트 삭제: care_status = 'deleted'로 변경
        sqlSession.update("care.deleteCare", careNumber);

        System.out.println("멍! 케어 삭제 완료");
    }

	// 멍! 케어 신청
	public int applyCare(CareApplyDTO applyDTO) {
		System.out.println("멍! 케어 신청 실행");
		int result = sqlSession.insert("care.applyCare", applyDTO);
		System.out.println("신청 결과 : " + result);
		return result;
	}
	
	// 중복신청확
	public int checkDuplicateApply(int careNumber, int userNumber) {
        System.out.println("=== 중복 신청 체크 실행 ===");
        Map<String, Integer> params = new HashMap<>();
        params.put("careNumber", careNumber);
        params.put("userNumber", userNumber);
        
        // 중복 신청 체크 쿼리 실행
        int count = sqlSession.selectOne("care.checkDuplicateApply", params);
        System.out.println("중복 신청 여부: " + count);
        return count;  // count > 0이면 이미 신청한 상태
    }

	// 멍! 케어 신청 취소
	public int cancelApply(Map<String, Integer> map) {
		System.out.println("멍! 케어 신청 취소 실행 : " + map);
		int result = sqlSession.delete("care.cancelApply", map);
		System.out.println("신청 취소 결과 : " + result);
		return result;
	}

	// 신청자 수 조회
	public int getApplyCount(int careNumber) {
		System.out.println("신청자 수 조회 : " + careNumber);
		int count = sqlSession.selectOne("care.getApplyCount", careNumber);
		System.out.println("현재 신청자 수 : " + count);
		return count;
	}

	// 자동 마감
	public void closeCare(int careNumber) {
		System.out.println("멍! 케어 자동 마감 실행 : " + careNumber);
		sqlSession.update("care.closeCare", careNumber);
		System.out.println("멍! 케어 마감 완료");
	}

	// 다시 모집 open
	public void reopenCare(int careNumber) {
		System.out.println("멍! 케어 재오픈 실행 : " + careNumber);
		sqlSession.update("care.reopenCare", careNumber);
		System.out.println("멍! 케어 재오픈 완료");
	}

	// 신청자 목록 조회
	public List<CareApplyDTO> selectApplyUsers(int careNumber) {
		System.out.println("신청자 목록 조회 실행 : " + careNumber);
		List<CareApplyDTO> list = sqlSession.selectList("care.selectApplyUsers", careNumber);
		System.out.println("조회된 신청자 수 : " + list.size());
		return list;
	}

	// 멍! 케어 신청 현황 (ex: 3/10)
	public String getApplyStatus(int careNumber) {
		System.out.println("멍! 케어 신청 현황 조회");
		return sqlSession.selectOne("care.getApplyStatus", careNumber);
	}

	// 멍! 케어 신청 후 인원 증가
	public void incrementApplyCount(int careNumber) {
	    System.out.println("봉사 신청 인원 수 증가");
	    sqlSession.update("care.incrementApplyCount", careNumber);  // apply_count 증가
	}
	
	// 회원 정보 확인
	public boolean checkCareOwner(int careNumber, int userNumber) {
	    // SQL 쿼리로 careNumber에 해당하는 게시글의 userNumber를 가져온다
	    Integer ownerUserNumber = sqlSession.selectOne("care.checkCareOwner", careNumber);
	    System.out.println("1");
	    // 게시글 작성자와 현재 로그인된 사용자가 일치하는지 확인
	    return ownerUserNumber != null && ownerUserNumber.equals(userNumber);
	}

	// 날짜 마감
	public void updateExpiredStatus() {
	    sqlSession.update("care.updateExpiredStatus");
	}
}
package com.ddd.app.dogcare.dao;

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

    // 멍! 케어 게시글 총 개수
    public int getTotal() {
        System.out.println("멍! 케어 게시글 총 개수 조회 - getTotal 실행");
        return sqlSession.selectOne("care.getTotal");
    }

    // 멍! 케어 목록 조회
    public List<CareListDTO> selectCareList(Map<String, Integer> pageMap) {
        System.out.println("멍! 케어 목록 조회 실행 : " + pageMap);
        List<CareListDTO> list = sqlSession.selectList("care.selectCareList", pageMap);
        System.out.println("조회된 멍! 케어 게시글 수 : " + list);
        return list;
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
        int insert = sqlSession.insert("care.insert", careDTO);
        System.out.println("insert 결과 : " + insert);
        System.out.println("생성된 careNumber : " + careDTO.getCareNumber());
        return careDTO.getCareNumber();
    }

    // 멍! 케어 수정
    public void updateCare(CareDTO careDTO) {
        System.out.println("멍! 케어 글 수정 실행");
        sqlSession.update("care.update", careDTO);
        System.out.println("멍! 케어 수정 완료");
    }

    // 멍! 케어 삭제 (soft delete)
    public void deleteCare(int careNumber) {
        System.out.println("멍! 케어 글 삭제 실행 : " + careNumber);
        sqlSession.update("care.delete", careNumber);
        System.out.println("멍! 케어 삭제 완료");
    }

    // 멍! 케어 신청
    public int applyCare(CareApplyDTO applyDTO) {
        System.out.println("멍! 케어 신청 실행");
        int result = sqlSession.insert("care.applyCare", applyDTO);
        System.out.println("신청 결과 : " + result);
        return result;
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


}
package com.ddd.app.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.admin.dto.AdminCareDTO;
import com.ddd.app.admin.dto.AdminDTO;
import com.ddd.app.admin.dto.AdminUserDTO;
import com.ddd.config.MyBatisConfig;

public class AdminDAO {

	public SqlSession sqlSession;

	public AdminDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 관리자 로그인
	public AdminDTO adminLogin(AdminDTO adminDTO) {
		System.out.println("관리자 로그인");
		return sqlSession.selectOne("adminUser.adminLogin", adminDTO);
	}

	// 대시보드용 유저리스트
	public List<AdminUserDTO> getDashboardUserList() {
		System.out.println("대시보드용 유저리스트 호출");
		return sqlSession.selectList("adminUser.getDashboardUserList");
	}

	// 일반회원 총 인원수 조회
	public int getTotalCommon() {
		System.out.println("일반회원 총 인원수 조회");
		return sqlSession.selectOne("adminUser.getTotalCommon");
	}

	// 보호소회원 총 인원수 조회
	public int getTotalShelter() {
		System.out.println("보호소회원 총 인원수 조회");
		return sqlSession.selectOne("adminUser.getTotalShelter");
	}

	// 일반회원 검색후 인원수 조회
	public int getTotalCommonSearch(String searchType, String keyword) {
		System.out.println("일반회원 검색후 인원수 조회");
		if ("id".equals(searchType)) {
			return sqlSession.selectOne("adminUser.getTotalCommonByUserId", keyword);
		} else if ("nickname".equals(searchType)) {
			return sqlSession.selectOne("adminUser.getTotalCommonByUserNickname", keyword);
		}
		return getTotalCommon();
	}

	// 보호소회원 검색후 인원수 조회
	public int getTotalShelterSearch(String searchType, String keyword) {
		System.out.println("보호소회원 검색후 인원수 조회");
		if ("id".equals(searchType)) {
			return sqlSession.selectOne("adminUser.getTotalShelterByUserId", keyword);
		} else if ("nickname".equals(searchType)) {
			return sqlSession.selectOne("adminUser.getTotalShelterByUserNickname", keyword);
		}
		return getTotalShelter();
	}

	// 일반회원 전체 목록 조회
	public List<AdminUserDTO> selectCommonList(Map<String, Integer> pageMap) {
		System.out.println("일반회원 전체 목록 조회");
		return sqlSession.selectList("adminUser.selectCommonList", pageMap);
	}

	// 일반회원 검색 목록 조회
	public List<AdminUserDTO> selectCommonSearchList(Map<String, Object> searchMap) {
		System.out.println("일반회원 검색 목록 조회");
		String searchType = (String) searchMap.get("searchType");
		if ("id".equals(searchType)) {
			return sqlSession.selectList("adminUser.selectCommonListByUserId", searchMap);
		} else if ("nickname".equals(searchType)) {
			return sqlSession.selectList("adminUser.selectCommonListByUserNickname", searchMap);
		}
		return sqlSession.selectList("adminUser.selectCommonList", searchMap);
	}

	// 보호소회원 전체 목록 조회
	public List<AdminUserDTO> selectShelterList(Map<String, Integer> pageMap) {
		System.out.println("보호손회원 전체 목록 조회");
		return sqlSession.selectList("adminUser.selectShelterList", pageMap);
	}

	// 보호소회원 검색 목록 조회
	public List<AdminUserDTO> selectShelterSearchList(Map<String, Object> searchMap) {
		System.out.println("보호소회원 검색 목록 조회");
		String searchType = (String) searchMap.get("searchType");
		if ("id".equals(searchType)) {
			return sqlSession.selectList("adminUser.selectShelterListByUserId", searchMap);
		} else if ("nickname".equals(searchType)) {
			return sqlSession.selectList("adminUser.selectShelterListByUserNickname", searchMap);
		}
		return sqlSession.selectList("adminUser.selectShelterList", searchMap);
	}

	// 일반회원 상세 조회
	public AdminUserDTO selectCommonDetail(int userNumber) {
		System.out.println("일반회원 상세 조회 실행 : " + userNumber);
		return sqlSession.selectOne("adminUser.selectCommonDetail", userNumber);
	}

	// 보호소회원 상세 조회
	public AdminUserDTO selectShelterDetail(int userNumber) {
		System.out.println("보호소회원 상세 조회 실행 : " + userNumber);
		return sqlSession.selectOne("adminUser.selectShelterDetail", userNumber);
	}

	// 보호소 승인 업데이트
	public void updateShelterCertification(int userNumber) {
		System.out.println("보호소 승인 업데이트");
		sqlSession.update("adminUser.updateShelterCertification", userNumber);
	}

	// 멍! 케어 전체 목록 조회
    public List<AdminCareDTO> selectCareList(Map<String, Integer> pageMap){
    	System.out.println("멍케어 전체 리스트 조회");    	
        return sqlSession.selectList("adminCare.selectCareList", pageMap);
    }
    
    // 멍! 케어 게시글 총 개수
    public int getCareTotal() {
        System.out.println("멍! 케어 게시글 총 개수 조회 - getCareTotal 실행");
        return sqlSession.selectOne("adminCare.getCareTotal");
    }

    // 멍! 케어 검색
    public List<AdminCareDTO> searchCareList(Map<String, Object> searchMap){
        return sqlSession.selectList("adminCare.searchCareList", searchMap);
    }

    // 멍! 케어 상세정보 조회
    public AdminCareDTO selectCareDetail(int careNumber){
        return sqlSession.selectOne("adminCare.selectCareDetail", careNumber);
    }

    // 멍! 케어 신청자 현황
    public AdminCareDTO selectApplyStatus(Integer careNumber) {
        return sqlSession.selectOne("adminCare.selectApplyStatus", careNumber);
    }

    // 멍! 케어 신청자 목록
    public List<AdminCareDTO> selectApplyList(int careNumber){
        return sqlSession.selectList("adminCare.selectApplyList", careNumber);
    }

    // 멍! 케어 게시글 삭제 (status 변경)
    public void deleteCare(int careNumber){
        sqlSession.update("adminCare.deleteCare", careNumber);
    }


}

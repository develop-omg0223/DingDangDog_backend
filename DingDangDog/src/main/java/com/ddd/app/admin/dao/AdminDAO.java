package com.ddd.app.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.admin.dto.AdminUserDTO;
import com.ddd.config.MyBatisConfig;

public class AdminDAO {

	public SqlSession sqlSession;

	public AdminDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 일반회원 총 인원수 조회
	public int getTotalCommon() {
		System.out.println("일반회원 총 인원수 조회");
		return sqlSession.selectOne("admin.getTotalCommon");
	}

	// 보호소회원 총 인원수 조회
	public int getTotalShelter() {
		System.out.println("보호소회원 총 인원수 조회");
		return sqlSession.selectOne("admin.getTotalShelter");
	}

	// 일반회원 전체 목록 조회
	public List<AdminUserDTO> selectCommonList(Map<String, Integer> pageMap) {
		System.out.println("일반회원 전체 목록 조회");
		return sqlSession.selectList("admin.selectCommonList", pageMap);
	}

	// 보호소회원 전체 목록 조회
	public List<AdminUserDTO> selectShelterList(Map<String, Integer> pageMap) {
		System.out.println("보호손회원 전체 목록 조회");
		return sqlSession.selectList("admin.selectShelterList", pageMap);
	}

	// 일반회원 상세 조회
	public AdminUserDTO selectCommonDetail(int userNumber) {
		System.out.println("일반회원 상세 조회 실행 : " + userNumber);
		return sqlSession.selectOne("admin.selectCommonDetail", userNumber);
	}

	// 보호소회원 상세 조회
	public AdminUserDTO selectShelterDetail(int userNumber) {
		System.out.println("보호소회원 상세 조회 실행 : " + userNumber);
		return sqlSession.selectOne("admin.selectShelterDetail", userNumber);
	}

	// 보호소 승인 업데이트
	public void updateShelterCertification(int userNumber) {
		System.out.println("보호소 승인 업데이트");
		sqlSession.update("admin.updateShelterCertification", userNumber);
	}

}

package com.ddd.app.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.admin.dto.AdminArchiveDTO;
import com.ddd.config.MyBatisConfig;

public class AdminArchiveDAO {
	
	private SqlSession sqlSession;
	
	public AdminArchiveDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
	
	
	// 멍카이브 검색
	public List<AdminArchiveDTO> searchArchiveList(String searchType, String keyword) {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("searchType", searchType);
		paramMap.put("keyword", keyword);
		return sqlSession.selectList("adminArchive.searchArchiveList", paramMap);
	}
	
	//멍카이브 전체 검색
	public List<AdminArchiveDTO> searchAllArchiveList() {
		return sqlSession.selectList("adminArchive.searchAllArchiveList");
	}
	
	//멍카이브 상세
	public AdminArchiveDTO selectArchiveDetail(int dog_number) {
		return sqlSession.selectOne("adminArchive.selectArchiveDetail", dog_number);
		

	}
	
	//멍카이브 삭제
	public void deleteArchive(int dog_number) {
		sqlSession.delete("adminArchive.deleteArchive", dog_number);
	}
	
}


//<select id="searchArchiveList" parameterType="String"
//resultType="AdminArchiveDTO">
//SELECT a.dog_number, a.dog_name, a.dog_age, a.dog_weight,
//a.dog_breed, s.shelter_name, a.dog_safe_date
//FROM ddd_archive a
//JOIN
//ddd_user_shelter s ON a.user_number = s.user_number
//WHERE (
//a.dog_breed LIKE '%' || #{keyword} || '%'
//OR s.shelter_name LIKE '%' || #{keyword} || '%'
//)
//ORDER BY a.dog_archive_date DESC
//</select>
//
//<!-- 멍! 카이브 상세정보 -->
//<select id="selectArchiveDetail" parameterType="int"
//resultType="AdminArchiveDTO">
//SELECT a.dog_number, a.dog_name, a.dog_age, a.dog_weight,
//a.dog_breed, s.shelter_name, a.dog_safe_date, a.dog_detail,
//ai.archive_img_path
//FROM ddd_archive a
//JOIN ddd_user_shelter s ON
//a.user_number = s.user_number
//LEFT JOIN ddd_archive_img ai ON
//a.dog_number = ai.dog_number
//AND ai.archive_img_number = (
//SELECT
//MIN(ai2.archive_img_number)
//FROM ddd_archive_img ai2
//WHERE
//ai2.dog_number = a.dog_number
//)
//WHERE a.dog_number = #{dog_number}
//</select>
//
//<!-- 유기견 정보 삭제 -->
//<delete id="deleteArchive" parameterType="int">
//DELETE FROM ddd_archive
//WHERE dog_number =
//#{dog_number};
//</delete>
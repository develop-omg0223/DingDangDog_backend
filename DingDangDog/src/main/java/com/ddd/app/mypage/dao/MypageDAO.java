package com.ddd.app.mypage.dao;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.user.dto.UserDTO;
import com.ddd.config.MyBatisConfig;

public class MypageDAO {

	public SqlSession sqlSession;

	public MypageDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 비밀번호 체크
	public int checkPassword(UserDTO userDTO) {
		System.out.println("비밀번호 체크");
		return sqlSession.selectOne("MPCInfo.checkPassword", userDTO);
	}

}

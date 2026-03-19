package com.ddd.app.user.dao;

import org.apache.ibatis.session.SqlSession;

import com.ddd.app.user.dto.UserDTO;
import com.ddd.config.MyBatisConfig;

public class UserDAO {

	public SqlSession sqlSession;

	public UserDAO() {
		super();
		this.sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

	// 로그인 메소드
	public UserDTO login(UserDTO userDTO) {
		return sqlSession.selectOne("user.login", userDTO);
	}

	// 아이디 중복확인
	public boolean checkId(String userId) {
		return (Integer) (sqlSession.selectOne("user.checkId", userId)) < 1;
	}

	// 닉네임 중복확인
	public boolean checkNickName(String userNickName) {
		return (Integer) (sqlSession.selectOne("user.checkNickName", userNickName)) < 1;
	}

	// 이메일 중복확인
	public boolean checkEmail(String userEmail) {
		return (Integer) (sqlSession.selectOne("user.checkEmail", userEmail)) < 1;
	}

}

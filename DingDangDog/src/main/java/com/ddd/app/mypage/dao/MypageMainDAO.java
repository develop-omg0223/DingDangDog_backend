package com.ddd.app.mypage.dao;

import java.util.List; // 추가 필수
import org.apache.ibatis.session.SqlSession;

import com.ddd.app.user.dto.UserDTO;
import com.ddd.app.dogmatching.dto.MatchingResultDTO; // 정확한 경로로 추가
import com.ddd.config.MyBatisConfig;

public class MypageMainDAO {

    private SqlSession sqlSession;

    public MypageMainDAO() {
        // sqlSessionFactory()인지 getSqlSession()인지 프로젝트 공통설정 확인 필요
        sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
    }

    // 1. 일반 회원 정보 조회
    public UserDTO selectMyPageInfo(int userNumber) {
        return sqlSession.selectOne("MPCInfo.selectMyPageInfo", userNumber);
    }

    // 2. 매칭 결과 리스트 조회
    public List<MatchingResultDTO> selectMyResults(int userNumber) {
        return sqlSession.selectList("matching.selectMyResults", userNumber);
    }
}
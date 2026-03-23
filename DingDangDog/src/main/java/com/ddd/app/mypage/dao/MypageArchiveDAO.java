package com.ddd.app.mypage.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.ddd.app.mypage.dto.MypageArchiveDTO;
import com.ddd.config.MyBatisConfig;

public class MypageArchiveDAO {
    private SqlSession sqlSession;
    
    public MypageArchiveDAO(){
        sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
    }
    
    // 특정 유저의 멍카이브 목록 조회
    public List<MypageArchiveDTO> selectMyArchive(int userNumber) {
        return sqlSession.selectList("mypageArchive.selectMyArchive", userNumber);
    }
}
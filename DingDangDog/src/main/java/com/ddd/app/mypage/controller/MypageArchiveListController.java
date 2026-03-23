package com.ddd.app.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.mypage.dao.MypageArchiveDAO;
import com.ddd.app.mypage.dto.MypageArchiveDTO;

public class MypageArchiveListController implements Execute {
    
    @Override
    public Result execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== 멍!카이브 등록 정보 조회 요청 ===");

        HttpSession session = request.getSession();
        Result result = new Result();
        
        // 세션에서 유저 번호 가져오기 (로그인 체크)
        Integer userNumber = (Integer) session.getAttribute("userNumber");
        
        if (userNumber == null) {
            // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
            result.setPath("/app/user/login.jsp");
            result.setRedirect(true);
            return result;
        }

        // DAO 호출하여 리스트 데이터 가져오기
        MypageArchiveDAO archiveDAO = new MypageArchiveDAO();
        List<MypageArchiveDTO> archiveList = archiveDAO.selectMyArchive(userNumber);

        // JSP로 보낼 데이터 세팅
        request.setAttribute("archiveList", archiveList);

        // 리스트 형식의 전용 JSP로 이동 설정
        result.setPath("/app/mypage/shelter/archive_list.jsp");
        result.setRedirect(false); // forward
        
        return result;
    }
}
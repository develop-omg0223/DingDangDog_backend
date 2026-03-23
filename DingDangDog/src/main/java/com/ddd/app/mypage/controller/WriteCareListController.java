package com.ddd.app.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.mypage.dao.MypageCareDAO;
import com.ddd.app.mypage.dto.MypageScareDTO;

public class WriteCareListController implements Execute {
	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("=== 내가 등록한 멍! 케어 리스트 ===");

        HttpSession session = request.getSession();
        Result result = new Result();
        MypageCareDAO mypageCareDAO = new MypageCareDAO();

        // 세션에서 userNumber 가져오기
        Integer userNumber = (Integer) session.getAttribute("userNumber");
        System.out.println("조회하려는 유저 번호: " + userNumber);
        
        List<MypageScareDTO> careList = mypageCareDAO.selectMyCareList(userNumber);

        // 결과를 request에 설정하여 JSP로 전달
        request.setAttribute("careList", careList);
        
        result.setPath("/app/mypage/shelter/care_list.jsp");
        result.setRedirect(false);
        
		return result;
	}
}

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
import com.ddd.app.mypage.dto.MypageCcareDTO;

public class ApplyCareListController implements Execute {
	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("=== 내가 신청한 멍! 케어 목록 ===");

		HttpSession session = request.getSession();
		Result result = new Result();
		 // 세션에서 userNumber 가져오기
        int userNumber = (Integer) session.getAttribute("userNumber");
        System.out.println("조회하려는 유저 번호: " + userNumber);
        // 멍케어 신청 목록 조회
        MypageCareDAO mypageCcareDAO = new MypageCareDAO();
        List<MypageCcareDTO> applyList = mypageCcareDAO.selectApplyList(userNumber);

        // 신청 목록을 request에 설정하여 JSP로 전달
        request.setAttribute("applyList", applyList);

        result.setPath("/app/mypage/common/volunteer_status_list_common.jsp");
        result.setRedirect(false);
		
		return result;
	}

}

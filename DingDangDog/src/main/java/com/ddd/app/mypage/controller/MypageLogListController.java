package com.ddd.app.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.mypage.dao.MypageLogDAO;
import com.ddd.app.mypage.dto.MypageLogDTO;

public class MypageLogListController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    System.out.println("내가 작성한 멍! 로그 목록");
	    
	    


	    
	    HttpSession session = request.getSession();
	    session.setAttribute("userNumber",10001);
	    session.setAttribute("userType","C");
	    Integer userNumber = (Integer) session.getAttribute("userNumber");
	    String loginUserType = (String) session.getAttribute("userType");

	    Result result = new Result();


	    if (userNumber == null || loginUserType == null) {
	        System.out.println("비로그인 사용자 접근");
	        result.setPath(request.getContextPath() + "/login.me");
	        result.setRedirect(true);
	        return result;
	    }


	    if (!"C".equals(loginUserType)) {
	        System.out.println("보호소 회원 접근 차단");
	        result.setPath(request.getContextPath() + "/index.jsp");
	        result.setRedirect(true);
	        return result;
	    }

	    MypageLogDAO logDAO = new MypageLogDAO();
	    List<MypageLogDTO> logList = logDAO.selectMyLogs(userNumber);

	    System.out.println("조회된 logList 개수 : " + logList.size());

	    request.setAttribute("logList", logList);

	    result.setPath("/app/mypage/common/review_list.jsp");
	    result.setRedirect(false);
	    return result;
	}
}
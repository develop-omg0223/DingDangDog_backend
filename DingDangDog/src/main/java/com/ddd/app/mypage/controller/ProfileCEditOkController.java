package com.ddd.app.mypage.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.mypage.dao.MypageDAO;

public class ProfileCEditOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MypageDAO mypageDAO = new MypageDAO();
		Result result = new Result();

		int userNumber = (Integer) session.getAttribute("userNumber");
		String userNickname = request.getParameter("userNickname");
		String userPhone = request.getParameter("userPhone");
		String userPassword = request.getParameter("userPassword");

		Map<String, Object> updateMap = new HashMap<>();
		updateMap.put("userNumber", userNumber);
		updateMap.put("userNickname", userNickname);
		updateMap.put("userPhone", userPhone);

		if (userPassword != null && !userPassword.trim().isEmpty()) {
			updateMap.put("userPassword", userPassword);
		}

		mypageDAO.updateMyPageInfo(updateMap);
		System.out.println("정보수정 완료");

		result.setPath(request.getContextPath() + "/mypage/mypageMain.mp");
		result.setRedirect(true);

		return result;
	}

}

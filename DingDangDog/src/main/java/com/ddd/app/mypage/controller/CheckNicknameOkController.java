package com.ddd.app.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.mypage.dao.MypageDAO;

public class CheckNicknameOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MypageDAO mypageDAO = new MypageDAO();
		Result result = new Result();

		int userNumber = (Integer) session.getAttribute("userNumber");
		System.out.println(userNumber);
		String userNickname = request.getParameter("userNickname");
		System.out.println(userNickname);

		Map<String, Object> checkMap = new HashMap<>();
		checkMap.put("userNickname", userNickname);
		checkMap.put("userNumber", userNumber);

		boolean isAvailable = mypageDAO.checkNickName(checkMap);
		System.out.println(isAvailable);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		try (PrintWriter out = response.getWriter()) {
			out.print("{\"available\" : " + isAvailable + "}");
			out.flush();
		}

		result.setPath(null);
		result.setRedirect(false);
		return result;
	}
}
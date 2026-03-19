package com.ddd.app.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.user.dao.UserDAO;

public class CheckEmailOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO userDAO = new UserDAO();
		Result result = new Result();
		
		String userEmail = request.getParameter("userEmail");
		System.out.println(userEmail);
		boolean isAvailable = userDAO.checkEmail(userEmail);
		System.out.println(isAvailable);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		try (PrintWriter out = response.getWriter()) {
			out.print("{\"available\" : " + isAvailable + "}");
			out.flush();
		}

		// Result 객체 반환(json 응답 처리 후 페이지 이동 없음)
		result.setPath(null); // 페이지 이동이 없음을 명시
		result.setRedirect(false); // 리다이렉트 설정 false로 유지
		return result;
	}
	
}

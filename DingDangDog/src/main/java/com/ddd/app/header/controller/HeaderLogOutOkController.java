package com.ddd.app.header.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;

public class HeaderLogOutOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("로그아웃 처리");

		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		Result result = new Result();
		result.setPath(request.getContextPath() + "/mainpage/Main.main");
		result.setRedirect(true);
		
		return result;
	}
}
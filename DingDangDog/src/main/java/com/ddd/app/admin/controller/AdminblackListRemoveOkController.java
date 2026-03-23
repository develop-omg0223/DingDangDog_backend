package com.ddd.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;

public class AdminblackListRemoveOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===AdminblackListRemoveOkController 실행===");
		AdminDAO adminDAO = new AdminDAO();
		Result result = new Result();

		// 1. JS에서 보낸 userNumber 파라미터 받기
		int userNumber = Integer.parseInt(request.getParameter("userNumber"));

		adminDAO.removeBlackList(userNumber);

		System.out.println(userNumber + "번 블랙리스트 해제 완료");

		result.setPath(request.getContextPath() + "/admin/blackListOk.ad");
		result.setRedirect(true);
		return result;
	}

}

package com.ddd.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;

public class AdminCareDeleteOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("=== AdminCareDeleteOkController 실행 ===");

		Result result = new Result();
		AdminDAO adminDAO = new AdminDAO();

		// 게시글 번호 받기
		int careNumber = Integer.parseInt(request.getParameter("careNumber"));
		System.out.println("삭제할 글 번호 : " + careNumber);

		// 게시글 삭제
		adminDAO.deleteCare(careNumber);
		System.out.println("삭제 완료");

		// 목록으로 이동 (redirect)
		result.setPath(request.getContextPath() + "/admin/adminCareListOk.ad");
		result.setRedirect(true);

		return result;
	}

}

package com.ddd.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;
import com.ddd.app.admin.dto.AdminUserDTO;

public class AdminDashBoardOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===AdminDashBoardOkController 실행===");
		AdminDAO adminDAO = new AdminDAO();
		Result result = new Result();

		List<AdminUserDTO> userList = null;

		userList = adminDAO.getDashboardUserList();

		request.setAttribute("userList", userList);
		System.out.println("대시보드 userList : " + userList);

		result.setPath("/app/admin/dashboard/admin_dashboard.jsp");
		result.setRedirect(false);

		return result;
	}

}

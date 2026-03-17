package com.ddd.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;
import com.ddd.app.admin.dto.AdminUserDTO;

public class AdminUserCDetailOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===AdminUserCDetailOkController 실행===");

		int userNumber = Integer.parseInt(request.getParameter("userNumber"));

		AdminDAO adminDAO = new AdminDAO();
		Result result = new Result();
		AdminUserDTO adminUserDTO = new AdminUserDTO();

		adminUserDTO = adminDAO.selectCommonDetail(userNumber);
		System.out.println("조회한 회원 : " + adminUserDTO);

		request.setAttribute("user", adminUserDTO);

		result.setPath("/app/admin/userlist/admin_user_detail_common.jsp");
		result.setRedirect(false);

		return result;
	}

}

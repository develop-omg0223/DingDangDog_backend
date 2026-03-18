package com.ddd.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;
import com.ddd.app.admin.dto.AdminDTO;

public class AdminLoginOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AdminDTO adminDTO = new AdminDTO();
		AdminDAO adminDAO = new AdminDAO();
		Result result = new Result();

		AdminDTO loginAdmin = null;

		String adminID = request.getParameter("adminId");
		String adminPassword = request.getParameter("adminPassword");
		String path = null;

		HttpSession session = request.getSession();

		adminDTO.setAdminId(adminID);
		adminDTO.setAdminPassword(adminPassword);
		System.out.println("adminDTO : \n" + adminDTO);

		loginAdmin = adminDAO.adminLogin(adminDTO);
		System.out.println(loginAdmin);

		if (loginAdmin != null) {
			path = request.getContextPath() + "/admin/dashboard.ad";

			session.setAttribute("adminNumber", loginAdmin.getAdminNumber());
			session.setAttribute("adminId", loginAdmin.getAdminId());
			System.out.println("로그인 관리자 번호 : " + loginAdmin.getAdminNumber());
		} else {
			path = request.getContextPath() + "/admin/adminLogin.ad?adminLogin=fail";

		}
		result.setRedirect(true); // 세션에 저장된 값은 유지
		result.setPath(path);

		return result;
	}

}

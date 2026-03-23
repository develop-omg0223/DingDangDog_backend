package com.ddd.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;
import com.ddd.app.admin.dao.AdminLogDAO;
import com.ddd.app.admin.dto.AdminBlackDTO;
import com.ddd.app.admin.dto.AdminInquiryDTO;
import com.ddd.app.admin.dto.AdminLogDTO;
import com.ddd.app.admin.dto.AdminUserDTO;

public class AdminDashBoardOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===AdminDashBoardOkController 실행===");
		AdminDAO adminDAO = new AdminDAO();
		AdminLogDAO adLogDAO = new AdminLogDAO();
		Result result = new Result();

		List<AdminUserDTO> userList = null;
		List<AdminBlackDTO> blackList = null;
		List<AdminLogDTO> logList = null;
		List<AdminInquiryDTO> inquiryList = null;

		userList = adminDAO.getDashboardUserList();
		logList = adLogDAO.getDashboardLogList();
		blackList = adminDAO.getDashboardBlackList();
		inquiryList = adminDAO.getDashboardInquiryList();

		request.setAttribute("userList", userList);
		request.setAttribute("logList", logList);
		request.setAttribute("blackList", blackList);
		request.setAttribute("inquiryList", inquiryList);
		System.out.println("대시보드 userList : " + userList);
		System.out.println("대시보드 logList : " + logList);
		System.out.println("대시보드 blackList : " + blackList);
		System.out.println("대시보드 inquiryList : " + inquiryList);

		result.setPath("/app/admin/dashboard/admin_dashboard.jsp");
		result.setRedirect(false);

		return result;
	}

}

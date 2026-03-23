package com.ddd.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;
import com.ddd.app.admin.dto.AdminBlackDTO;

public class AdminBlackListDetailOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===AdminBlackDetailOkController 실행===");
		AdminDAO adminDAO = new AdminDAO();
		AdminBlackDTO adminBlackDTO = new AdminBlackDTO();
		Result result = new Result();

		int userNumber = Integer.parseInt(request.getParameter("userNumber"));

		adminBlackDTO = adminDAO.selectBlackDetail(userNumber);

		System.out.println("조회한 회원 : " + adminBlackDTO);

		request.setAttribute("black", adminBlackDTO);

		result.setPath("/app/admin/blacklist/admin_blacklist_detail.jsp");
		result.setRedirect(false);

		return result;
	}

}

package com.ddd.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;

public class AdminUserShelterConfirmOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===AdminUserShelterConfirmOkController 실행===");
		
		int userNumber = Integer.parseInt(request.getParameter("userNumber"));

		AdminDAO adminDAO = new AdminDAO();
		Result result = new Result();
		
		adminDAO.updateShelterCertification(userNumber);
		
		result.setPath(request.getContextPath() + "/admin/userSDetailOk.ad?userNumber=" + userNumber);
        result.setRedirect(true);

		return result;
	}

}

package com.ddd.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminArchiveDAO;
import com.ddd.app.admin.dto.AdminArchiveDTO;

public class AdminArchiveDetailOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("(관리자) 멍! 카이브 상세");

		int dogNumber = Integer.parseInt(request.getParameter("dogNumber"));

		AdminArchiveDAO adminArchiveDAO = new AdminArchiveDAO();
		AdminArchiveDTO archive = adminArchiveDAO.selectArchiveDetail(dogNumber);

		request.setAttribute("archive", archive);

		Result result = new Result();
		result.setPath("/app/admin/dogarchive/admin_dogarchive_detail.jsp");
		result.setRedirect(false);
		return result;
	}
}
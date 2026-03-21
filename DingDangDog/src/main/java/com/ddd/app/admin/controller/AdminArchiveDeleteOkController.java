package com.ddd.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminArchiveDAO;

public class AdminArchiveDeleteOkController implements Execute{

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("관리자 멍!카이브 삭제");
		int dogNumber = Integer.parseInt(request.getParameter("dogNumber"));
		AdminArchiveDAO archiveDAO = new AdminArchiveDAO();
		archiveDAO.deleteArchive(dogNumber);
		
		Result result = new Result();
		result.setPath(request.getContextPath() + "/admin/adminArchiveListOk.ad");
		result.setRedirect(true);
		return result;
	}

}

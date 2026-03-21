package com.ddd.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminArchiveDAO;
import com.ddd.app.admin.dto.AdminArchiveDTO;

public class AdminArchiveListOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("(관리자) 멍! 카이브 리스트 조회");

		AdminArchiveDAO adminArchiveDAO = new AdminArchiveDAO();
		List<AdminArchiveDTO> archiveList = adminArchiveDAO.searchAllArchiveList();

		request.setAttribute("archiveList", archiveList);

		Result result = new Result();
		result.setPath("/app/admin/dogarchive/admin_dogarchive_list.jsp");
		result.setRedirect(false);

		return result;
	}
}
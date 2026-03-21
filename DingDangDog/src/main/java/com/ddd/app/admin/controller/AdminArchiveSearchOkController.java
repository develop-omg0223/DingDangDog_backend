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

public class AdminArchiveSearchOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("(관리자) 멍! 카이브 검색");

		request.setCharacterEncoding("UTF-8");

		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");

		if (searchType == null || searchType.trim().isEmpty()) {
			searchType = "all";
		}

		if (keyword == null) {
			keyword = "";
		}
		keyword = keyword.trim();

		AdminArchiveDAO adminArchiveDAO = new AdminArchiveDAO();
		List<AdminArchiveDTO> archiveList;

		if (keyword.isEmpty()) {
			archiveList = adminArchiveDAO.searchAllArchiveList();
		} else {
			archiveList = adminArchiveDAO.searchArchiveList(searchType, keyword);
		}

		request.setAttribute("archiveList", archiveList);
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);

		Result result = new Result();
		result.setPath("/app/admin/dogarchive/admin_dogarchive_list.jsp");
		result.setRedirect(false);

		return result;
	}
}
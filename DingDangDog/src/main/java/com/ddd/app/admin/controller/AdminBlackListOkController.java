package com.ddd.app.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;
import com.ddd.app.admin.dto.AdminBlackDTO;

public class AdminBlackListOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===AdminBlackListOkController 실행===");
		AdminDAO adminDAO = new AdminDAO();
		Result result = new Result();

		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		boolean isSearch = keyword != null && !keyword.trim().isEmpty();

		String temp = request.getParameter("page");
		int page = (temp == null) ? 1 : Integer.valueOf(temp);
		int rowCount = 15;
		int pageCount = 5;

		int startRow = (page - 1) * rowCount + 1;
		int endRow = startRow + rowCount - 1;

		Map<String, Object> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);

		if (isSearch) {
			pageMap.put("searchType", searchType);
			pageMap.put("keyword", keyword);
		}

		List<AdminBlackDTO> blackList = null;
		int total = 0;

		if (isSearch) {
			blackList = adminDAO.selectBlackSearchList(pageMap);
			total = adminDAO.getTotalBlackSearch(searchType, keyword);
		} else {
			blackList = adminDAO.selectBlackList(pageMap);
			total = adminDAO.getTotalBlack();
		}

		int realEndPage = (int) (Math.ceil(total / (double) rowCount));
		int endPage = (int) (Math.ceil(page / (double) pageCount) * pageCount);
		int startPage = endPage - (pageCount - 1);

		endPage = Math.min(endPage, realEndPage);

		boolean prev = startPage > 1;
		boolean next = endPage < realEndPage;

		request.setAttribute("blackList", blackList);
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("total", total);
		request.setAttribute("page", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);

		System.out.println("======페이징 정보 확인======");
		System.out.println("pageMap : " + pageMap);
		System.out.println("blackList : " + blackList);
		System.out.println(
				"startPage : " + startPage + ", endPage : " + endPage + ", prev : " + prev + ", next : " + next);
		System.out.println("searchType : " + searchType);
		System.out.println("keyword : " + keyword);
		System.out.println("isSearch: " + isSearch);
		System.out.println("=========================");

		result.setPath("/app/admin/blacklist/admin_blacklist.jsp");
		result.setRedirect(false);

		return result;
	}

}

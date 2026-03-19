package com.ddd.app.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.main.dao.mainDAO;
import com.ddd.app.main.dto.mainArchiveDTO;
import com.ddd.app.main.dto.mainCareDTO;

public class mainOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("메인페이지 이동");

		mainDAO dao = new mainDAO();

		List<mainArchiveDTO> archiveList = dao.selectMainArchiveList();
		List<mainCareDTO> careList = dao.selectMainCareList();

		System.out.println("archiveList 개수 : " + archiveList.size());
		System.out.println("careList 개수 : " + careList.size());

		request.setAttribute("archiveList", archiveList);
		request.setAttribute("careList", careList);

		Result result = new Result();
		result.setPath("/app/main.jsp");
		result.setRedirect(false);

		return result;
	}
}
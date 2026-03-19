package com.ddd.app.doglog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.doglog.dao.LogDAO;
import com.ddd.app.doglog.dao.LogImgDAO;
import com.ddd.app.doglog.dto.LogDTO;
import com.ddd.app.doglog.dto.LogImgDTO;

public class DogLogEditController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("멍! 로그 수정 페이지");

		Integer loginUserNumber = (Integer) request.getSession().getAttribute("userNumber");
		if (loginUserNumber == null) {
			Result result = new Result();
			result.setPath(request.getContextPath() + "/member/login.me");
			result.setRedirect(true);
			return result;
		}

		int editLogNumber = Integer.parseInt(request.getParameter("logNumber"));
		LogDAO editDAO = new LogDAO();
		LogDTO editLog = editDAO.selectDetail(editLogNumber);

		if (editLog == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}

		if (editLog.getUserNumber() != loginUserNumber) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}

		LogImgDAO editImgDAO = new LogImgDAO();
		List<LogImgDTO> imageList = editImgDAO.selectImageList(editLogNumber);

		String logDateStr = "";

		request.setAttribute("log", editLog);
		request.setAttribute("logDateStr", logDateStr);
		request.setAttribute("imageList", imageList);

		Result result = new Result();
		result.setPath("/app/doglog/doglog_edit.jsp");
		result.setRedirect(false);
		return result;
	}
}
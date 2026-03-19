package com.ddd.app.doglog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.doglog.dao.LogCommentDAO;
import com.ddd.app.doglog.dao.LogDAO;
import com.ddd.app.doglog.dao.LogImgDAO;
import com.ddd.app.doglog.dto.LogCommentDTO;
import com.ddd.app.doglog.dto.LogDTO;
import com.ddd.app.doglog.dto.LogImgDTO;

public class DogLogDetailController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("멍! 로그 상세");

		int logNumber = Integer.parseInt(request.getParameter("logNumber"));

		LogDAO detailDAO = new LogDAO();
		LogImgDAO detailImgDAO = new LogImgDAO();
		LogCommentDAO logCommentDAO = new LogCommentDAO();

		LogDTO log = detailDAO.selectDetail(logNumber);
		List<LogImgDTO> imageList = detailImgDAO.selectImageList(logNumber);
		List<LogCommentDTO> commentList = logCommentDAO.selectCommentList(logNumber);

		String logDateStr = "";

		request.setAttribute("log", log);
		request.setAttribute("logDateStr", logDateStr);
		request.setAttribute("imageList", imageList);
		request.setAttribute("commentList", commentList);

		Result result = new Result();
		result.setPath("/app/doglog/doglog_detail.jsp");
		result.setRedirect(false);
		return result;
	}
}
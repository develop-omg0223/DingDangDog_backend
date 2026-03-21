package com.ddd.app.dogarchive.controller;

//===== 멍 카이브 Front =====
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;

public class ArchiveFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ===== Encoding - UTF-8 =====
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 경로 추출
		String target = request.getRequestURI().substring(request.getContextPath().length());
		Result result = null;

		// ===== 요청별 분기 처리 =====
		switch (target) {

		// ===== 목록 조회 =====
		case "/archive/list.ar":
			result = new ArchiveListController().execute(request, response);
			break;

		// ===== 상세 보기 =====
		case "/archive/read.ar":
			result = new ArchiveReadController().execute(request, response);
			break;

		// ===== archive_write.jsp 페이지 이동 =====
		case "/archive/write.ar":
			result = new Result();
			result.setPath("/app/dogarchive/dogarchive_write.jsp");
			result.setRedirect(false);
			break;

		// ===== 등록 처리 =====
		case "/archive/writeOk.ar":
			result = new ArchiveWriteOkController().execute(request, response);
			break;

		// ===== 수정 페이지 이동 =====
		case "/archive/update.ar":
			result = new ArchiveUpdateController().execute(request, response);
			break;

		// ===== 수정 처리 =====
		case "/archive/updateOk.ar":
			result = new ArchiveUpdateOkController().execute(request, response);
			break;

		// ===== 삭제 처리 =====
		case "/archive/deleteOk.ar":
			result = new ArchiveDeleteOkController().execute(request, response);
			break;
		}

		// ===== 최종 페이지 이동 =====
		if (result != null && result.getPath() != null) {
			if (result.isRedirect()) {
				response.sendRedirect(result.getPath());
			} else {
				request.getRequestDispatcher(result.getPath()).forward(request, response);
			}
		}
	}
}






















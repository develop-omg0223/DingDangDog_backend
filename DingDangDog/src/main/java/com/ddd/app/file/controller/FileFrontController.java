package com.ddd.app.file.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileFrontController() {
		super();
	}

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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("FileFrontController 실행");
		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("파일 프론트 컨트롤러 현재 경로 : " + target);

		switch (target) {
		case "/file/fileDownload.fi":
			System.out.println("파일 다운로드 요청");
			new FileDownloadController().execute(request, response);
			System.out.println("파일 다운로드 완료");
			break;
		}

	}
}
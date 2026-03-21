package com.ddd.app.doglog.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.doglog.dao.LogDAO;
import com.ddd.app.doglog.dao.LogImgDAO;
import com.ddd.app.doglog.dto.LogDTO;
import com.ddd.app.doglog.dto.LogImgDTO;

public class DogLogWriteOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("멍! 로그 작성 완료 진입");

		HttpSession session = request.getSession();
		Object userNumberObj = session.getAttribute("userNumber");

		if (userNumberObj == null) {
			System.out.println("세션에 userNumber 없음");
			Result result = new Result();
			result.setPath(request.getContextPath() + "/member/login.me");
			result.setRedirect(true);
			return result;
		}

		int userNumber = (Integer) userNumberObj;
		String logTitle = request.getParameter("logTitle");
		String logPost = request.getParameter("logPost");

		System.out.println("userNumber = " + userNumber);
		System.out.println("logTitle = " + logTitle);
		System.out.println("logPost 길이 = " + (logPost == null ? 0 : logPost.length()));

		if (logTitle == null || logTitle.trim().isEmpty()
				|| logPost == null || logPost.trim().isEmpty()) {
			System.out.println("제목 또는 내용 비어 있음");
			Result result = new Result();
			result.setPath(request.getContextPath() + "/log/write.lo");
			result.setRedirect(true);
			return result;
		}

		LogDTO logDTO = new LogDTO();
		logDTO.setUserNumber(userNumber);
		logDTO.setLogTitle(logTitle);
		logDTO.setLogPost(logPost);

		LogDAO logDAO = new LogDAO();
		logDAO.insert(logDTO);

		int logNumber = logDTO.getLogNumber();
		System.out.println("생성된 logNumber = " + logNumber);

		LogImgDAO logImgDAO = new LogImgDAO();

		String uploadPath = request.getServletContext().getRealPath("/upload/doglog");
		System.out.println("uploadPath = " + uploadPath);

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			boolean made = uploadDir.mkdirs();
			System.out.println("upload 폴더 생성 여부 = " + made);
		}

		Collection<Part> parts = request.getParts();
		System.out.println("parts 개수 = " + parts.size());

		for (Part part : parts) {
			System.out.println("part name = " + part.getName());
			System.out.println("submittedFileName = " + part.getSubmittedFileName());
			System.out.println("size = " + part.getSize());

			if (!"logImages".equals(part.getName())) continue;
			if (part.getSize() == 0) continue;

			String submittedFileName = part.getSubmittedFileName();
			if (submittedFileName == null || submittedFileName.isBlank()) continue;

			String savedFileName = System.currentTimeMillis() + "_" + submittedFileName;
			File saveFile = new File(uploadDir, savedFileName);

			System.out.println("저장 파일명 = " + savedFileName);
			System.out.println("저장 전체경로 = " + saveFile.getAbsolutePath());

			part.write(saveFile.getAbsolutePath());

			LogImgDTO logImgDTO = new LogImgDTO();
			logImgDTO.setLogNumber(logNumber);
			logImgDTO.setLogImgName(savedFileName);
			logImgDTO.setLogImgPath("/upload/doglog/" + savedFileName);

			logImgDAO.insertImage(logImgDTO);
			System.out.println("DB 이미지 저장 완료");
		}

		Result result = new Result();
		result.setPath(request.getContextPath() + "/log/detail.lo?logNumber=" + logNumber);
		result.setRedirect(true);
		return result;
	}
}
package com.ddd.app.dogarchive.controller;

//===== 멍 카이브 수정 ===== 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dao.ArchiveDAO;
import com.ddd.app.dogarchive.dto.ArchiveReadDTO;
import com.ddd.app.dogarchive.dto.ArchiveUpdateDTO;

public class ArchiveUpdateController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// ===== 객체 =====
		Result result = new Result();
		ArchiveDAO dao = new ArchiveDAO();
		ArchiveUpdateDTO updateDTO = new ArchiveUpdateDTO();

		// ===== 수정할 dogNumber =====
		int dogNumber = Integer.parseInt(request.getParameter("dogNumber"));

		// ===== 기존 dogNumber 조회 =====
		ArchiveReadDTO detail = dao.selectDetail(dogNumber);

		// ===== 수정 페이지로 전달 =====
		request.setAttribute("archive", detail);

		// ===== archive_edit.jsp로 이동 =====
		result.setPath("/app/dogarchive/dogarchive_edit.jsp");
		result.setRedirect(false);

		return result;
	}
}
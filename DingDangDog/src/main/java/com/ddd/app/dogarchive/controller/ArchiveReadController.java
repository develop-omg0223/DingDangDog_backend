package com.ddd.app.dogarchive.controller;

// ===== 멍 카이브 조회 =====
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dao.ArchiveDAO;
import com.ddd.app.dogarchive.dto.ArchiveReadDTO;

public class ArchiveReadController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 객체
		Result result = new Result();
		ArchiveDAO dao = new ArchiveDAO();

		// ===== 리스트에서 넘어온 dogNumber =====
		String dogNumberParam = request.getParameter("dogNumber");

		if (dogNumberParam != null) {
			int dogNumber = Integer.parseInt(dogNumberParam);

			// ===== DB에서 dogNumber 상세 정보 및 성향 점수 조회 =====
			ArchiveReadDTO archive = dao.selectDetail(dogNumber);

			// ===== 데이터 전달 =====
			request.setAttribute("archive", archive);
		}

		// ===== dogarchive_detail.jsp로 이동 =====
		result.setPath("/app/dogarchive/dogarchive_detail.jsp");
		result.setRedirect(false);

		return result;
	}
}
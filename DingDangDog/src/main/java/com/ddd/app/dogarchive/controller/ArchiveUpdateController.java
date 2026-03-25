package com.ddd.app.dogarchive.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dao.ArchiveDAO;
import com.ddd.app.dogarchive.dto.ArchiveReadDTO;

/**
 * 멍! 카이브 수정 페이지 이동 컨트롤러
 * 수정사항: JSP에서 데이터 누락 방지를 위해 Attribute Name 최적화
 */
public class ArchiveUpdateController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Result result = new Result();
		ArchiveDAO dao = new ArchiveDAO();

		// 1. 수정할 강아지 번호 받기
		String dogNumberParam = request.getParameter("dogNumber");
		if (dogNumberParam == null || dogNumberParam.isEmpty()) {
			// 번호가 없으면 목록으로 리다이렉트 (예외 방지)
			result.setPath(request.getContextPath() + "/archive/list.ar");
			result.setRedirect(true);
			return result;
		}

		int dogNumber = Integer.parseInt(dogNumberParam);

		// 2. 기존 데이터 조회 (상세보기와 동일한 DAO 메서드 사용)
		ArchiveReadDTO detail = dao.selectDetail(dogNumber);

		// 3. 수정 페이지(JSP)로 데이터 전달
		// JSP에서 ${archive.dogDetail} 혹은 ${detail.dogDetail} 중 무엇을 써도 나오도록 둘 다 세팅
		request.setAttribute("archive", detail);
		request.setAttribute("detail", detail);

		// 4. dogarchive_edit.jsp로 이동 (포워드 방식)
		result.setPath("/app/dogarchive/dogarchive_edit.jsp");
		result.setRedirect(false);

		return result;
	}
}
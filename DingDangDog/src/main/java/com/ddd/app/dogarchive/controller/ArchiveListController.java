package com.ddd.app.dogarchive.controller;

//===== 멍 카이브 리스트 조회 =====
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dao.ArchiveDAO;
import com.ddd.app.dogarchive.dto.ArchiveListDTO;

public class ArchiveListController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 객체
		Result result = new Result();
		ArchiveDAO dao = new ArchiveDAO();
		ArchiveListDTO listDTO = new ArchiveListDTO();

		// ===== 전체 목록 조회 =====
		List<ArchiveListDTO> archiveList = dao.selectList(listDTO);

		request.setAttribute("archiveList", archiveList);

		// ===== dogarchive_list.jsp로 이동 =====
		result.setPath("/app/dogarchive/dogarchive_list.jsp");

		result.setRedirect(false);

		return result;
	}
}
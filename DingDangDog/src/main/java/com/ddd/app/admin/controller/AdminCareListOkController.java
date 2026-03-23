package com.ddd.app.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;
import com.ddd.app.admin.dto.AdminCareDTO;

public class AdminCareListOkController implements Execute {
	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("=== AdminCareListController 실행 ===");

		AdminDAO adminDAO = new AdminDAO();
		Result result = new Result();

		// 페이징 처리
		String temp = request.getParameter("page");
		int page = (temp == null) ? 1 : Integer.valueOf(temp); // 페이지 번호 기본값을 1로 설정하겠다
		if (page < 1) {
			page = 1;
		}

		// 한 페이지당 게시글 수
		int rowCount = 15;

		// 페이지 버튼 수
		int pageCount = 5;

		// 시작행 (1, 11, 21, ..)
		int startRow = (page - 1) * rowCount + 1;

		// 끝행 (10, 20, 30, ..)
		int endRow = startRow + rowCount - 1;

		// 검색어 받기
		String keyword = request.getParameter("keyword");
		String type = request.getParameter("type");
		
		// 디버깅
		System.out.println("검색어: " + keyword);

		// 페이징 정보 전달
		Map<String, Object> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		pageMap.put("type", type);
		System.out.println("페이징 확인 : " + pageMap);

		if (keyword != null && !keyword.trim().isEmpty()) {
			pageMap.put("keyword", keyword);
		}

		// 게시글 목록 조회
		List<AdminCareDTO> careList = adminDAO.selectCareList(pageMap);
		request.setAttribute("careList", careList);

		// 검색어 유지
		request.setAttribute("keyword", keyword);
		request.setAttribute("type", type);

		// 전체 게시글 수 조회
		int total = adminDAO.getCareTotal(pageMap);

		// 전체 페이지 수 계산
		int realEndPage = (int) (Math.ceil(total / (double) rowCount));

		// 현재 페이지 그룹에서의 마지막 페이지
		int endPage = (int) (Math.ceil(page / (double) pageCount) * pageCount);

		// 현재 페이지 그룹에서의 첫 페이지
		int startPage = endPage - (pageCount - 1);

		// endPage가 실제 존재하는 마지막 페이지보다 크면 조정
		endPage = Math.min(endPage, realEndPage);

		// 이전, 다음 버튼 활성화 여부 확인
		boolean prev = startPage > 1;
		boolean next = endPage < realEndPage;

		// 페이지네이션 정보 JSP로 전달
		request.setAttribute("page", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);

		// 디버깅
		System.out.println("======== 페이징 정보 확인 =========");
		System.out.println("pageMap : " + pageMap);
		System.out.println("boardList : " + careList);
		System.out.println(
				"startPage : " + startPage + " endPage : " + endPage + ", prev : " + prev + ", next : " + next);
		System.out.println("=====================");

		// 결과 페이지로 포워딩
		result.setPath("/app/admin/dogcare/admin_dogcare_list.jsp");
		result.setRedirect(false);

		return result;
	}
}
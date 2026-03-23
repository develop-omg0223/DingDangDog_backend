package com.ddd.app.dogcare.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogcare.dao.CareDAO;
import com.ddd.app.dogcare.dto.CareListDTO;

public class CareListController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("=== CareListController 실행 ===");

		CareDAO careDAO = new CareDAO();
		Result result = new Result();

		// 검색 파라미터 받기
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		
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

		// 페이징 정보 전달
		Map<String, Object> params = new HashMap<>(); // Integer에서 Object로 변경 (String keyword 때문)
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("type", type);
		params.put("keyword", keyword);
		System.out.println("페이징 확인 : " + params);

		// 게시글 목록 조회
		List<CareListDTO> careList = careDAO.selectCareList(params);
		request.setAttribute("careList", careList);

		// 전체 게시글 수 조회
		int total = careDAO.getTotal(params);
		System.out.println(total);

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
		request.setAttribute("type", type);
		request.setAttribute("keyword", keyword);
		// 디버깅
		System.out.println("======== 페이징 정보 확인 =========");
		System.out.println("pageMap : " + params);
		System.out.println("boardList : " + careList);
		System.out.println(
				"startPage : " + startPage + " endPage : " + endPage + ", prev : " + prev + ", next : " + next);
		System.out.println("=====================");

		// 결과 페이지로 포워딩
		result.setPath("/app/dogcare/dogcare_list_shelter.jsp");
		result.setRedirect(false);

		return result;
	}
}
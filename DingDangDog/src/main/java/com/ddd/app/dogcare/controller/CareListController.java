package com.ddd.app.dogcare.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

        // 세션에서 userNumber 가져오기
        HttpSession session = request.getSession();
        int userNumber = (Integer) session.getAttribute("userNumber"); // 세션에서 userNumber 가져오기
        System.out.println("userNumber : " + userNumber);

        // 기본 페이지를 1로 고정 (페이지가 없으면 1로 설정)
        String temp = request.getParameter("page");
        int page = (temp == null) ? 1 : Integer.valueOf(temp); // 기본 페이지 1로 설정

        // 한 페이지당 표시할 게시글 수
        int rowCount = 15;
        // 한 번에 표시할 페이지 번호 수 (예: 5페이지씩 표시)
        int pageCount = 5;

        // startRow, endRow 계산
        int startRow = (page - 1) * rowCount; // 시작 행 (0부터 시작)
        int endRow = startRow + rowCount - 1;  // 끝 행 (0부터 시작)

        // 검색어 받기
        String keyword = request.getParameter("keyword");

        // Map 하나로 통합 (startRow, endRow, keyword)
        Map<String, Object> pageMap = new HashMap<>();
        pageMap.put("startRow", startRow);
        pageMap.put("endRow", endRow);

        if (keyword != null && !keyword.trim().isEmpty()) {
            pageMap.put("keyword", keyword);
        }

        System.out.println("페이지 + 검색 조건 : " + pageMap);

        // DAO 호출: 게시글 목록 가져오기
        List<CareListDTO> careList = careDAO.selectCareList(pageMap);
        request.setAttribute("careList", careList);

        // 검색어 유지
        request.setAttribute("keyword", keyword);

        // 페이징 처리
        int total = careDAO.getTotal(); // 전체 게시글 수
        int realEndPage = (int) Math.ceil(total / (double) rowCount); // 실제 마지막 페이지 번호 계산
        int endPage = (int) (Math.ceil(page / (double) pageCount) * pageCount); // 끝 페이지 번호 계산
        int startPage = endPage - (pageCount - 1); // 시작 페이지 번호 계산

        // 마지막 페이지는 realEndPage를 넘지 않도록 제한
        endPage = Math.min(endPage, realEndPage);

        boolean prev = startPage > 1; // 이전 페이지로 이동할 수 있는지 확인
        boolean next = endPage < realEndPage; // 다음 페이지로 이동할 수 있는지 확인

        // 페이징 정보를 request에 추가
        request.setAttribute("page", page); // 현재 페이지
        request.setAttribute("startpage", startPage); // 시작 페이지
        request.setAttribute("endpage", endPage); // 끝 페이지
        request.setAttribute("prev", prev); // 이전 페이지 버튼 활성화 여부
        request.setAttribute("next", next); // 다음 페이지 버튼 활성화 여부

        // 페이지네이션 결과를 담고 있는 JSP 경로 설정
        result.setPath("/app/dogcare/dogcare_list_shelter.jsp");
        result.setRedirect(false); // 포워드 방식으로 이동

        return result;
    }
}
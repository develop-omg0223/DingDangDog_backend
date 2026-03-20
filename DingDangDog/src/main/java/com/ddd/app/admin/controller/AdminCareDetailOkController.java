package com.ddd.app.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;
import com.ddd.app.admin.dto.AdminCareDTO;

public class AdminCareDetailOkController implements Execute {
    @Override
    public Result execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== AdminCareDetailOkController 실행 ===");

        Result result = new Result();
        AdminDAO adminDAO = new AdminDAO();

        // careNumber가 URL 파라미터로 넘어옴
        int careNumber;
        try {
            careNumber = Integer.parseInt(request.getParameter("careNumber"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            result.setPath("/errorPage.jsp"); // 오류 페이지로 리디렉션
            result.setRedirect(true);
            return result;
        }

        // 상세 정보, 신청 현황, 신청자 목록 조회
        AdminCareDTO detail = adminDAO.selectCareDetail(careNumber);  // 상세정보
        AdminCareDTO status = adminDAO.selectApplyStatus(careNumber); // 신청 현황
        List<AdminCareDTO> applyList = adminDAO.selectApplyList(careNumber); // 신청자 목록

        // request에 속성 설정
        request.setAttribute("Detail", detail);   // 상세정보
        request.setAttribute("Status", status);   // 신청 현황
        request.setAttribute("ApplyList", applyList); // 신청자 목록

        System.out.println("상세정보 출력");
        System.out.println("신청현황 출력");
        System.out.println("신청자 목록 출력");

        // 상세 페이지로 포워딩
        result.setPath("/app/admin/dogcare/admin_dogcare_detail.jsp");
        result.setRedirect(false); // 포워딩 방식으로 이동

        return result;
    }
}
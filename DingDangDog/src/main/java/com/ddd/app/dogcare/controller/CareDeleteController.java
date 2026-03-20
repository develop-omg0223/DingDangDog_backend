package com.ddd.app.dogcare.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogcare.dao.CareDAO;
import com.ddd.app.dogcare.dto.CareDetailDTO;

public class CareDeleteController implements Execute {

    @Override
    public Result execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== CareDeleteController 실행 ===");

        CareDAO careDAO = new CareDAO();
        Result result = new Result();

        // 세션에서 userNumber 가져오기
        HttpSession session = request.getSession();
        int userNumber = (Integer) session.getAttribute("userNumber"); // 세션에서 userNumber 가져오기
        System.out.println("userNumber : " + userNumber);

        // 로그인되지 않은 사용자 처리
        if (userNumber == 0) {
            result.setPath(request.getContextPath() + "/login.ca"); // 로그인 페이지로 리다이렉트
            result.setRedirect(true);
            return result;
        }

        // 게시글 번호 받기
        int careNumber = Integer.parseInt(request.getParameter("careNumber"));
        System.out.println("삭제할 글 번호 : " + careNumber);

        // 게시글 작성자 정보 확인 (userNumber와 careNumber로 게시글 작성자 확인)
        CareDetailDTO careDetail = careDAO.selectCare(careNumber);
        if (careDetail != null && careDetail.getUserNumber() == userNumber) {
            // 게시글 삭제 (소프트 삭제)
            careDAO.deleteCare(careNumber);
            System.out.println("삭제 완료");

            // 목록으로 이동 (redirect)
            result.setPath(request.getContextPath() + "/care/list.ca");
            result.setRedirect(true);
        } else {
            // 권한이 없는 경우, 오류 페이지로 리다이렉트
            result.setPath(request.getContextPath() + "/errorPage.jsp");
            result.setRedirect(true);
            System.out.println("삭제 권한이 없습니다.");
        }

        return result;
    }

}
package com.ddd.app.report.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.report.dao.ReportDAO;
import com.ddd.app.report.dto.ReportDTO;

public class ReportOkController implements Execute {
    @Override
    public Result execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== ReportOkController 실행 ===");

        Result result = new Result();
        ReportDAO reportDAO = new ReportDAO();
        ReportDTO reportDTO = new ReportDTO();
        HttpSession session = request.getSession();

        try {
            // 1. 세션에서 현재 로그인한 유저(신고자) 번호 가져오기
            // 세션에 저장된 키값이 "userNumber"인지 확인하세요!
            Integer reporterUserNumber = (Integer) session.getAttribute("userNumber");

            if (reporterUserNumber == null) {
                // 로그인 안 되어 있으면 로그인 페이지로
                result.setPath(request.getContextPath() + "/user/login.us");
                result.setRedirect(true);
                return result;
            }

            // 2. 파라미터 수집
            int careNumber = Integer.parseInt(request.getParameter("careNumber"));
            int reportedUserNumber = Integer.parseInt(request.getParameter("userNumber"));
            String reason = request.getParameter("reason");
            String etcReason = request.getParameter("etcReason");
            
            // applyNumber 파라미터가 있는지 확인 후 세팅 (없으면 일단 0이나 제외)
            String applyNumStr = request.getParameter("applyNumber");
            if (applyNumStr != null && !applyNumStr.isEmpty()) {
                reportDTO.setApplyNumber(Integer.parseInt(applyNumStr));
            }

            // 3. 신고 사유 가공
            String finalReason = "기타".equals(reason) ? "기타: " + etcReason : reason;

            // 4. DTO 데이터 세팅 (이 부분이 중요!)
            reportDTO.setReporterUserNumber(reporterUserNumber); // 신고자 (세션 값)
            reportDTO.setReportedUserNumber(reportedUserNumber); // 피신고자 (파라미터 값)
            reportDTO.setReportReason(finalReason);
            
            // 5. DB 저장
            reportDAO.insertReport(reportDTO);
            
            // 6. 결과 설정: 다시 상세페이지로 리다이렉트
            result.setPath(request.getContextPath() + "/care/detail.ca?careNumber=" + careNumber);
            result.setRedirect(true);

        } catch (Exception e) {
            e.printStackTrace();
            result.setPath(request.getContextPath() + "/care/list.ca");
            result.setRedirect(true);
        }

        return result;
    }
}
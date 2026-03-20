package com.ddd.app.dogcare.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogcare.dao.CareDAO;
import com.ddd.app.dogcare.dto.CareDTO;
import com.ddd.app.dogcare.dto.CareDetailDTO;

public class CareUpdateOkController implements Execute {
    @Override
    public Result execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== CareUpdateOkController 실행 ===");
        
        Result result = new Result();
        CareDAO careDAO = new CareDAO();

        // 세션에서 userNumber 가져오기
        HttpSession session = request.getSession();
        int userNumber = (Integer) session.getAttribute("userNumber");  // 세션에서 userNumber 가져오기
        
        if (request.getMethod().equalsIgnoreCase("GET")) {
            int careNumber = Integer.parseInt(request.getParameter("careNumber"));
            System.out.println("수정할 글 번호 : " + careNumber);

            CareDetailDTO care = careDAO.selectCare(careNumber);
            System.out.println("조회된 데이터 : " + care);

            request.setAttribute("care", care);

            result.setPath("/app/dogcare/careUpdate.jsp");
            result.setRedirect(false);
            return result;
        }

        request.setCharacterEncoding("UTF-8");

        CareDTO careDTO = new CareDTO();

        careDTO.setCareNumber(Integer.parseInt(request.getParameter("careNumber")));
        careDTO.setCareTitle(request.getParameter("careTitle"));
        careDTO.setCarePost(request.getParameter("carePost"));
        careDTO.setCareRecruit(Integer.parseInt(request.getParameter("careRecruit")));
        careDTO.setUserNumber(userNumber);  // 세션에서 가져온 userNumber 설정
        
        String careDateStr = request.getParameter("careDate");

        if (careDateStr != null && !careDateStr.isEmpty()) {
            LocalDateTime careDate = LocalDateTime.parse(careDateStr + "T00:00:00");
            careDTO.setCareDate(careDate);
        }

        System.out.println("수정 DTO : " + careDTO);

        careDAO.updateCare(careDTO);
        System.out.println("수정 완료");

        result.setPath(request.getContextPath() + "/care/detail.ca?careNumber=" + careDTO.getCareNumber());
        result.setRedirect(true);

        return result;
    }
}
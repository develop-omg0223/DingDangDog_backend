package com.ddd.app.dogcare.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogcare.dao.CareDAO;
import com.ddd.app.dogcare.dto.CareDetailDTO;


public class CareUpdateController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("=== CareUpdateController 실행 ===");
		
		CareDAO careDAO = new CareDAO();
		Result result = new Result();
		CareDetailDTO careDetailDTO = new CareDetailDTO();
		
		Integer careNumber = Integer.parseInt(request.getParameter("careNumber"));
		
		CareDetailDTO detail = careDAO.selectCare(careNumber);
		request.setAttribute("care", detail);
		System.out.println("상세정보 출력");

		String careDateStr = request.getParameter("careDate");

		if (careDateStr != null && !careDateStr.isEmpty()) {
		    LocalDateTime careDate = LocalDateTime.parse(careDateStr + "T00:00:00");
		    careDetailDTO.setCareDate(careDate);
		}
        
        result.setPath("/app/dogcare/dogcare_update.jsp");
        result.setRedirect(false);

        return result;
    }		
	
}

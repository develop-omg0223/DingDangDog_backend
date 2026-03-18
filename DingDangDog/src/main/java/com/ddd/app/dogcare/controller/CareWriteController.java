package com.ddd.app.dogcare.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogcare.dao.CareDAO;
import com.ddd.app.dogcare.dto.CareDTO;

public class CareWriteController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("=== CareWriteController 실행 ===");

		Result result = new Result();

		if(request.getMethod().equalsIgnoreCase("GET")) {
			result.setPath("/app/dogcare/dogcare_write.jsp");
			result.setRedirect(false);
			return result;
		}

		request.setCharacterEncoding("UTF-8");

		CareDTO careDTO = new CareDTO();

		careDTO.setCareTitle(request.getParameter("careTitle"));
		careDTO.setCarePost(request.getParameter("carePost"));
		careDTO.setCareDate(Date.valueOf(request.getParameter("careDate")));
		careDTO.setCareRecruit(Integer.parseInt(request.getParameter("careRecruit")));
		careDTO.setUserNumber((int)request.getSession().getAttribute("userNumber"));
		careDTO.setCareStatus("open");

		System.out.println("DTO 확인 : " + careDTO);

		CareDAO careDAO = new CareDAO();
		careDAO.insertCare(careDTO);

		System.out.println("DB insert 완료");

		result.setPath(request.getContextPath() + "/care/list.ca");
		result.setRedirect(true);

		return result;
	}
}
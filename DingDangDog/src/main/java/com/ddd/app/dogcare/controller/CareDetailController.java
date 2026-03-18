package com.ddd.app.dogcare.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogcare.dao.CareDAO;
import com.ddd.app.dogcare.dto.CareDetailDTO;

public class CareDetailController implements Execute{

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CareDetailController 실행");

		int careNumber = Integer.parseInt(request.getParameter("careNumber"));

		CareDAO careDAO = new CareDAO();

		CareDetailDTO detail = careDAO.selectCare(careNumber);

		request.setAttribute("care", detail);

		Result result = new Result();
		result.setPath("/app/care/care_detail_common.jsp");
		result.setRedirect(false);

		return result;
	}
	
}

package com.ddd.app.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.inquiry.dao.InquiryDAO;
import com.ddd.app.inquiry.dto.InquiryListDTO;

public class InquiryDeleteOkController implements Execute{

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    InquiryDAO inquiryDAO = new InquiryDAO();
	    InquiryListDTO dto = new InquiryListDTO();
	    Result result = new Result();

	    Integer userNumber = (Integer) request.getSession().getAttribute("userNumber");

	    if (userNumber == null) {
	        result.setPath(request.getContextPath() + "/app/login/login.jsp");
	        result.setRedirect(true);
	        return result;
	    }

	    String inquiryNumberStr = request.getParameter("inquiryNumber");

	    if (inquiryNumberStr == null || inquiryNumberStr.trim().isEmpty()) {
	        result.setPath(request.getContextPath() + "/inquiry/inquiryListOk.in");
	        result.setRedirect(true);
	        return result;
	    }

	    int inquiryNumber = Integer.parseInt(inquiryNumberStr);

	    dto.setInquiryNumber(inquiryNumber);
	    dto.setUserNumber(userNumber);

	    inquiryDAO.deleteInquiry(dto);

	    result.setPath(request.getContextPath() + "/inquiry/inquiryListOk.in");
	    result.setRedirect(true);

	    return result;
	}

}

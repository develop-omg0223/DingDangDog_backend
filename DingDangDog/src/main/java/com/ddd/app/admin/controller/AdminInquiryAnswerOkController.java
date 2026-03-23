package com.ddd.app.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.admin.dao.AdminDAO;
import com.ddd.app.admin.dto.AdminInquiryDTO;

public class AdminInquiryAnswerOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===AdminInquiryAnswerOkController 실행===");

		AdminDAO adminDAO = new AdminDAO();
		AdminInquiryDTO adminInquiryDTO = new AdminInquiryDTO();
		Result result = new Result();

		int inquiryNumber = Integer.parseInt(request.getParameter("inquiryNumber"));
		String answerPost = request.getParameter("answerPost");

		adminInquiryDTO.setInquiryNumber(inquiryNumber);
		adminInquiryDTO.setAnswerPost(answerPost);

		adminDAO.inquiryAnswer(adminInquiryDTO);

		System.out.println("답변 등록 완료 - 글번호: " + inquiryNumber);

		result.setPath(request.getContextPath() + "/admin/InquiryDetailOk.ad?inquiryNumber=" + inquiryNumber);
		result.setRedirect(true);

		return result;

	}

}

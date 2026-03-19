package com.ddd.app.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.mypage.dao.MypageDAO;
import com.ddd.app.mypage.dto.MypageSInfoDTO;

public class ProfileSEditController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MypageDAO mypageDAO = new MypageDAO();
		Result result = new Result();
		MypageSInfoDTO mpSDTO = new MypageSInfoDTO();

		Integer userNumber = (Integer) session.getAttribute("userNumber");

		mpSDTO = mypageDAO.selectMyPageInfoS(userNumber);

		request.setAttribute("user", mpSDTO);
		result.setRedirect(false);
		result.setPath("/app/mypage/shelter/profile_edit_shelter.jsp");

		return result;
	}

}

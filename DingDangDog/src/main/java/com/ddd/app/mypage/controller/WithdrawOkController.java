package com.ddd.app.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.mypage.dao.MypageDAO;

public class WithdrawOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MypageDAO mypageDAO = new MypageDAO();
		Result result = new Result();

		int userNumber = (Integer) session.getAttribute("userNumber");

		System.out.println(userNumber + " 탈퇴 시작");

		mypageDAO.updateToWithdraw(userNumber);

		session.invalidate();
		System.out.println("탈퇴완료");

		result.setRedirect(true);
		result.setPath(request.getContextPath() + "/app/mypage/etc/goodby.jsp");

		return result;
	}

}

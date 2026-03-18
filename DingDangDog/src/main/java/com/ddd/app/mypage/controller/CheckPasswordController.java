package com.ddd.app.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.mypage.dao.MypageDAO;
import com.ddd.app.user.dto.UserDTO;

public class CheckPasswordController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("===CheckPasswordController 실행===");

		HttpSession session = request.getSession();
		System.out.println("1");
		if(session == null) {
			System.out.println("못받아옴");
		} else {
			System.out.println("받아옴?");
		}
		UserDTO userDTO = new UserDTO();
		System.out.println("2");
		MypageDAO mypageDAO = new MypageDAO();
		System.out.println("3");
		Result result = new Result();
		System.out.println("4");
		int loginUserNumber = (Integer) session.getAttribute("userNumber");
		System.out.println("5");
		String loginUserType = (String) session.getAttribute("userType");
		System.out.println("6");
		String inputPassword = request.getParameter("checkPassword");
		String path = null;

		System.out.println(loginUserNumber);
		System.out.println(loginUserType);
		System.out.println(inputPassword);

		userDTO.setUserNumber(loginUserNumber);
		userDTO.setUserPassword(inputPassword);

		int test = mypageDAO.checkPassword(userDTO);

		if (test == 1) {
			if (loginUserType.equals("C")) {
				path = request.getContextPath() + "/mypage/profileEditC.mp";
			} else if (loginUserType.equals("S")) {
				path = request.getContextPath() + "/mypage/profileEditS.mp";
			}

		} else {
			path = request.getContextPath() + "/mypage/checkPw.mp?checkPw=fail";
		}

		result.setRedirect(true); 
		result.setPath(path);

		return result;
	}

}

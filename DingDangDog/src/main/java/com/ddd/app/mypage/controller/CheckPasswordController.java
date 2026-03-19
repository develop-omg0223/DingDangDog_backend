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
		UserDTO userDTO = new UserDTO();
		MypageDAO mypageDAO = new MypageDAO();
		Result result = new Result();
		String path = null;

		int loginUserNumber = (Integer) session.getAttribute("userNumber");
		String loginUserType = (String) session.getAttribute("userType");
		String inputPassword = request.getParameter("checkPassword");

		System.out.println("회원번호 : " + loginUserNumber);
		System.out.println("유저타입 : " + loginUserType);
		System.out.println("입력한 비밀번호 :" + inputPassword);

		userDTO.setUserNumber(loginUserNumber);
		userDTO.setUserPassword(inputPassword);

		int checkResult = mypageDAO.checkPassword(userDTO);

		if (checkResult == 1) {
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

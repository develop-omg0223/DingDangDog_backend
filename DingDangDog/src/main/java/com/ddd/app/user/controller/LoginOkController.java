package com.ddd.app.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.user.dao.UserDAO;
import com.ddd.app.user.dto.UserDTO;

public class LoginOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = new UserDAO();
		Result result = new Result();

		UserDTO loginUser = null;

		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		String userType = request.getParameter("userType");

		System.out.println(userId);
		System.out.println(userPassword);
		System.out.println(userType);
		String path = null;

		HttpSession session = request.getSession();

		userDTO.setUserId(userId);
		userDTO.setUserPassword(userPassword);
		userDTO.setUserType(userType);
		System.out.println("userDTO : \n" + userDTO);

		loginUser = userDAO.login(userDTO);
		System.out.println(loginUser);

		if (loginUser != null) {
			path = request.getContextPath() + "/index.jsp";

			session.setAttribute("userNumber", loginUser.getUserNumber());
			session.setAttribute("userNickname", loginUser.getUserNickname());
			session.setAttribute("userType", loginUser.getUserType());
			System.out.println("로그인유저번호 : " + loginUser.getUserNumber());
		} else {
			path = request.getContextPath() + "/user/login.us?login=fail";

		}
		result.setRedirect(true); // 세션에 저장된 값은 유지
		result.setPath(path);

		return result;

	}

}

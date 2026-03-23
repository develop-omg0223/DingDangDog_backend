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
	        // [체크] 블랙리스트 회원인 경우
	        if ("black".equals(loginUser.getUserStatus())) {
	            // 주소 뒤에 login=black을 붙여서 다시 로그인 페이지로 보냄
	            path = request.getContextPath() + "/user/login.us?login=black";
	        } else {
	            // 정상 회원
	            session.setAttribute("userNumber", loginUser.getUserNumber());
	            session.setAttribute("userNickname", loginUser.getUserNickname());
	            session.setAttribute("userType", loginUser.getUserType());
	            path = request.getContextPath() + "/mainpage/Main.main";
	        }
	    } else {
	        // 아이디/비번 틀림
	        path = request.getContextPath() + "/user/login.us?login=fail";
	    }
		result.setRedirect(true); // 세션에 저장된 값은 유지
		result.setPath(path);

		return result;

	}

}

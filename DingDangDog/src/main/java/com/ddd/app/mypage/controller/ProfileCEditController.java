package com.ddd.app.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.mypage.dao.MypageDAO;
import com.ddd.app.user.dto.UserDTO;

public class ProfileCEditController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		UserDTO userDTO = new UserDTO();
		MypageDAO mypageDAO = new MypageDAO();
		Result result = new Result();
		
		
		
		return result;
	}

}

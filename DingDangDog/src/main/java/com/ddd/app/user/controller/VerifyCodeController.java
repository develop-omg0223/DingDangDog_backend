package com.ddd.app.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class VerifyCodeController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		BufferedReader reader = request.getReader();
		String body = reader.lines().collect(Collectors.joining());
		JsonObject json = JsonParser.parseString(body).getAsJsonObject();

		// 클라이언트로부터 받은 인증번호
		String userCode = json.get("code").getAsString();
		HttpSession session = request.getSession();

		// 세션에 저장된 인증번호
		String sessionCode = (String) session.getAttribute("verificationCode");

		JsonObject responseJson = new JsonObject();

		// 인증번호 일치 여부 검사
		if (sessionCode != null && sessionCode.equals(userCode)) {
			responseJson.addProperty("success", true);
		} else {
			responseJson.addProperty("success", false);
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(responseJson.toString());

		return null;
	}

}

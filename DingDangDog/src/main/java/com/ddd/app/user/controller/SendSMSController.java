package com.ddd.app.user.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.user.service.SmsService;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class SendSMSController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String phoneNumber = request.getParameter("realPhoneNumbekr");
		SmsService smsService = new SmsService();
		Result result = new Result();

		try {
			System.out.println("===인증코드====");
			// SMS 전송 및 인증 코드 생성
			String verificationCode = smsService.sendVerificationSms(phoneNumber);

			// 세션에 인증 코드 저장
			HttpSession session = request.getSession();
			session.setAttribute("verificationCode", verificationCode);

			// AJAX 요청일 경우, 직접 응답 처리
			if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("인증번호가 발송되었습니다.");
				return null; // AJAX 응답은 직접 처리하므로 Result 반환 필요 없음
			}

			// 일반 요청일 경우 페이지 이동
			result.setPath("/app/member/student/loginStudent.jsp");
			result.setRedirect(false); // 포워딩 방식 사용
		} catch (Exception e) {
			// 예외 발생 시 에러 메시지 전송
			if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				response.getWriter().write("SMS 발송 실패: " + e.getMessage());
				return null;
			}

			// 일반 요청의 경우 에러 페이지로 리다이렉트
			result.setPath("/error.jsp");
			result.setRedirect(true);
		}

		return result;

//		// 응답 설정 (성공/실패 모두 JSON으로 응답하기 위해 미리 설정)
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        try {
//            // 1. JSON 데이터 읽기 (BufferedReader 사용)
//            BufferedReader reader = request.getReader();
//            JsonObject json = JsonParser.parseReader(reader).getAsJsonObject();
//            
//            // 2. JS에서 보낸 'realPhoneNumber' 꺼내기
//            String phoneNumber = json.get("realPhoneNumber").getAsString();
//            
//            System.out.println("서버 수신 번호: " + phoneNumber);
//
//            SmsService smsService = new SmsService();
//            // SMS 발송 및 인증코드 생성
//            String verificationCode = smsService.sendVerificationSms(phoneNumber);
//
//            // 3. 세션에 인증 코드 저장
//            HttpSession session = request.getSession();
//            session.setAttribute("verificationCode", verificationCode);
//
//            // 4. 성공 응답 전송
//            response.getWriter().write("{\"ok\": true}");
//            return null; // AJAX 요청이므로 페이지 이동 없음
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            // 에러 발생 시 실패 응답 전송
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            response.getWriter().write("{\"ok\": false, \"message\": \"" + e.getMessage() + "\"}");
//            return null;
//        }

	}

}

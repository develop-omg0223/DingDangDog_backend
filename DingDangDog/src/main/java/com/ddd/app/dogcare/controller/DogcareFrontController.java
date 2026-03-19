package com.ddd.app.dogcare.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Result;

public class DogcareFrontController extends HttpServlet {

	protected void doGet(HttpServletRequest request,  HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {

        System.out.println("DogcareFrontController 실행");

		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("BoardFrontController 현재 경로 : " + target);
		Result result = new Result();

        switch(target) {

        case "/care/list.care":
            System.out.println("케어 목록 요청");
            result = new CareListController().execute(request, response);
            System.out.println("케어 목록 처리 완료");
            break;
        case "/care/detail.care":
            System.out.println("케어 상세페이지 요청");
            result = new CareDetailController().execute(request, response);
            System.out.println("케어 상세페이지 처리 완료");
            break;
        case "/care/write.care":
            System.out.println("케어 글 작성페이지 이동 요청");
            result = new CareWriteController().execute(request, response);
            break;
        case "/care/update.care":
            System.out.println("케어 글 수정 요청");
            result = new CareUpdateController().execute(request, response);
            break;
        case "/care/delete.care":
            System.out.println("케어 글 삭제 요청");
            result = new CareDeleteController().execute(request, response);
            break;
        case "/care/apply.care":
            System.out.println("케어 신청 요청");
            result = new CareApplyController().execute(request, response);
            break;
        case "/care/cancel.care":
            System.out.println("케어 신청 취소 요청");
            result = new CareCancelController().execute(request, response);
            break;
        case "/care/applyUsers.care":
            System.out.println("신청자 목록 조회");
            result = new CareApplyUserController().execute(request, response);
            break;
        default:
            System.out.println("잘못된 요청");
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

    }


}
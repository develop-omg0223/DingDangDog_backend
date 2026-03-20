package com.ddd.app.dogarchive.controller;

// ===== 멍 카이브 수정 ===== 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dao.ArchiveDAO;
import com.ddd.app.dogarchive.dto.ArchiveUpdateDTO;

public class ArchiveUpdateOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 객체
		Result result = new Result();
		ArchiveDAO dao = new ArchiveDAO();
		ArchiveUpdateDTO updateDTO = new ArchiveUpdateDTO();

		try {
			// ===== 수정할 dogNumber =====
			int dogNumber = Integer.parseInt(request.getParameter("dogNumber"));

			// ===== 기본 정보 =====
			String dogName = request.getParameter("dogName");
			String dogBreed = request.getParameter("dogBreed");
			String dogGender = request.getParameter("dogGender");
			String dogAge = request.getParameter("dogAge");
			int dogWeight = Integer.parseInt(request.getParameter("dogWeight"));
			String dogSafeDate = request.getParameter("dogSafeDate");
			String dogDetail = request.getParameter("dogDetail");

			// ===== 성향 점수 받기 =====
			int dogActivity = Integer.parseInt(request.getParameter("dogActivity"));
			int dogSociality = Integer.parseInt(request.getParameter("dogSociality"));
			int dogIndependence = Integer.parseInt(request.getParameter("dogIndependence"));
			int dogBarking = Integer.parseInt(request.getParameter("dogBarking"));
			int dogGrooming = Integer.parseInt(request.getParameter("dogGrooming"));

			// ===== 데이터 =====
			updateDTO.setDogNumber(dogNumber);
			updateDTO.setDogName(dogName);
			updateDTO.setDogBreed(dogBreed);
			updateDTO.setDogGender(dogGender);
			updateDTO.setDogAge(dogAge);
			updateDTO.setDogWeight(dogWeight);
//			updateDTO.setDogSafeDate(dogSafeDate);
			updateDTO.setDogDetail(dogDetail);
			updateDTO.setDogActivity(dogActivity);
			updateDTO.setDogSociality(dogSociality);
			updateDTO.setDogIndependence(dogIndependence);
			updateDTO.setDogBarking(dogBarking);
			updateDTO.setDogGrooming(dogGrooming);

			String DogSafeDateStr = request.getParameter("DogSafeDate");

			// ===== 이미지 수정 =====
			updateDTO.setArchiveImgName(request.getParameter("archiveImgName"));
			updateDTO.setArchiveImgPath(request.getParameter("archiveImgPath"));

			// ===== DB 업데이트 =====
			dao.update(updateDTO);

			// ===== 수정 완료 시 List 페이지 이동 =====
			result.setPath(request.getContextPath() + "/archive/list.ar");
			result.setRedirect(true);

		} catch (Exception e) {
			e.printStackTrace();
			// ===== 수정 실패 시 Main 페이지 이동 =====
			result.setPath(request.getContextPath() + "/main.jsp");
			result.setRedirect(true);
		}

		return result;
	}
}
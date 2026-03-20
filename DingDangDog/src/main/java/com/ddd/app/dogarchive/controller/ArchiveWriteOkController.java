package com.ddd.app.dogarchive.controller;

// ===== 멍 카이브 작성 ===== 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dao.ArchiveDAO;
import com.ddd.app.dogarchive.dto.ArchiveWriteDTO;

public class ArchiveWriteOkController implements Execute {
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 객체
		Result result = new Result();
		ArchiveDAO dao = new ArchiveDAO();
		ArchiveWriteDTO writeDTO = new ArchiveWriteDTO();

		try {
			// ===== jsp에서 전송한 데이터 =====
			writeDTO.setDogName(request.getParameter("dogName"));
			writeDTO.setDogBreed(request.getParameter("dogBreed"));
			writeDTO.setDogGender(request.getParameter("dogGender"));
			writeDTO.setDogAge(request.getParameter("dogAge"));
			writeDTO.setDogWeight(Integer.parseInt(request.getParameter("dogWeight")));
//			writeDTO.setDogSafeDate(request.getParameter("dogSafeDate"));
			writeDTO.setDogDetail(request.getParameter("dogDetail"));

			String DogSafeDateStr = request.getParameter("DogSafeDate");

			// ===== 성향 점수 =====
			writeDTO.setDogActivity(Integer.parseInt(request.getParameter("dogActivity")));
			writeDTO.setDogSociality(Integer.parseInt(request.getParameter("dogSociality")));
			writeDTO.setDogIndependence(Integer.parseInt(request.getParameter("dogIndependence")));
			writeDTO.setDogBarking(Integer.parseInt(request.getParameter("dogBarking")));
			writeDTO.setDogGrooming(Integer.parseInt(request.getParameter("dogGrooming")));

			// ===== 이미지 정보 =====
			writeDTO.setArchiveImgName(request.getParameter("archiveImgName"));
			writeDTO.setArchiveImgPath(request.getParameter("archiveImgPath"));

			// ===== DB에 저장 =====
			dao.insert(writeDTO);

			// ===== 리스트로 이동 =====
			result.setPath(request.getContextPath() + "/archive/list.ar");
			result.setRedirect(true);

		} catch (Exception e) {
			e.printStackTrace();
			result.setPath(request.getContextPath() + "/archive/write.ar");
			result.setRedirect(true);
		}

		return result;
	}
}
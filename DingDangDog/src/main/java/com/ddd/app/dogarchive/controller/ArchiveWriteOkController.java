package com.ddd.app.dogarchive.controller;

import java.io.IOException;
import java.io.File;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dao.ArchiveDAO;
import com.ddd.app.dogarchive.dto.ArchiveWriteDTO;

public class ArchiveWriteOkController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArchiveDAO dao = new ArchiveDAO();
		ArchiveWriteDTO writeDTO = new ArchiveWriteDTO();
		Result result = new Result();

		String uploadPath = request.getServletContext().getRealPath("/") + "upload";
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) { uploadDir.mkdirs(); }

		MultipartRequest multi = new MultipartRequest(request, uploadPath, 1024 * 1024 * 20, "UTF-8", new DefaultFileRenamePolicy());

		try {
			// [기존 유지] 기본 정보 및 유저 번호
			writeDTO.setUserNumber((Integer)request.getSession().getAttribute("userNumber"));
			writeDTO.setDogName(multi.getParameter("dogName"));
			writeDTO.setDogBreed(multi.getParameter("dogBreed"));
			writeDTO.setDogGender(multi.getParameter("dogGender"));
			writeDTO.setDogAge(multi.getParameter("dogAge"));
			String weightStr = multi.getParameter("dogWeight");
			writeDTO.setDogWeight((weightStr == null || weightStr.isEmpty()) ? 0.0 : Double.parseDouble(weightStr));
			writeDTO.setDogDetail(multi.getParameter("dogDetail"));
			writeDTO.setDogSafeDate(multi.getParameter("dogSafeDate"));

			// [기존 유지] 성향 점수 10종
			writeDTO.setDogActivity(Integer.parseInt(multi.getParameter("dogActivity")));
			writeDTO.setDogActivityDetail(multi.getParameter("dogActivityDetail"));
			writeDTO.setDogSociality(Integer.parseInt(multi.getParameter("dogSociality")));
			writeDTO.setDogSocialityDetail(multi.getParameter("dogSocialityDetail"));
			writeDTO.setDogIndependence(Integer.parseInt(multi.getParameter("dogIndependence")));
			writeDTO.setDogIndependenceDetail(multi.getParameter("dogIndependenceDetail"));
			writeDTO.setDogBarking(Integer.parseInt(multi.getParameter("dogBarking")));
			writeDTO.setDogBarkingDetail(multi.getParameter("dogBarkingDetail"));
			writeDTO.setDogGrooming(Integer.parseInt(multi.getParameter("dogGrooming")));
			writeDTO.setDogGroomingDetail(multi.getParameter("dogGroomingDetail"));

			// [이미지 등록 해결] JSP의 name="dogImage"와 똑같이 맞췄습니다.
			String fileName = multi.getFilesystemName("dogImage");
			
			if (fileName != null) {
				writeDTO.setArchiveImgName(fileName);
				writeDTO.setArchiveImgPath(request.getContextPath() + "/upload/" + fileName);
				System.out.println("### 이미지 등록 성공 (dogImage): " + fileName);
			}

			// 3. DB 등록 실행
			dao.insert(writeDTO);

			result.setPath(request.getContextPath() + "/archive/list.ar");
			result.setRedirect(true);

		} catch (Exception e) {
			e.printStackTrace();
			result.setPath(request.getContextPath() + "/archive/list.ar");
			result.setRedirect(true);
		}

		return result;
	}
}
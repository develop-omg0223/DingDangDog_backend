package com.ddd.app.mypage.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.file.dao.FileDAO;
import com.ddd.app.file.dto.FileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class profileSFileOKController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("profileSFileOKController 실행");

		HttpSession session = request.getSession();
		FileDAO fileDAO = new FileDAO();
		Result result = new Result();
		FileDTO fileDTO = new FileDTO();
		// 파일 업로드 환경 설정
//		final String UPLOAD_PATH = request.getSession().getServletContext().getRealPath("/") + "upload/";
		final String UPLOAD_PATH = "C:/KDTProject/uploadFiles/";

		final int FILE_SIZE = 1024 * 1024 * 25; // 25MB
		System.out.println("파일 업로드 경로 : " + UPLOAD_PATH);

		File uploadDir = new File(UPLOAD_PATH);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		// MultipartRequest를 이용한 데이터 파싱
		MultipartRequest multipartRequest = new MultipartRequest(request, UPLOAD_PATH, FILE_SIZE, "utf-8",
				new DefaultFileRenamePolicy());

		int userNumber = (Integer) session.getAttribute("userNumber");
		System.out.println("userNumber : " + userNumber);

		// 파일 업로드 처리
		System.out.println("파일 업로드 처리 시작");
		String fileSystemName = multipartRequest.getFilesystemName("shelterFile");
		String fileOriginalName = multipartRequest.getOriginalFileName("shelterFile");

		fileDTO.setFileSystemName(fileSystemName);
		fileDTO.setFileOriginalName(fileOriginalName);
		fileDTO.setUserNumber(userNumber);

		System.out.println("fileSystemName : " + fileSystemName);
		System.out.println("fileOriginalName : " + fileOriginalName);
		System.out.println("userNumber : " + userNumber);

		int fileCount = fileDAO.fileCount(userNumber);

		if (fileCount > 0) {
			// 드라이버 경로 사용시
			FileDTO realFile = fileDAO.selectFile(userNumber);
			String realFileSystemName = realFile.getFileSystemName();

			File file = new File(UPLOAD_PATH + realFileSystemName);
			if (file.exists()) {
				if (file.delete()) {
					fileDAO.deleteFile(userNumber);
				}
			}

			// 드라이버 경로 사용 안할시
//			fileDAO.deleteFile(userNumber);

		}

		fileDAO.fileInsert(fileDTO);
		System.out.println("파일 업로드 처리 완료");

		result.setPath(request.getContextPath() + "/mypage/mypageMain.mp");
		result.setRedirect(true);

		return result;
	}
}

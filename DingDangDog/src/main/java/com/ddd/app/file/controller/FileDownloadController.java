package com.ddd.app.file.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.file.dao.FileDAO;
import com.ddd.app.file.dto.FileDTO;

public class FileDownloadController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userNumber = Integer.parseInt(request.getParameter("userNumber"));
		FileDAO fileDAO = new FileDAO();
		FileDTO fileDTO = fileDAO.selectFile(userNumber);

		String uploadPath = "C:/KDTProject/uploadFiles/";
		String fileSystemName = fileDTO.getFileSystemName();
		String fileOriginalName = fileDTO.getFileOriginalName();

//		File file = new File(uploadPath + "/" + fileOriginalName);

		return null;
	}

}

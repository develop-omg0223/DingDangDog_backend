package com.ddd.app.dogarchive.controller;

//===== 멍 카이브 삭제 =====
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dao.ArchiveDAO;
import com.ddd.app.dogarchive.dto.ArchiveDeleteDTO;

public class ArchiveDeleteOkController implements Execute {

    @Override
    public Result execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		// ===== 객체 =====
    	Result result = new Result();
        ArchiveDAO dao = new ArchiveDAO();
        ArchiveDeleteDTO dto = new ArchiveDeleteDTO();

		// ===== 삭제할 dogNumber =====
        String dogNumberParam = request.getParameter("dogNumber");
        
        if (dogNumberParam != null) {
            int dogNumber = Integer.parseInt(dogNumberParam);
            dto.setDogNumber(dogNumber);

		// ===== 삭제 =====
            dao.delete(dto);
        }

		// ===== 리스트로 이동 =====
		result.setPath(request.getContextPath() + "/archive/list.ar");
		result.setRedirect(true);

		return result;
	}
}
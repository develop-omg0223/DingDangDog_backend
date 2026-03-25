package com.ddd.app.dogarchive.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;
import com.ddd.app.dogarchive.dao.ArchiveDAO;
import com.ddd.app.dogarchive.dto.ArchiveReadDTO;

public class ArchiveReadController implements Execute {

	@Override
	public Result execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("### [조회] 1. ArchiveReadController 진입 ###");
		
		ArchiveDAO dao = new ArchiveDAO();
		Result result = new Result();

		try {
			// 1. 파라미터 확인
			String dogNumberParam = request.getParameter("dogNumber");
			System.out.println("### [조회] 2. 요청받은 번호: " + dogNumberParam);

			if (dogNumberParam == null || dogNumberParam.equals("")) {
				result.setPath(request.getContextPath() + "/archive/list.ar");
				result.setRedirect(true);
				return result;
			}

			int dogNumber = Integer.parseInt(dogNumberParam);

			// 2. DB 조회 (상세 필드 5개 포함된 쿼리 실행)
			ArchiveReadDTO archive = dao.selectDetail(dogNumber);
			
			if (archive == null) {
				System.out.println("### [조회] ERROR: DB에 데이터 없음 ###");
				result.setPath(request.getContextPath() + "/archive/list.ar");
				result.setRedirect(true);
				return result;
			}

			// 3. JSP로 데이터 전달 (이름 "archive" 필수!)
			request.setAttribute("archive", archive);
			System.out.println("### [조회] 3. 데이터 세팅 완료: " + archive.getDogName());

			// 4. JSP 경로 설정 (파일 위치가 맞는지 꼭 확인!)
			result.setPath("/app/dogarchive/dogarchive_detail.jsp");
			result.setRedirect(false); // 화면을 띄울 때는 false(forward)여야 합니다.
			System.out.println("### [조회] 4. JSP로 포워딩 시작 ###");

		} catch (Exception e) {
			System.out.println("### [조회] ERROR 발생 ###");
			e.printStackTrace();
			result.setPath(request.getContextPath() + "/archive/list.ar");
			result.setRedirect(true);
		}

		return result;
	}
}
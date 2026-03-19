package com.ddd.app.dogarchive.controller;

//===== 멍 카이브 삭제 =====
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddd.app.Execute;
import com.ddd.app.Result;

public class ArchiveDeleteController {

	public class ArchiveDeleteOkController implements Execute {
		
		@Override
		public Result execute(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			// 객체
			Result result = new Result();

			// ===== 삭제 완료 후 리스트로 이동 =====
			result.setPath(request.getContextPath() + "/archive/list.archive");
			result.setRedirect(true);

			return result;

		}
	}
}
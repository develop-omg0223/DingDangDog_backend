package com.ddd.app.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

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

		// fileSystemName : 서버에 저장된 실제 파일명 (PK 역할)
		// fileOriginalName : 사용자가 업로드한 원본 파일명 (다운로드시 노출)

		String fileSystemName = fileDTO.getFileSystemName();
		String fileOriginalName = fileDTO.getFileOriginalName();

		// 간단한 유효성 검사: 필수 파라미터 누락 여부 확인
		if (fileSystemName == null || fileOriginalName == null) {
			// 잘못된 요청 → 400
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "필수 파라미터가 없습니다.");
			return null;
		}

		// 보안 : 경로 조작(Path Traversal) 방지
		// 업로드 시 파일명은 서버에서 강제로 UUID 등으로 바꾸는 게 일반적이지만
		// 혹시 모를 ../, /, \ 문자 포함을 방지해 서버 파일시스템 침범을 막아준다
		if (fileSystemName.contains("..") || fileSystemName.contains("/") || fileSystemName.contains("\\")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "허용되지 않는 파일명입니다.");
			return null;
		}

		// 2) 실제 저장 경로 얻기
		// 배포된 웹앱 기준의 물리 경로를 가져오기 (Webapp/upload → webapps/.../upload)
		// 하드코딩 경로 금지. 서버·OS·배포환경이 바뀌어도 동작하게 만들기 위함.
		final String saveFolder = "C:/KDTProject/uploadFiles/";
		final File file = new File(saveFolder, fileSystemName);

		// 파일 존재/정상 파일 여부 확인
		if (!file.exists() || !file.isFile()) {
			// 파일 없음 → 404
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "요청한 파일을 찾을 수 없습니다.");
			return null;
		}

		// 3) 응답 헤더 세팅
		// 파일 다운로드 응답은 바이너리 전송이므로 Content-Type을 octet-stream으로
		// Content-Length로 파일 크기 명시 (브라우저 UX 향상)
		// Content-Disposition에 attachment + 파일명 (한글/공백 안전하게 인코딩)

		response.reset(); // 혹시 기존에 버퍼에 쌓인 응답을 초기화(헤더 세팅 전 안전조치)
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Length", String.valueOf(file.length()));

		// 한글/공백/특수문자 파일명은 헤더에 그대로 넣으면 톰캣이 ISO-8859-1로 인코딩하려다 오류가 난다
		// -> URL 인코딩(UTF-8) + 스페이스는 %20 유지
		final String encoded = URLEncoder.encode(fileOriginalName, StandardCharsets.UTF_8.toString()).replaceAll("\\+",
				"%20");
		// RFC 5987 형식 : filename* 파라미터로 UTF-8 인코딩 명시(대부분의 최신 브라우저에서 안전)
		// 동시에 구형 호환을 위해 filename도 같이 내려준다(따옴표로 감싸는 관례)
		final String contentDisposition = "attachment; filename=\"" + encoded + "\"; filename*=UTF-8''" + encoded;
		response.setHeader("Content-Disposition", contentDisposition);

		// 4) 파일 스트리밍 (서버 -> 브라우저)
		// - try-with-resources로 스트림을 안전하게 닫음 (예외 발생해도 close 보장)
		// - 8KB 버퍼로 반복 전송 (너무 크게 잡아도 의미 없음, 8~16KB 권장)
		final int BUFFER_SIZE = 8192; // 8KB
		try (InputStream in = new FileInputStream(file); OutputStream out = response.getOutputStream()) {

			byte[] buffer = new byte[BUFFER_SIZE];
			int read;
			while ((read = in.read(buffer)) != -1) {
				// buffer[0..read-1]까지만 유효 바이트 -> 그만큼만 전송
				out.write(buffer, 0, read);
			}
			out.flush(); // 잔여 버퍼를 네트워크로 밀어낸다 (중요)
		}

		// 컨트롤러 체인에 넘길 별도 결과가 없으므로 null 반환(또는 필요 시 result 사용)
		return null; // Result를 쓰지 않는 구조면 이렇게 종료
	}

}

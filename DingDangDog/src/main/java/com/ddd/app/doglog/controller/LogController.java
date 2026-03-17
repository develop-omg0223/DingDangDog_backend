package com.ddd.app.doglog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddd.app.doglog.dao.LogCommentDAO;
import com.ddd.app.doglog.dao.LogDAO;
import com.ddd.app.doglog.dao.LogImgDAO;
import com.ddd.app.doglog.dto.LogCommentDTO;
import com.ddd.app.doglog.dto.LogDTO;
import com.ddd.app.doglog.dto.LogImgDTO;
import java.io.File;
import java.util.Collection;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024,
	maxFileSize = 1024 * 1024 * 10,
	maxRequestSize = 1024 * 1024 * 50
)

public class LogController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String target = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("LogController 요청 : " + target);
		int userNumber = 10001; // 하드코딩용 세션 유저넘버
		switch (target) {

		case "/log/list.lo":{
			System.out.println("멍! 로그 목록");
			LogDAO logDAO = new LogDAO();
			List<LogDTO> logList = logDAO.selectAll();
			System.out.println("조회된 logList 개수 : " + logList.size());

			request.setAttribute("logList", logList);
			request.getRequestDispatcher("/apps/doglog/doglog_list.jsp").forward(request, response);
			break;}

		case "/log/detail.lo": {
			System.out.println("멍! 로그 상세");

			int logNumber = Integer.parseInt(request.getParameter("logNumber"));

			LogDAO detailDAO = new LogDAO();
			LogImgDAO detailImgDAO = new LogImgDAO();
			LogCommentDAO logCommentDAO = new LogCommentDAO();

			LogDTO log = detailDAO.selectDetail(logNumber);
			List<LogImgDTO> imageList = detailImgDAO.selectImageList(logNumber);
			List<LogCommentDTO> commentList = logCommentDAO.selectCommentList(logNumber);

			request.setAttribute("log", log);
			request.setAttribute("imageList", imageList);
			request.setAttribute("commentList", commentList);

			request.getRequestDispatcher("/apps/doglog/doglog_detail.jsp").forward(request, response);
			break;
		}
			


		case "/log/write.lo":
			System.out.println("멍! 로그 작성 페이지");
			request.getRequestDispatcher("/apps/doglog/doglog_write.jsp").forward(request, response);
			break;

		case "/log/writeOk.lo": {
			System.out.println("멍! 로그 작성 완료 진입");


//			HttpSession session = request.getSession();
//			Object userNumberObj = session.getAttribute("userNumber");
//
//			if (userNumberObj == null) {
//				response.sendRedirect(request.getContextPath() + "/member/login.me");
//				return;
//			}
//
//			int userNumber = (Integer) userNumberObj; 세션에서 받아오기
			String logTitle = request.getParameter("logTitle");
			String logPost = request.getParameter("logPost");
			

			if (logTitle == null || logTitle.trim().isEmpty() ||
				logPost == null || logPost.trim().isEmpty()) {
				response.sendRedirect(request.getContextPath() + "/log/write.lo");
				return;
			}

			// 1. 게시글 저장
			LogDTO logDTO = new LogDTO();
			logDTO.setUserNumber(userNumber);
			logDTO.setLogTitle(logTitle);
			logDTO.setLogPost(logPost);

			LogDAO logDAO = new LogDAO();
			logDAO.insert(logDTO);

			// insert 후 DTO 안에 logNumber 세팅
			int logNumber = logDTO.getLogNumber();

			// 2. 이미지 저장
			LogImgDAO logImgDAO = new LogImgDAO();

			String uploadPath = getServletContext().getRealPath("/upload/doglog");
			File uploadDir = new File(uploadPath);

			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			Collection<Part> parts = request.getParts();

			for (Part part : parts) {
				if (!"logImages".equals(part.getName())) continue;
				if (part.getSize() == 0) continue;

				String submittedFileName = part.getSubmittedFileName();
				if (submittedFileName == null || submittedFileName.isBlank()) continue;

				String savedFileName = System.currentTimeMillis() + "_" + submittedFileName;
				File saveFile = new File(uploadDir, savedFileName);
				part.write(saveFile.getAbsolutePath());
				
			

				LogImgDTO logImgDTO = new LogImgDTO();
				logImgDTO.setLogNumber(logNumber);
				logImgDTO.setLogImgName(savedFileName);
				logImgDTO.setLogImgPath("/upload/doglog/" + savedFileName);

				logImgDAO.insertImage(logImgDTO);
			}

			// 3. 방금 작성한 상세페이지로 이동
			response.sendRedirect(request.getContextPath() + "/log/detail.lo?logNumber=" + logNumber);
			break;
		}

		case "/log/edit.lo": {
			System.out.println("멍! 로그 수정 페이지");

			int editLogNumber = Integer.parseInt(request.getParameter("logNumber"));
			LogDAO editDAO = new LogDAO();
			LogDTO editLog = editDAO.selectDetail(editLogNumber);

			LogImgDAO editImgDAO = new LogImgDAO();
			List<LogImgDTO> imageList = editImgDAO.selectImageList(editLogNumber);

			request.setAttribute("log", editLog);
			request.setAttribute("imageList", imageList);
			request.getRequestDispatcher("/apps/doglog/doglog_edit.jsp").forward(request, response);
			break;
		}

		case "/log/editOk.lo": {
			System.out.println("멍! 로그 수정 완료 진입");

			int logNumber = Integer.parseInt(request.getParameter("logNumber"));
			String logTitle = request.getParameter("logTitle");
			String logPost = request.getParameter("logPost");
			String deleteImageIds = request.getParameter("deleteImageIds");

			// 1. 게시글 수정
			LogDTO updateLog = new LogDTO();
			updateLog.setLogNumber(logNumber);
			updateLog.setLogTitle(logTitle);
			updateLog.setLogPost(logPost);

			LogDAO updateDAO = new LogDAO();
			updateDAO.update(updateLog);

			LogImgDAO logImgDAO = new LogImgDAO();

			// 2. 삭제할 기존 이미지 삭제
			if (deleteImageIds != null && !deleteImageIds.trim().isEmpty()) {
				String[] deleteIds = deleteImageIds.split(",");

				for (String id : deleteIds) {
					if (id != null && !id.trim().isEmpty()) {
						int logImgNumber = Integer.parseInt(id.trim());
						logImgDAO.deleteImageByImageNumber(logImgNumber);
					}
				}
			}

			// 3. 새 이미지 업로드 및 DB 저장
			Collection<Part> parts = request.getParts();
			String uploadPath = getServletContext().getRealPath("/upload/doglog");
			File uploadDir = new File(uploadPath);

			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			for (Part part : parts) {
				if (!"logImages".equals(part.getName())) continue;
				if (part.getSize() == 0) continue;

				String submittedFileName = part.getSubmittedFileName();
				if (submittedFileName == null || submittedFileName.isBlank()) continue;

				String savedFileName = System.currentTimeMillis() + "_" + submittedFileName;
				File saveFile = new File(uploadDir, savedFileName);
				part.write(saveFile.getAbsolutePath());

				LogImgDTO logImgDTO = new LogImgDTO();
				logImgDTO.setLogNumber(logNumber);
				logImgDTO.setLogImgName(savedFileName);
				logImgDTO.setLogImgPath("/upload/doglog/" + savedFileName);
				logImgDAO.insertImage(logImgDTO);
			}

			response.sendRedirect(request.getContextPath() + "/log/detail.lo?logNumber=" + logNumber);
			break;
		}

		case "/log/deleteOk.lo":{
			System.out.println("멍! 로그 삭제 완료");
//			HttpSession session = request.getSession();
//			Object userNumberObj = session.getAttribute("userNumber");
//
//			if (userNumberObj == null) {
//				response.sendRedirect(request.getContextPath() + "/member/login.me");
//				return;
//			}
//
//			int userNumber = (Integer) userNumberObj; 세션에서 받아오기
			int logNumber = Integer.parseInt(request.getParameter("logNumber"));

			LogDAO logDAO = new LogDAO();
			LogImgDAO logImgDAO = new LogImgDAO();
			LogCommentDAO logCommentDAO = new LogCommentDAO();

			LogDTO log = logDAO.select(logNumber);

			// 게시글이 없을 때
			if (log == null) {
				return;
			}

			// 작성자 본인인지 확인
			if (log.getUserNumber() != userNumber) {
				return;
			}
			// 본인일 때만 삭제
			logImgDAO.deleteImageByLogNumber(logNumber);
			logCommentDAO.deleteByLogNumber(logNumber);
			logDAO.delete(logNumber);

			response.sendRedirect(request.getContextPath() + "/log/list.lo");
			break;	
		}
		// 댓글 작성 완료
		case "/comment/writeOk.lc":
			System.out.println("댓글 작성 완료");

			int writeLogNumber = Integer.parseInt(request.getParameter("logNumber"));
			String commentPost = request.getParameter("commentPost");

			Integer writeUserNumber = (Integer) request.getSession().getAttribute("userNumber");

			if (writeUserNumber == null) {
				response.sendRedirect(request.getContextPath() + "/member/login.me");
				return;
			}

			LogCommentDTO writeCommentDTO = new LogCommentDTO();
			writeCommentDTO.setLogNumber(writeLogNumber);
			writeCommentDTO.setUserNumber(writeUserNumber);
			writeCommentDTO.setCommentPost(commentPost);

			LogCommentDAO writeCommentDAO = new LogCommentDAO();
			writeCommentDAO.insertComment(writeCommentDTO);

			response.sendRedirect(request.getContextPath() + "/log/detail.lo?logNumber=" + writeLogNumber);
			break;

		// 댓글 수정 페이지
		case "/comment/edit.lc":
			System.out.println("수정 페이지");

			int editCommentNumber = Integer.parseInt(request.getParameter("commentNumber"));
			int editLogNumber = Integer.parseInt(request.getParameter("logNumber"));

			Integer editUserNumber = (Integer) request.getSession().getAttribute("userNumber");

			if (editUserNumber == null) {
				response.sendRedirect(request.getContextPath() + "/member/login.me");
				return;
			}

			LogCommentDAO editCommentDAO = new LogCommentDAO();
			LogCommentDTO editComment = editCommentDAO.selectComment(editCommentNumber);

			if (editComment == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}

			if (editComment.getUserNumber() != editUserNumber) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}

			request.setAttribute("comment", editComment);
			request.setAttribute("logNumber", editLogNumber);
			request.getRequestDispatcher("/apps/doglog/doglog_comment_edit.jsp").forward(request, response);
			break;

		// 댓글 수정 완료
		case "/comment/editOk.lc":
			System.out.println("댓글 수정 완료");

			int updateCommentNumber = Integer.parseInt(request.getParameter("commentNumber"));
			int updateLogNumber = Integer.parseInt(request.getParameter("logNumber"));
			String updateCommentPost = request.getParameter("commentPost");

			Integer updateUserNumber = (Integer) request.getSession().getAttribute("userNumber");

			if (updateUserNumber == null) {
				response.sendRedirect(request.getContextPath() + "/member/login.me");
				return;
			}

			LogCommentDAO updateCommentDAO = new LogCommentDAO();
			LogCommentDTO originComment = updateCommentDAO.selectComment(updateCommentNumber);

			if (originComment == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}

			if (originComment.getUserNumber() != updateUserNumber) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}

			LogCommentDTO updateCommentDTO = new LogCommentDTO();
			updateCommentDTO.setCommentNumber(updateCommentNumber);
			updateCommentDTO.setLogNumber(updateLogNumber);
			updateCommentDTO.setUserNumber(updateUserNumber);
			updateCommentDTO.setCommentPost(updateCommentPost);

			updateCommentDAO.updateComment(updateCommentDTO);

			response.sendRedirect(request.getContextPath() + "/log/detail.lo?logNumber=" + updateLogNumber);
			break;

		// 댓글 삭제 완료
		case "/comment/deleteOk.lc":
			System.out.println("댓글 삭제 완료");

			int deleteCommentNumber = Integer.parseInt(request.getParameter("commentNumber"));
			int deleteLogNumber = Integer.parseInt(request.getParameter("logNumber"));

			Integer deleteUserNumber = (Integer) request.getSession().getAttribute("userNumber");

			if (deleteUserNumber == null) {
				response.sendRedirect(request.getContextPath() + "/member/login.me");
				return;
			}

			LogCommentDAO deleteCommentDAO = new LogCommentDAO();
			LogCommentDTO deleteTargetComment = deleteCommentDAO.selectComment(deleteCommentNumber);

			if (deleteTargetComment == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}

			if (deleteTargetComment.getUserNumber() != deleteUserNumber) {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}

			LogCommentDTO deleteCommentDTO = new LogCommentDTO();
			deleteCommentDTO.setCommentNumber(deleteCommentNumber);
			deleteCommentDTO.setUserNumber(deleteUserNumber);

			deleteCommentDAO.deleteComment(deleteCommentDTO);

			response.sendRedirect(request.getContextPath() + "/log/detail.lo?logNumber=" + deleteLogNumber);
			break;		
		
		default:
			System.out.println("잘못된 요청");
			break;
		}
	}
}
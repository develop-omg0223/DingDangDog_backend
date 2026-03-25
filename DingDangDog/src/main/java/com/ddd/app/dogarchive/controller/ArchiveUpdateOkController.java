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
import com.ddd.app.dogarchive.dto.ArchiveUpdateDTO;
import com.ddd.app.dogarchive.dto.ArchiveReadDTO;

public class ArchiveUpdateOkController implements Execute {

    @Override
    public Result execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArchiveDAO dao = new ArchiveDAO();
        ArchiveUpdateDTO updateDTO = new ArchiveUpdateDTO();
        Result result = new Result();

        String uploadPath = request.getServletContext().getRealPath("/") + "upload";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) { uploadDir.mkdirs(); }

        MultipartRequest multi = new MultipartRequest(request, uploadPath, 1024 * 1024 * 20, "UTF-8", new DefaultFileRenamePolicy());

        try {
            int dogNumber = Integer.parseInt(multi.getParameter("dogNumber"));
            updateDTO.setDogNumber(dogNumber);


            updateDTO.setDogName(multi.getParameter("dogName"));
            updateDTO.setDogBreed(multi.getParameter("dogBreed"));
            updateDTO.setDogGender(multi.getParameter("dogGender"));
            updateDTO.setDogAge(multi.getParameter("dogAge"));
            String weightStr = multi.getParameter("dogWeight");
            updateDTO.setDogWeight((weightStr == null || weightStr.isEmpty()) ? 0.0 : Double.parseDouble(weightStr));
            updateDTO.setDogDetail(multi.getParameter("dogDetail"));

            // [유지] 날짜
            String dateStr = multi.getParameter("dogSafeDate");
            if(dateStr != null && dateStr.length() >= 10) {
                try {
                    updateDTO.setDogSafeDate(java.time.LocalDateTime.parse(dateStr.substring(0, 10) + "T00:00:00"));
                } catch (Exception e) {}
            }

            // [유지] 성향 점수 10종
            updateDTO.setDogActivity(Integer.parseInt(multi.getParameter("dogActivity")));
            updateDTO.setDogActivityDetail(multi.getParameter("dogActivityDetail"));
            updateDTO.setDogSociality(Integer.parseInt(multi.getParameter("dogSociality")));
            updateDTO.setDogSocialityDetail(multi.getParameter("dogSocialityDetail"));
            updateDTO.setDogIndependence(Integer.parseInt(multi.getParameter("dogIndependence")));
            updateDTO.setDogIndependenceDetail(multi.getParameter("dogIndependenceDetail"));
            updateDTO.setDogBarking(Integer.parseInt(multi.getParameter("dogBarking")));
            updateDTO.setDogBarkingDetail(multi.getParameter("dogBarkingDetail"));
            updateDTO.setDogGrooming(Integer.parseInt(multi.getParameter("dogGrooming")));
            updateDTO.setDogGroomingDetail(multi.getParameter("dogGroomingDetail"));

            // [핵심 교정] JSP의 name="archiveImg"와 일치시킴
            String fileName = multi.getFilesystemName("archiveImg");
            
            if (fileName != null) {
                // 새로운 사진을 선택한 경우
                updateDTO.setArchiveImgName(fileName);
                updateDTO.setArchiveImgPath(request.getContextPath() + "/upload/" + fileName);
            } else {
                // 사진을 바꾸지 않은 경우 -> 기존 DB 정보 유지
                ArchiveReadDTO existing = dao.selectDetail(dogNumber);
                if(existing != null) {
                    updateDTO.setArchiveImgPath(existing.getArchiveImgPath());
                    // 이미지 이름이 비어있지 않도록 안전하게 세팅
                    updateDTO.setArchiveImgName(updateDTO.getDogName() + "_img");
                }
            }

            // DB 업데이트 실행 (Archive -> Score -> Img 순서로 작동)
            dao.update(updateDTO);

            // 수정 후 상세페이지로 이동
            result.setPath(request.getContextPath() + "/archive/read.ar?dogNumber=" + dogNumber);
            result.setRedirect(true);

        } catch (Exception e) {
            e.printStackTrace();
            result.setPath(request.getContextPath() + "/archive/list.ar");
            result.setRedirect(true);
        }

        return result;
    }
}
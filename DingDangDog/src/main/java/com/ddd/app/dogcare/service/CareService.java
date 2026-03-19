package com.ddd.app.dogcare.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ddd.app.dogcare.dao.CareDAO;
import com.ddd.app.dogcare.dto.CareApplyDTO;
import com.ddd.app.dogcare.dto.CareDTO;
import com.ddd.app.dogcare.dto.CareDetailDTO;
import com.ddd.app.dogcare.dto.CareListDTO;

public class CareService {

	private CareDAO careDAO = new CareDAO();

	// 멍! 케어 목록 조회
	public List<CareListDTO> getCareList(Map<String, Integer> pageMap) {
		return careDAO.selectCareList(pageMap);
	}

	// 케어 상세
	public CareDetailDTO getCareDetail(int careNumber) {
		return careDAO.selectCare(careNumber);
	}

	// 케어 등록
	public int writeCare(CareDTO careDTO) {
		return careDAO.insertCare(careDTO);
	}

	// 케어 수정
	public void updateCare(CareDTO careDTO) {
		careDAO.updateCare(careDTO);
	}

	// 케어 삭제
	public void deleteCare(int careNumber) {
		careDAO.deleteCare(careNumber);
	}

	// 케어 신청
	public void applyCare(int careNumber, int userNumber) {
		CareApplyDTO applyDTO = new CareApplyDTO();
		applyDTO.setCareNumber(careNumber);
		applyDTO.setUserNumber(userNumber);

		int result = careDAO.applyCare(applyDTO);

		// 신청 성공했을 때만 마감 체크
		if (result == 1) {
			careDAO.closeCare(careNumber);
		}
	}

	// 멍! 케어 신청 취소
	public void cancelApply(int careNumber, int userNumber) {
		Map<String, Integer> map = new HashMap<>();
	    map.put("careNumber", careNumber);
	    map.put("userNumber", userNumber);

	    int result = careDAO.cancelApply(map);

	    // 취소 성공했을 때만 상태 확인
	    if(result == 1) {
	        careDAO.reopenCare(careNumber);
	    }
	}

	// 신청자 조회
	public List<CareApplyDTO> getApplyUsers(int careNumber) {
		return careDAO.selectApplyUsers(careNumber);
	}

	// 신청현황
	public String getApplyStatus(int careNumber) {
		return careDAO.getApplyStatus(careNumber);
	}
}

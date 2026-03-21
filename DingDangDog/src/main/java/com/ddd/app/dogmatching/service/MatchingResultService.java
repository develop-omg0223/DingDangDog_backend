package com.ddd.app.dogmatching.service;

// ===== 멍! 매칭 서비스 ===== 
// ===== 멍! 매칭 서비스 5건 제한 제어, 매칭 알고리즘 실행 및 결과 반환 =====
import java.util.List;

import com.ddd.app.dogarchive.dto.ArchiveReadDTO;
import com.ddd.app.dogmatching.dao.MatchingResultDAO;
import com.ddd.app.dogmatching.dto.ArchiveScoreDTO;
import com.ddd.app.dogmatching.dto.MatchingResultDTO;

public class MatchingResultService {

	private final MatchingResultDAO matchingResultDAO;

	// ===== 생성자 =====
	public MatchingResultService(MatchingResultDAO matchingResultDAO) {
		this.matchingResultDAO = matchingResultDAO;
	}

	/*
	 * public List<ArchiveReadDTO> getMatchingRecommendation(MatchingResultDTO
	 * userDTO) { int userNumber = userDTO.getUserNumber();
	 * 
	 * // ===== 로직 1 ===== // ===== 기존 저장 건수 (5건) 확인 및 자동 삭제 ===== int currentCount
	 * = matchingResultDAO.countSavedResults(userNumber);
	 * 
	 * if (currentCount >= 5) { // ===== 5건 이상이면 오래된 날짜 삭제 =====
	 * matchingResultDAO.deleteOldestResult(userNumber); }
	 * 
	 * // ===== 로직 3 ===== // ===== 설문 조사 결과 저장 -> DB =====
	 * matchingResultDAO.insertResult(userDTO);
	 * 
	 * // ===== 로직 3 ===== // ===== 거리 계산 및 추천 리스트 조회 ===== // ===== 가장 점수 차이가 적은
	 * 유기견 8마리 ===== return matchingResultDAO.selectTop8RecommendedDogs(userNumber);
	 * }
	 */
	
	public List<ArchiveReadDTO> getMatchingRecommendation(MatchingResultDTO userScore){
		
		MatchingResultDAO dogDAO = new MatchingResultDAO();
		List<ArchiveScoreDTO> allDog = dogDAO.selectAllDogScore();
		
		for(ArchiveScoreDTO dogScore : allDog) {
			double score = calculateScore(userScore, dogScore);

			
		}
		return null;
	}
	
	//편차 계산용
	private double calculateScore(MatchingResultDTO user, ArchiveScoreDTO dog) {
	    double result = 0;

	    result += 5 - Math.abs(((double) user.getDogActivity() / 4) - dog.getDogActivity());
	    result += 5 - Math.abs(((double) user.getDogSociality() / 4) - dog.getDogSociality());
	    result += 5 - Math.abs(((double) user.getDogIndependence() / 4) - dog.getDogIndependence());
	    result += 5 - Math.abs(((double) user.getDogBarking() / 4) - dog.getDogBarking());
	    result += 5 - Math.abs(((double) user.getDogGrooming() / 4) - dog.getDogGrooming());

	    return result;
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

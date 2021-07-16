package com.nobanryeo.petpal.user.mypage.service;

import java.util.HashMap;
import java.util.List;

import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.ReportManageDTO;

public interface QuestionService {

	/**
	 * 문의내역 카운트
	 * @param code
	 * @return
	 */
	int selectQnACount(int code);

	/**
	 * 문의내역 리스트 조회
	 * @param map
	 * @return
	 */
	List<AdQnADTO> selectQnAList(HashMap<String, Object> map);

	/**
	 * 문의내역 상세 조회
	 * @param boardCode
	 * @return
	 */
	AdQnADTO selectQnADetail(int boardCode);

	/**
	 * 신고내역 카운트
	 * @param code
	 * @return
	 */
	int selectReportCount(int code);


	/**
	 * 신고내역 리스트
	 * @param map
	 * @return
	 */
	List<ReportManageDTO> selectReportList(HashMap<String, Object> map);

	ReportManageDTO selectReportDetail(int reportCode);

	int selectReplyReportCount(int code);

	List<ReportManageDTO> selectReplyReportList(HashMap<String, Object> map);

	ReportManageDTO selectDecision(int decisionCode);

}












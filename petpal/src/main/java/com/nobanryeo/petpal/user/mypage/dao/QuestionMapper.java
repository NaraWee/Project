package com.nobanryeo.petpal.user.mypage.dao;

import java.util.HashMap;
import java.util.List;

import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.ReportManageDTO;

public interface QuestionMapper {

	int selectQnACount(int code);

	List<AdQnADTO> selectQnAList(HashMap<String, Object> map);

	AdQnADTO selectQnADetail(int boardCode);

	int selectReportCount(int code);

	List<ReportManageDTO> selectReportList(HashMap<String, Object> map);

	ReportManageDTO selectReportDetail(int reportCode);

	int selectReplyReportCount(int code);

	List<ReportManageDTO> selectReplyReportList(HashMap<String, Object> map);

	ReportManageDTO selectDecision(int decisionCode);


}

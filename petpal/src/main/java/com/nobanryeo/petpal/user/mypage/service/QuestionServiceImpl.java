package com.nobanryeo.petpal.user.mypage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.ReportManageDTO;
import com.nobanryeo.petpal.user.mypage.dao.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	private final QuestionMapper mapper;
	
	public QuestionServiceImpl(QuestionMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public int selectQnACount(int code) {
		
		return mapper.selectQnACount(code);
	}

	@Override
	public List<AdQnADTO> selectQnAList(HashMap<String, Object> map) {
		
		return mapper.selectQnAList(map);
	}

	@Override
	public AdQnADTO selectQnADetail(int boardCode) {
		return mapper.selectQnADetail(boardCode);
		
	}

	@Override
	public int selectReportCount(int code) {
		return mapper.selectReportCount(code);
	}

	@Override
	public List<ReportManageDTO> selectReportList(HashMap<String, Object> map) {
		return mapper.selectReportList(map);
	}

	@Override
	public ReportManageDTO selectReportDetail(int reportCode) {
		return mapper.selectReportDetail(reportCode);
	}

	@Override
	public int selectReplyReportCount(int code) {
		return mapper.selectReplyReportCount(code);
	}

	@Override
	public List<ReportManageDTO> selectReplyReportList(HashMap<String, Object> map) {
		return mapper.selectReplyReportList(map);
	}

	@Override
	public ReportManageDTO selectDecision(int decisionCode) {
		return mapper.selectDecision(decisionCode);
	}

}

package com.nobanryeo.petpal.admin.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;
import com.nobanryeo.petpal.admin.dto.ReportDTO;
import com.nobanryeo.petpal.admin.dto.ReportDetailDTO;
import com.nobanryeo.petpal.admin.dto.reportPopupDTO;
import com.nobanryeo.petpal.admin.report.dao.ReportMapper;
import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;

@Service
public class ReportServiceImpl implements  ReportService{
	private ReportMapper mapper;
	
	@Autowired
	public ReportServiceImpl(ReportMapper mapper) {
		this.mapper=mapper;
	}
	
	@Override
	public int selectReportCount(AdminPageInfoDTO cat) {
		// TODO Auto-generated method stub
		return mapper.selectReportCount(cat);
	}

	@Override
	public List<ReportDTO> selectReport(AdminPageInfoDTO paging) {
		// TODO Auto-generated method stub
		return mapper.selectReport(paging);
	}

	@Override
	public ReportDetailDTO selectReportDetail(Map param) {
		// TODO Auto-generated method stub
		return mapper.selectReportDetail(param);
	}

	@Override
	public boolean insertDecision(DecisionDTO decisionData) {
		// TODO Auto-generated method stub
		return mapper.insertDecision(decisionData)> 0 ? true : false;
	}

	@Override
	public boolean updateReport(DecisionDTO decisionData) {
		// TODO Auto-generated method stub
		return mapper.updateReport(decisionData)> 0 ? true : false;
	}

	@Override
	public boolean updateBoardBlind(DecisionDTO decisionData) {
		// TODO Auto-generated method stub
		return mapper.updateBoardBlind(decisionData)> 0 ? true : false;
	}

	@Override
	public boolean updateUserBan(DecisionDTO decisionData) {
		// TODO Auto-generated method stub
		return mapper.updateUserBan(decisionData)> 0 ? true : false;
	}

	@Override
	public reportPopupDTO selectReportPopup(Map param) {
		// TODO Auto-generated method stub
		return mapper.selectReportPopup(param);
	}

	@Override
	public AdoptDTO selectAdoptDetail(int boardCode) {
		// TODO Auto-generated method stub
		return mapper.selectAdoptDetail(boardCode);
	}

	@Override
	public MissingDTO selectMissingDetail(int boardCode) {
		// TODO Auto-generated method stub
		return mapper.selectMissingDetail(boardCode);
	}

}

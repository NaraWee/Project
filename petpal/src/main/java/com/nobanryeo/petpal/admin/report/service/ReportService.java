package com.nobanryeo.petpal.admin.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;
import com.nobanryeo.petpal.admin.dto.ReportDTO;
import com.nobanryeo.petpal.admin.dto.ReportDetailDTO;
import com.nobanryeo.petpal.admin.dto.reportPopupDTO;
import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;

public interface ReportService {
	int selectReportCount (AdminPageInfoDTO cat);
	List<ReportDTO> selectReport(AdminPageInfoDTO paging);
	ReportDetailDTO selectReportDetail(Map param);
	boolean insertDecision(DecisionDTO decisionData);
	boolean updateReport(DecisionDTO decisionData);
	boolean updateBoardBlind(DecisionDTO decisionData);
	boolean updateUserBan(DecisionDTO decisionData);
	reportPopupDTO selectReportPopup(Map param);
	AdoptDTO selectAdoptDetail(int boardCode);
	MissingDTO selectMissingDetail(int boardCode);

}

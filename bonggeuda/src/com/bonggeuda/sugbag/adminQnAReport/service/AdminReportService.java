package com.bonggeuda.sugbag.adminQnAReport.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bonggeuda.sugbag.adminNotice.dao.AdminNoticeDAO;
import com.bonggeuda.sugbag.adminNotice.dto.AdminNoticeDTO;
import com.bonggeuda.sugbag.adminQnAReport.dao.AdminQnADAO;
import com.bonggeuda.sugbag.adminQnAReport.dao.AdminReportDAO;
import com.bonggeuda.sugbag.adminQnAReport.dto.ReportDTO;
import com.bonggeuda.sugbag.adminQnAReport.dto.ReportHistoryDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

public class AdminReportService {
	
	private final AdminReportDAO adminReportDAO;
	
	public AdminReportService() {
		adminReportDAO = new AdminReportDAO();
	}


	public List<ReportDTO> selectReportList(PageInfoDTO pageInfo) {

		Connection con = getConnection();
		
		List<ReportDTO> reportList = adminReportDAO.selectReportList(con, pageInfo);
		
		close(con);
		
		return reportList;
	}

	public int selectReportTotalCount() {
		
		Connection con = getConnection();
		
		int totalCount = adminReportDAO.selectReportTotalCount(con);
		
		close(con);
		
		return totalCount;
	}


	public List<ReportDTO> selectSearchReportWriterList(String condition, String value, PageInfoDTO pageInfo) {

		Connection con = getConnection();
		
		List<ReportDTO> reportList = adminReportDAO.selectSearchReportWriterList(con, pageInfo, condition, value);
		
		close(con);
		
		return reportList;
	}


	public int searchReportWriterCount(String condition, String value) {
		
		Connection con = getConnection();
		
		int reportWriterCount = adminReportDAO.searchReportWriterCount(con,condition, value);
		
		close(con);
		
		return reportWriterCount;
	}


	public int insertReport(ReportHistoryDTO dto) {
	
		Connection con = getConnection();
		
		int insertReport = adminReportDAO.insertReport (con, dto);
		
		if(insertReport  > 0) {
			adminReportDAO.updateUserCount(con, dto);
		}else {
			
		}
		
		close(con);
		
		return insertReport ;
	}


	public ReportDTO selectReportDetail(int reportNo) {
		
		Connection con = getConnection();
		
		ReportDTO reportInfo = adminReportDAO.selectReportDetail(con, reportNo);
		
		close(con);
		
		return reportInfo;
		
	}


	public List<ReportDTO> selectReportThumnail(int reportNo) {
		
		Connection con = getConnection();
		
		List<ReportDTO> reportThumnailInfo = adminReportDAO.selectReportThumnail(con, reportNo);
		
		close(con);
		
		System.out.println("service:" + reportThumnailInfo);
		
		return reportThumnailInfo;
	}

}

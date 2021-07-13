package com.bonggeuda.sugbag.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bonggeuda.sugbag.model.dao.ReportDAO;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.ReportDTO;

public class ReportService {

	private final ReportDAO reportDAO;
	
	public ReportService() {
		reportDAO = new ReportDAO();
	}

	/**
	 * 이용자->업주 신고
	 * @param report 신고내용
	 * @return
	 */
	public int insertReport(ReportDTO report) {
		
		Connection con = getConnection();
		
		int result = 0;
		
		int reportResult = reportDAO.insertUserReport(con, report);
		
		List<AttachmentDTO> fileList = report.getAttachmentList();
		
		int accachmentResult = 0;
		for(int i = 0; i < fileList.size(); i++) {
			accachmentResult += reportDAO.insertAttachment(con, fileList.get(i));
		}
		if(reportResult > 0 && accachmentResult == fileList.size()) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
}

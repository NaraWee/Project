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
import com.bonggeuda.sugbag.adminQnAReport.dto.QnADTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

public class AdminQnAService {
	
	private final AdminQnADAO adminQnaDAO;
	
	public AdminQnAService() {
		adminQnaDAO = new AdminQnADAO();
	}

	public int selectQnaTotalCount() {
		
		Connection con = getConnection();
		
		int totalCount = AdminQnADAO.selectQnaTotalCount(con);
		
		close(con);
		
		return totalCount;
	}

	public List<QnADTO> selectQnaList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<QnADTO> qnaList = AdminQnADAO.selectQnaList(con, pageInfo);
		
		close(con);
		
		return qnaList;
	}

	public QnADTO selectqnaDetail(int qnaNo) {

		Connection con = getConnection();
		
		QnADTO qnaInfo = AdminQnADAO.selectQnaDetail(con, qnaNo);
		
		close(con);
		
		return qnaInfo;
	}

	public int insertQna(QnADTO dto) {
	
		Connection con = getConnection();
		
		int insertQna = AdminQnADAO.insertQna (con, dto);
		
		if(insertQna  > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return insertQna ;
	}

	public int searchWriterCount(String condition, String value) {
		
		Connection con = getConnection();
		
		int writerCount = AdminQnADAO.searchWriterCount(con,condition, value);
		
		close(con);
		
		return writerCount;
	}

	public List<QnADTO> selectSearchWriterList(String condition, String value, PageInfoDTO pageInfo) {
	
		Connection con = getConnection();
		
		List<QnADTO> qnaList = AdminQnADAO.selectWriterList(con, pageInfo, condition, value);
		
		close(con);
		
		return qnaList;
	}


	
}



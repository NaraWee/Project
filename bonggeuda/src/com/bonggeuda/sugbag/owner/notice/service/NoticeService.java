package com.bonggeuda.sugbag.owner.notice.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bonggeuda.sugbag.model.dto.NoticeDTO;
import com.bonggeuda.sugbag.owner.notice.dao.NoticeDAO;

public class NoticeService {
	
	/*NoticeDTO와 연결할 필드 변수*/
	NoticeDAO noticeDAO = new NoticeDAO();

	public List<NoticeDTO> selectNotice() {

		Connection con = getConnection();
		
		List<NoticeDTO> selectNotice = noticeDAO.selectNotice(con);
		
		close(con);

		return selectNotice;
	}

}

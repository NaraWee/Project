package com.bonggeuda.adminEvent.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bonggeuda.adminEvent.dao.AdminEventDAO;
import com.bonggeuda.adminEvent.dto.EventDTO;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

public class AdminEventService {
	
	private final AdminEventDAO adminEventDAO;
	
	public AdminEventService() {
		adminEventDAO = new AdminEventDAO();
	}


	public List<EventDTO> selectEventList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<EventDTO> eventList = adminEventDAO.selectEventList(con, pageInfo);
		
		close(con);
		
		return eventList;
	}

	public int selectEventTotalCount() {
		
		Connection con = getConnection();
		
		int eventCount = adminEventDAO.selectEventTotalCount(con);
		
		close(con);
		
		return eventCount;
	}


	public EventDTO selectEventDetail(int eventNo) {
		
		Connection con = getConnection();
		
		EventDTO eventDetailInfo = adminEventDAO.selectEventDetail(con, eventNo);
		
		close(con);
		System.out.println("서비스 : !!!!!" + eventDetailInfo);
		return eventDetailInfo;
	}


	public List<EventDTO> selectEventThumnail(int eventNo) {
	
		Connection con = getConnection();
		
		List<EventDTO> eventThumnailInfo = adminEventDAO.selectEventThumnail(con, eventNo);
		
		close(con);
		
		System.out.println("service:" + eventThumnailInfo);
		
		return eventThumnailInfo;
	}


	public int insertEvent(EventDTO eventInfo) {
		
		System.out.println("들어어와오랏");
		Connection con = getConnection();
		
		int result = 0;
		
		int reviewResult = adminEventDAO.insertEvent(con, eventInfo);
		
		List<AttachmentDTO> fileList = eventInfo.getAttachmentList();
		
		int accachmentResult = 0;
		for(int i = 0; i < fileList.size(); i++) {
			accachmentResult += adminEventDAO.insertAttachment(con, fileList.get(i));
			System.out.println(accachmentResult);
		}
		if(reviewResult > 0 && accachmentResult == fileList.size()) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}




}

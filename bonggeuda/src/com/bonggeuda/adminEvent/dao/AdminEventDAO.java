package com.bonggeuda.adminEvent.dao;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bonggeuda.adminEvent.dto.EventDTO;
import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

public class AdminEventDAO {
	
	private static Properties prop;
	
	public AdminEventDAO() {
		
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/userInfo/event-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<EventDTO> selectEventList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<EventDTO> eventList = null;
		
		String query = prop.getProperty("selectEventList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
		
			rset = pstmt.executeQuery();
			
			eventList = new ArrayList<>();
			
			while(rset.next()) {
				EventDTO eventInfo = new EventDTO();
						
				eventInfo.setRnum(rset.getInt("RNUM"));
				eventInfo.setNumber(rset.getInt("EVENT_NO"));
				eventInfo.setTitle(rset.getString("EVENT_TITLE"));
				eventInfo.setStartDate(rset.getDate("EVENT_START"));
				eventInfo.setEndDate(rset.getDate("EVENT_END"));
				
				
				eventList.add(eventInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return eventList;
	}

	public int selectEventTotalCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int eventCount = 0;
		
		String query = prop.getProperty("selectEventTotalCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				eventCount = rset.getInt("COUNT(*)");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
//		System.out.println(totalCount);
		return eventCount;
	}

	public EventDTO selectEventDetail(Connection con, int eventNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectEventDetail");
		
		EventDTO eventDetailInfo = new EventDTO();
		
		try {
		
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, eventNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				eventDetailInfo.setTitle(rset.getString("EVENT_TITLE"));
				eventDetailInfo.setStartDate(rset.getDate("EVENT_START"));
				eventDetailInfo.setEndDate(rset.getDate("EVENT_END"));
		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return eventDetailInfo;
	}

	public List<EventDTO> selectEventThumnail(Connection con, int eventNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectEventThumnail");
		
		List<EventDTO> eventThumnailInfo = null;
	
		
		try {
		
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, eventNo);
			
			rset = pstmt.executeQuery();
			eventThumnailInfo = new ArrayList<>();
			
			while(rset.next()) {

				EventDTO thumnailInfo = new EventDTO();
				
				thumnailInfo.setThumnailPath(rset.getString("THUMBNAIL_PATH"));
				
				eventThumnailInfo.add(thumnailInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("DAO : "  + eventThumnailInfo);
		return eventThumnailInfo;
	}

	public int insertEvent(Connection con, EventDTO eventInfo) {

//		System.out.println("dao들어와라ㅏㅅ");
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertEvent");
		
		try {
			pstmt= con.prepareStatement(query);
			
			pstmt.setString(1, eventInfo.getTitle());
			pstmt.setDate(2, eventInfo.getStartDate());
			pstmt.setDate(3, eventInfo.getEndDate());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertAttachment(Connection con, AttachmentDTO attachmentDTO) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertEventAttachment");
		try {
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			System.out.println(attachmentDTO);
			pstmt.setInt(1, attachmentDTO.getCategoryNo());
			pstmt.setString(2, attachmentDTO.getOriginName());
			pstmt.setString(3, attachmentDTO.getSavedName());
			pstmt.setString(4, attachmentDTO.getSavePath());
			pstmt.setString(5, attachmentDTO.getFileType());
			pstmt.setString(6, attachmentDTO.getThumbnailPath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}

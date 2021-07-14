package com.bonggeuda.sugbag.owner.regist.dao;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.RoomDTO;

public class RoomDAO {

	/* Properties 객체를 이용해서 쿼리문을 조회해서 사용. 기본 생성자를 통해서 쿼리문을 조회. */
	private Properties prop = new Properties();
	
	public RoomDAO() {
		//registration-mapper.xml 생성
		try {

			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION+"owner/registration/registration-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int InsertRoom(Connection con, RoomDTO roomDTO) {

		PreparedStatement pstmt = null;
		
		/* 반환시킬 변수 지정 */
		int insert = 0;
		
		String query = prop.getProperty("insertRoom");

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, roomDTO.getRoomName());
			pstmt.setInt(2, roomDTO.getRoomMax());
			pstmt.setString(3, roomDTO.getRoomIntro());
			pstmt.setInt(4, roomDTO.getRoomFee());
			pstmt.setInt(5, roomDTO.getPeakFee());

			insert = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
     
		return insert;
	}

	public int insertAttachment(Connection con, AttachmentDTO attachmentDTO) {

		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertRoomAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, attachmentDTO.getOriginName());
			pstmt.setString(2, attachmentDTO.getSavedName());
			pstmt.setString(3, attachmentDTO.getSavePath());
			pstmt.setString(4, attachmentDTO.getFileType());
			pstmt.setString(5, attachmentDTO.getThumbnailPath());
			//pstmt.setInt(6, integer);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectEnAccomoNoMax(Connection con) {
		
		PreparedStatement pstmt = null;
		int selectEnAccomoNoMax = 0;
		ResultSet rset = null;

		String query = prop.getProperty("selectEnNo");
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				selectEnAccomoNoMax = rset.getInt("MAX(EN_ACCOMO_NO)");
			}
		} catch (SQLException e) {
			
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return selectEnAccomoNoMax;
	}

	public int roomRequestCurrvalDAO(Connection con) {
		
		PreparedStatement pstmt = null;
		int selectEnRoomNoMax = 0;
		ResultSet rset = null;

		String query = prop.getProperty("roomRequestCurrval");
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				selectEnRoomNoMax = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return selectEnRoomNoMax;
	}


	public int insertRmRoomThumbnailDAO(Connection con, AttachmentDTO tempFileInfo) {
		
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertRmRoomThumbnail");
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, tempFileInfo.getOriginName());
			pstmt.setString(2, tempFileInfo.getSavedName());
			pstmt.setString(3, tempFileInfo.getSavePath());
			pstmt.setString(4, tempFileInfo.getFileType());
			pstmt.setString(5, tempFileInfo.getThumbnailPath());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertRmRoomInfoDAO(Connection con, RoomDTO roomDTO) {

		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertRmRoomInfo");
		int result = 0;
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, roomDTO.getRoomNo());
			pstmt.setInt(2, roomDTO.getAccomoNo());
			pstmt.setString(3, roomDTO.getRoomName());
			pstmt.setInt(4, roomDTO.getRoomMax());
			pstmt.setString(5, roomDTO.getRoomIntro());
			pstmt.setInt(6, roomDTO.getRoomFee());
			pstmt.setInt(7, roomDTO.getPeakFee());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}



}









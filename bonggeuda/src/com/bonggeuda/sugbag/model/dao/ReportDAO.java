package com.bonggeuda.sugbag.model.dao;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.ReportDTO;

public class ReportDAO {
	
	private final Properties prop;
	
	public ReportDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION+"guest/report/report-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 신고내용 insert
	 * @param con
	 * @param report 신고내용
	 * @return
	 */
	public int insertUserReport(Connection con, ReportDTO report) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertReport");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, report.getWriterType());
			pstmt.setString(2, report.getReportReason());
			pstmt.setInt(3, report.getMemberNo());
			pstmt.setDate(4, report.getReportDate());
			pstmt.setString(5, report.getReportTitle());
			pstmt.setString(6, report.getReportedType());
			pstmt.setInt(7, report.getReportedNo());
			
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
		
		String query = prop.getProperty("insertReportAttachment");
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

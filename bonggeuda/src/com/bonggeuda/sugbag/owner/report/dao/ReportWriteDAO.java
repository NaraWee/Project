package com.bonggeuda.sugbag.owner.report.dao;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;

public class ReportWriteDAO {
	
	private Properties prop = new Properties();

	
	public ReportWriteDAO() {
	
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION+"/owner/report/report-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int insertReport(int refNoMax, Connection con, String writerType, String reportedType, int userNo, int ownerNo, String reportTitle,
			String reportContent) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertReport");
		
		int insertReport = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, refNoMax);
			pstmt.setString(2, writerType);
			pstmt.setString(3, reportContent);
			pstmt.setInt(4, ownerNo);
			pstmt.setString(5, reportTitle);
			pstmt.setString(6, reportedType);
			pstmt.setInt(7, userNo);
			
			insertReport = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return insertReport;
	}

	public int insertReportImage(Connection con, AttachmentDTO tempFileInfo, int refNoMax) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("isnertReportImage");	

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tempFileInfo.getOriginName());
			pstmt.setString(2, tempFileInfo.getSavedName());
			pstmt.setString(3, tempFileInfo.getSavePath());
			pstmt.setString(4, tempFileInfo.getFileType());
			pstmt.setString(5, tempFileInfo.getThumbnailPath());
			pstmt.setInt(6, refNoMax);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int selectMaxRefNo(Connection con) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectRefortNoNoMax");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("NEXTVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}

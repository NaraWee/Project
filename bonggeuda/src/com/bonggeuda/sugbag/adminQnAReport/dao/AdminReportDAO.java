package com.bonggeuda.sugbag.adminQnAReport.dao;

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

import com.bonggeuda.sugbag.adminNotice.dto.AdminNoticeDTO;
import com.bonggeuda.sugbag.adminQnAReport.dto.QnADTO;
import com.bonggeuda.sugbag.adminQnAReport.dto.ReportDTO;
import com.bonggeuda.sugbag.adminQnAReport.dto.ReportHistoryDTO;
import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

public class AdminReportDAO {

	private static Properties prop;
	
	public AdminReportDAO() {
		
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/userInfo/report-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
		
	public List<ReportDTO> selectReportList(Connection con, PageInfoDTO pageInfo) {
		
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<ReportDTO> reportList = null;
		
		String query = prop.getProperty("selectReportList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
		
			rset = pstmt.executeQuery();
			
			reportList = new ArrayList<>();
			
			while(rset.next()) {
				ReportDTO reportInfo = new ReportDTO();
						
				reportInfo.setRnum(rset.getInt("RNUM"));
				reportInfo.setTitle(rset.getString("REPORT_TITLE"));
				reportInfo.setReportDate(rset.getDate("REPORT_DATE"));
				reportInfo.setWirterType(rset.getString("WRITER_TYPE"));
				reportInfo.setStatus(rset.getString("REPORT_STATUS"));
				reportInfo.setReportNo(rset.getInt("REPORT_NO"));
				reportList.add(reportInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reportList;
	}

	public int selectReportTotalCount(Connection con) {
	
		Statement stmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectReportTotalCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
//		System.out.println(totalCount);
		return totalCount;
	}

	public List<ReportDTO> selectSearchReportWriterList(Connection con, PageInfoDTO pageInfo, String condition,
			String value) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<ReportDTO> reportList = null;
		
		if(condition.equals("writer")) {
			
			query = prop.getProperty("selectWriterTypeList");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			pstmt.setString(3, value);

			rset = pstmt.executeQuery();
			
			reportList = new ArrayList<>();
			
			while(rset.next()) {
				
				ReportDTO reportInfo = new ReportDTO();
				
				reportInfo.setRnum(rset.getInt("RNUM"));
				reportInfo.setTitle(rset.getString("REPORT_TITLE"));
				reportInfo.setReportDate(rset.getDate("REPORT_DATE"));
				reportInfo.setWirterType(rset.getString("WRITER_TYPE"));
				reportInfo.setStatus(rset.getString("REPORT_STATUS"));
				reportInfo.setReportNo(rset.getInt("REPORT_NO"));
				reportList.add(reportInfo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reportList;
	}

	public int searchReportWriterCount(Connection con, String condition, String value) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		int writerTypeCount = 0;
		
		if(condition.equals("writer")) {
			
			query = prop.getProperty("selectWriterTypeTotalCount");
		}
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				writerTypeCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return writerTypeCount;
	}

	public int insertReport(Connection con, ReportHistoryDTO dto) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertReport");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getReportNo());
//			pstmt.setString(3, dto.getStatus());
//			pstmt.setDate(2, dto.getWriteDate());  sysdate로 설정해서 클릭안해도된다.

			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return result;
	}

	public ReportDTO selectReportDetail(Connection con, int reportNo) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReportDetail");
		
		ReportDTO reportInfo = new ReportDTO();
		
		try {
		
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {

				reportInfo.setReportType(rset.getString("REPORTED_TYPE"));
				reportInfo.setReason("REPORT_REASON");
				reportInfo.setReportedNo(rset.getInt("REPORTED_NO"));
				reportInfo.setTitle(rset.getString("REPORT_TITLE"));
				reportInfo.setWirterType(rset.getString("WRITER_TYPE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reportInfo;
		
	}

	public List<ReportDTO> selectReportThumnail(Connection con, int reportNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReportThumnail");
		
		List<ReportDTO> reportThumnailInfo = null;
	
		
		try {
		
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			
			rset = pstmt.executeQuery();
			reportThumnailInfo = new ArrayList<>();
			
			while(rset.next()) {

				ReportDTO thumnailInfo = new ReportDTO();
				
				thumnailInfo.setThumnailPath(rset.getString("THUMBNAIL_PATH"));
				
				reportThumnailInfo.add(thumnailInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("DAO : "  + reportThumnailInfo);
		return reportThumnailInfo;
	}

	public void updateUserCount(Connection con, ReportHistoryDTO dto) {
		// TODO Auto-generated method stub
		
	}

}

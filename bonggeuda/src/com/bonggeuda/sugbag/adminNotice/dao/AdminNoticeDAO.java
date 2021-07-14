package com.bonggeuda.sugbag.adminNotice.dao;

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
import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;




public class AdminNoticeDAO {
	
	private static Properties prop;
	
	public AdminNoticeDAO() {
		
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/userInfo/notice-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public static List<AdminNoticeDTO> selectNoitceList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<AdminNoticeDTO> noitceList = null;
		
		String query = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
		
			rset = pstmt.executeQuery();
			
			noitceList = new ArrayList<>();
			
			while(rset.next()) {
				AdminNoticeDTO noticeInfo = new AdminNoticeDTO();
						
				noticeInfo.setRnum(rset.getInt("RNUM"));
				noticeInfo.setTitle(rset.getString("NOTICE_TITLE"));
				noticeInfo.setWriteDate(rset.getDate("NOTICE_WRITE_DATE"));
				noticeInfo.setWriter(rset.getString("WRITER"));
				noticeInfo.setNoticeNo(rset.getInt("NOTICE_NO"));
				noitceList.add(noticeInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return noitceList;
	}

	public static int selectNoticeTotalCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectNoitceTotalCount");
		
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

	public static AdminNoticeDTO selectNoticeDetail(Connection con, String noticeNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectNoticeDetail");
		
		AdminNoticeDTO noticeInfo = new AdminNoticeDTO();
		
		try {
		
			pstmt = con.prepareStatement(query);
//			System.out.println("userNo :" + userNo);
			pstmt.setString(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				noticeInfo.setTitle(rset.getString("NOTICE_TITLE"));
				noticeInfo.setWriter(rset.getString("WRITER"));
				noticeInfo.setWriteDate(rset.getDate("NOTICE_WRITE_DATE"));
				noticeInfo.setContent(rset.getString("NOTICE_CONTENT"));
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return noticeInfo;
	}

	public static int insertNotice(Connection con, AdminNoticeDTO dto) {

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, dto.getContent());
//			pstmt.setDate(2, dto.getWriteDate());  sysdate로 설정해서 클릭안해도된다.
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getWriter());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return result;
	}

	public static int updateNoitce(Connection con, AdminNoticeDTO updateDTO, int noticeNo) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, updateDTO.getTitle());
			pstmt.setString(2, updateDTO.getWriter());
			pstmt.setString(3, updateDTO.getContent());
//			pstmt.setDate(2, updateDTO.getWriteDate()); 
			pstmt.setInt(4,noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return result;
	}

	public static int deleteNoitce(Connection con, AdminNoticeDTO noticeInfo, int noticeNo) {
	
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1,noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return result;
	}

	public static int searchNoticeCount(Connection con, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		int noticeWriterCount = 0;
		
		if(condition.equals("writer")) {
			
			query = prop.getProperty("searchNoticeCount");
		}
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				noticeWriterCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return noticeWriterCount;
	}

	public static List<AdminNoticeDTO> selectSearchWriterList(Connection con, PageInfoDTO pageInfo, String condition,
			String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<AdminNoticeDTO> noitceList = null;
		
		if(condition.equals("writer")) {
			
			query = prop.getProperty("selectSearchWriter");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			pstmt.setString(3, value);

			rset = pstmt.executeQuery();
			
			noitceList = new ArrayList<>();
			
			while(rset.next()) {
		
				AdminNoticeDTO noticeInfo = new AdminNoticeDTO();
				
				noticeInfo.setRnum(rset.getInt("RNUM"));
				noticeInfo.setTitle(rset.getString("NOTICE_TITLE"));
				noticeInfo.setWriteDate(rset.getDate("NOTICE_WRITE_DATE"));
				noticeInfo.setWriter(rset.getString("WRITER"));
				noticeInfo.setNoticeNo(rset.getInt("NOTICE_NO"));
				noitceList.add(noticeInfo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return noitceList;
	}
	

}

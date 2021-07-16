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
import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.user.dto.UserReservationStatusDTO;

public class AdminQnADAO {

	private static Properties prop;
	
	public AdminQnADAO() {
		
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/userInfo/qna-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public static List<QnADTO> selectQnaList(Connection con, PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<QnADTO> qnaList = null;
		
		String query = prop.getProperty("selectQnaList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
		
			rset = pstmt.executeQuery();
			
			qnaList = new ArrayList<>();
			
			while(rset.next()) {
				QnADTO qnaInfo = new QnADTO();

				qnaInfo.setRnum(rset.getInt("RNUM"));
				qnaInfo.setQnaNo(rset.getInt("ADMIN_QNA_NO"));
				qnaInfo.setTitle(rset.getString("ADMIN_QNA_TITLE"));
				qnaInfo.setWriter(rset.getString("ADMIN_QNA_WRITER"));
//				qnaInfo.setAnswerYn(rset.getString("ADMIN_ANSWER_YN"));
				qnaInfo.setMemberNo(rset.getInt("MEMBER_NO"));
				qnaInfo.setWriteDate(rset.getDate("ADMIN_QNA_DATE"));
				qnaList.add(qnaInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qnaList;
	}

	public static int selectQnaTotalCount(Connection con) {
	
		Statement stmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectQnaTotalCount");
		
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

	public static QnADTO selectQnaDetail(Connection con, int qnaNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectQnaDetail");
		
		QnADTO qnaInfo = new QnADTO();
		
		try {
		
			pstmt = con.prepareStatement(query);
//			System.out.println("userNo :" + userNo);
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {

				qnaInfo.setTitle(rset.getString("ADMIN_QNA_TITLE"));
				qnaInfo.setWriter(rset.getString("ADMIN_QNA_WRITER"));
				qnaInfo.setWriteDate(rset.getDate("ADMIN_QNA_DATE"));
				qnaInfo.setContent(rset.getString("ADMIN_QNA_CONTENT"));
				qnaInfo.setQnaNo(rset.getInt("ADMIN_QNA_NO"));
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("qnaINFO" + qnaInfo );
		return qnaInfo;
	}

	public static int insertQna(Connection con, QnADTO dto) {

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertQna");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, dto.getQnaNo());
			pstmt.setString(2, dto.getContent());
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

	public static int searchWriterCount(Connection con, String condition, String value) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		int writerCount = 0;
		
		if(condition.equals("writer")) {
			
			query = prop.getProperty("selectWriterTotalCount");
		}
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				writerCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return writerCount;
	}

	public static List<QnADTO> selectWriterList(Connection con, PageInfoDTO pageInfo, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<QnADTO> qnaList = null;
		
		if(condition.equals("writer")) {
			
			query = prop.getProperty("selectWriterList");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			pstmt.setString(3, value);

			rset = pstmt.executeQuery();
			
			qnaList = new ArrayList<>();
			
			while(rset.next()) {
				
				QnADTO qnaInfo = new QnADTO();

				qnaInfo.setRnum(rset.getInt("RNUM"));
				qnaInfo.setQnaNo(rset.getInt("ADMIN_QNA_NO"));
				qnaInfo.setTitle(rset.getString("ADMIN_QNA_TITLE"));
				qnaInfo.setWriter(rset.getString("ADMIN_QNA_WRITER"));
//				qnaInfo.setAnswerYn(rset.getString("ADMIN_ANSWER_YN"));
				qnaInfo.setMemberNo(rset.getInt("MEMBER_NO"));
				qnaInfo.setWriteDate(rset.getDate("ADMIN_QNA_DATE"));
				qnaList.add(qnaInfo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return qnaList;
	}

}

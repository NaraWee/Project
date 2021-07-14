package com.bonggeuda.sugbag.owner.book.dao;

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
import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.QnADTO;

public class BookingQnADAO {

	private Properties prop = new Properties();

	public BookingQnADAO() {

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION+"owner/bookingList/bookingList-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectTotalCount(Connection con, int ownerNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		/* 반환시킬 변수 지정 */
		int totalCount = 0;
		
		String query = prop.getProperty("selectTotalCount");

		//잘 넘어왔는지 확인용 출력
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
     
		return totalCount;
	}

	public List<QnADTO> selectQuestion(Connection con, PageInfoDTO pageInfo, int ownerNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;

		List<QnADTO> selectQuestion = new ArrayList<>();
		
		String query = prop.getProperty("selectQuestion");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo); //업체번호 받아오기
			pstmt.setInt(2, pageInfo.getStartRow()); 
			pstmt.setInt(3, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
						
			while(rset.next()) {
				
				QnADTO Question = new QnADTO();
				
				Question.setQnaNo(rset.getInt("OWNER_QNA_NO"));
				Question.setQnaTitle(rset.getString("OWNER_QNA_TITLE"));
				Question.setQnaDate(rset.getDate("OWNER_QNA_DATE"));
				Question.setAnswerYn(rset.getString("OWNER_ANSWER_YN"));
				Question.setWriter(rset.getString("USER_NICKNAME"));
				Question.setQnaContent(rset.getString("OWNER_QNA_CONTENT"));
				Question.setRowNum(rset.getInt("RNUM"));
				
				selectQuestion.add(Question); //한 행씩 저장됨
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return selectQuestion;
		
	}

	public AdminQnADTO selectContent(Connection con, int qnaNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;

	    AdminQnADTO selectContent = new AdminQnADTO(); //모든 행을 다 받아서 최종 리스트를 만듬
		
		/* --> selectQuestion 가지고 xml감 */
		String query = prop.getProperty("selectContent");
		
		/*쿼리문 잘 실행되는지 출력*/
				
		/*디비에 들어가서 쿼리문에 따른 값 받아오기*/
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qnaNo); //문의번호 받아오기
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
								
				selectContent.setAdminQnANo(qnaNo);
				selectContent.setAdminQnATitle(rset.getString("OWNER_QNA_TITLE"));
				selectContent.setAdminQnADate(rset.getDate("OWNER_QNA_DATE"));
				selectContent.setAdminQnAWriter(rset.getString("USER_NICKNAME"));
				selectContent.setAdminQnAContent(rset.getString("OWNER_QNA_CONTENT"));
				//selectContent.setAnswerContent(rset.getString("OWNER_ANSWER_CONTENT"));
			}
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return selectContent;
	}

	public int insertAnswer(Connection con, AdminQnADTO qnaDTO) {
		
		PreparedStatement pstmt = null;
		
		int insert = 0;
		
		String query = prop.getProperty("insertAnswer");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, qnaDTO.getAdminQnAContent());
			pstmt.setInt(2, qnaDTO.getAdminQnANo());
			
			insert = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return insert;
	}

	public AdminQnADTO selectAnswer(Connection con, int qnaNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;

	    AdminQnADTO selectAnswer = new AdminQnADTO(); //모든 행을 다 받아서 최종 리스트를 만듬
		
		String query = prop.getProperty("selectAnswer");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qnaNo); //문의번호 받아오기
			pstmt.setInt(2, qnaNo); 
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
								
				selectAnswer.setAnswerContent(rset.getString("OWNER_ANSWER_CONTENT"));
				selectAnswer.setAnswerDate(rset.getDate("OWNER_ANSWER_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return selectAnswer;
	}

	public int updateYn(Connection con, int qnaNo) {

		PreparedStatement pstmt = null;
		
		/* 반환시킬 변수 지정 */
		int updateYn = 0;
		
		String query = prop.getProperty("updateYn");

		//잘 넘어왔는지 확인용 출력
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, qnaNo);
			
			updateYn = pstmt.executeUpdate();
			
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
     
		return updateYn;
	}

}

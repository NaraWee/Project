package com.bonggeuda.sugbag.owner.notice.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.QnADTO;
import com.bonggeuda.sugbag.owner.notice.dao.QuestionDAO;

public class QuestionService {

	/*QuestionDAO와 연결할 필드 변수*/
	QuestionDAO questionDAO = new QuestionDAO();
	
	public List<QnADTO> selectQuestion(int ownerNo) {

		Connection con = getConnection();
		
		List<QnADTO> selectQuestion = questionDAO.selectQuestion(con,ownerNo);
		
		close(con);

		return selectQuestion;
	}

	public AdminQnADTO selectContent(int qnaNo, int ownerNo) {
		
		Connection con = getConnection();
		
		AdminQnADTO selectContent = questionDAO.selectContent(con, qnaNo, ownerNo);
		
		close(con);

		return selectContent;
	}

	public int InsertQuestion(AdminQnADTO questionWrite, int ownerNo) {

		Connection con = getConnection();
		
		int insertQuestion = questionDAO.insertQuestion(con, questionWrite, ownerNo);
		
		if(insertQuestion > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return insertQuestion;
	}

	public AdminQnADTO selectAnswer(int qnaNo, int ownerNo) {

		Connection con = getConnection();
		
		AdminQnADTO selectAnswer = questionDAO.selectAnswer(con, qnaNo, ownerNo);
		
		close(con);

		return selectAnswer;
	}

	public int selectTotalCount(int ownerNo) {

		Connection con = getConnection();
		
		int totalCount = questionDAO.selectTotalCount(con, ownerNo);
		
		if(totalCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return totalCount;
	}

	public List<QnADTO> selectQuestion(PageInfoDTO pageInfo, int ownerNo) {

		Connection con = getConnection();
		
		List<QnADTO> selectQuestion = questionDAO.selectQuestion(con, pageInfo, ownerNo);
		
		close(con);

		return selectQuestion;
	}

}

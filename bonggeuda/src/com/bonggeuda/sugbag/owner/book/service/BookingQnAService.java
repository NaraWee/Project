package com.bonggeuda.sugbag.owner.book.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.QnADTO;
import com.bonggeuda.sugbag.owner.book.dao.BookingQnADAO;

public class BookingQnAService {

	/*QuestionDAO와 연결할 필드 변수*/
	BookingQnADAO qnaDAO = new BookingQnADAO();
	
	public int selectTotalCount(int ownerNo) {

		Connection con = getConnection();
		
		int totalCount = qnaDAO.selectTotalCount(con,ownerNo);
		
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
		
		List<QnADTO> selectQuestion = qnaDAO.selectQuestion(con, pageInfo,ownerNo);
		
		close(con);

		return selectQuestion;
	}

	public AdminQnADTO selectContent(int qnaNo) {
	
		Connection con = getConnection();
		
		AdminQnADTO selectContent = qnaDAO.selectContent(con, qnaNo);
		
		close(con);

		return selectContent;
	}

	public int InsertAnswer(AdminQnADTO qnaDTO) {

		Connection con = getConnection();
		
		int insertAnswer = qnaDAO.insertAnswer(con, qnaDTO);
		
		if(insertAnswer > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return insertAnswer;
	}

	public AdminQnADTO selectAnswer(int qnaNo) {
		
		Connection con = getConnection();
		
		AdminQnADTO selectAnswer = qnaDAO.selectAnswer(con, qnaNo);
		
		close(con);

		return selectAnswer;
	}

	public int updateYn(int qnaNo) {
		
		Connection con = getConnection();
		
		int updateYn = qnaDAO.updateYn(con, qnaNo);
		
		if(updateYn > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return updateYn;
	}
}

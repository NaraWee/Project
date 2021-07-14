package com.bonggeuda.sugbag.owner.book.service;

import java.sql.Connection;
import java.util.List;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.BookingContentDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.owner.book.dao.BookingListSelectDAO;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

public class BookListSelectService {
	
	private BookingListSelectDAO bookDAO = new BookingListSelectDAO();

	public List<BookDTO> bookListSelect(PageInfoDTO pageInfo, int ownerNo) {
		
		Connection con = getConnection();
		
		List<BookDTO> bookListSelect = bookDAO.selectBookList(con, pageInfo, ownerNo);
		
		close(con);
		
		return bookListSelect;
	}

	public BookingContentDTO selectBookContent(int bookNo) {

		Connection con = getConnection();
		
		BookingContentDTO bookConDTO = bookDAO.selectBookContent(con, bookNo);
		
		close(con);
		
		return bookConDTO;
	}

	public int bookAllowUpdate(int bookNo) {

		Connection con = getConnection();
		
		int bookAllowUpdate = bookDAO.bookAllowUpdate(con,bookNo);
		//int bookAllowStatusUpdate = bookDAO.bookAllowStatusUpdateDAO(con,bookNo);
		
		if(bookAllowUpdate > 0)
		{
			commit(con);
		}else {
			rollback(con);
		}
	
		close(con);
		
		return bookAllowUpdate;
	}

	public int insertBookHistory(int bookNo) {

		Connection con = getConnection();
		
		int bookHistoryInsert = bookDAO.bookHistoryInsert(con,bookNo);
		
		if(bookHistoryInsert > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);

		
		return bookHistoryInsert;
	}

	public int bookRejectUpdate(int bookNo) {
		
		Connection con = getConnection();
		
		int bookRejectUpdate = bookDAO.bookRejectUpdate(con, bookNo);
		
		if(bookRejectUpdate >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return bookRejectUpdate;
	}
	
	public int bookRejectHistoryInsert(int bookNo, String rejecetReason) {

		Connection con = getConnection();

		int bookHistoryInsert = bookDAO.bookRejectHistoryInsert(con, bookNo , rejecetReason);
		
		if(bookHistoryInsert > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);

		return bookHistoryInsert;
	}

	public int bookRejectBookConfirmUpdate(int bookNo) {
		
		Connection con = getConnection();
		
		int bookRejectBookConfirmUpdate = bookDAO.bookRejectUpdateBookConfirm(con, bookNo);
				
		
		if(bookRejectBookConfirmUpdate >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return bookRejectBookConfirmUpdate;
	}

	public int selectTotalCount(int ownerNo) {

		Connection con = getConnection();
		
		int totalCount = bookDAO.selectTotalCount(con,ownerNo);
		
		if(totalCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return totalCount;
	}

	public List<BookDTO> bookPastListSelect(PageInfoDTO pageInfo, int ownerNo) {
		
		Connection con = getConnection();
		
		List<BookDTO> bookListSelect = bookDAO.selectBookPastList(con, pageInfo, ownerNo);
		
		close(con);
		
		return bookListSelect;
	}

	public int TotalCount(int ownerNo) {

		Connection con = getConnection();
		
		int totalCount = bookDAO.totalCount(con,ownerNo);
		
		if(totalCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return totalCount;
	}

	public int insertSalesHistory(int accomoNo, int roomNo, int paymentFee, int paymentNo) {
		Connection con = getConnection();

		int result = bookDAO.insertSelectHistoryDAO(con,roomNo,paymentFee,paymentNo,accomoNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int selectcompleteCount(int bookNo) {
		Connection con = getConnection();
		
		int selectcompleteCount = bookDAO.selectcompleteCountDAO(bookNo,con);
		
		return selectcompleteCount;
	}

	public int bookFinUpdate(int bookNo) {

		Connection con = getConnection();
		
		int bookFin = bookDAO.bookAllowStatusUpdateDAO(con,bookNo);
		
		if(bookFin > 0)
		{
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return bookFin;
	}

}
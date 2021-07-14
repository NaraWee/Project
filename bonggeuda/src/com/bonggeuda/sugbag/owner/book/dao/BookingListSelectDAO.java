package com.bonggeuda.sugbag.owner.book.dao;

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
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.BookingContentDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

public class BookingListSelectDAO {
	
	private Properties prop = new Properties();

	public BookingListSelectDAO() {
	
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION+"owner/bookingList/bookingList-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<BookDTO> selectBookList(Connection con, PageInfoDTO pageInfo, int ownerNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<BookDTO> selectBookedList = new ArrayList<>();
		/* 반환 시킬 변수를 지정하자*/
		BookDTO bookDTO = new BookDTO();
		
		String query = prop.getProperty("selectBookingList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bookDTO = new BookDTO();
				
				bookDTO.setBookNo(rset.getInt("BOOK_NO"));
				bookDTO.setBookUserName(rset.getString("BOOK_USER_NAME"));
				bookDTO.setBookPersonnel(rset.getInt("BOOK_PERSONNEL"));
				bookDTO.setBookCheckDate(rset.getString("BOOK_CHECK_DATE")); // 디비에서도 문자열 값임.
				bookDTO.setBookCheckoutDate(rset.getString("BOOK_CHECK_DATE"));
				bookDTO.setBookApproveYn(rset.getString("BOOK_APPROVE_YN"));
				bookDTO.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				bookDTO.setRequest(rset.getString("REQUEST"));
				bookDTO.setRoomName(rset.getString("ROOM_NAME"));
				bookDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				bookDTO.setUserPhone(rset.getString("USER_PHONE"));
				bookDTO.setBookStatusYNC(rset.getString("BOOK_STATUS_YNC"));
				bookDTO.setRowNum(rset.getInt("RNUM"));

				selectBookedList.add(bookDTO);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return selectBookedList;
	}

	
	/**
	 * 예약 상세내용 보는 메소드
	 * @param con
	 * @param bookNo
	 * @return
	 */
	public BookingContentDTO selectBookContent(Connection con, int bookNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		BookingContentDTO bookConDTO = new BookingContentDTO();
		
		String query = prop.getProperty("selectBookContent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bookNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bookConDTO = new BookingContentDTO();
				
				bookConDTO.setBookNo(rset.getInt("BOOK_NO"));
				bookConDTO.setBookUserName(rset.getString("BOOK_USER_NAME"));
				bookConDTO.setBookPersonnel(rset.getInt("BOOK_PERSONNEL"));
				bookConDTO.setBookCheckDate(rset.getString("BOOK_CHECK_DATE"));
				bookConDTO.setBookCheckoutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				bookConDTO.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				bookConDTO.setRequest(rset.getString("REQUEST"));
				bookConDTO.setRoomName(rset.getString("ROOM_NAME"));
				bookConDTO.setPaymentFee(rset.getInt("ROOM_FEE"));
				bookConDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				bookConDTO.setEmail(rset.getString("USER_ID"));
				bookConDTO.setUserPhone(rset.getString("USER_PHONE"));
				bookConDTO.setBookRequestDate(rset.getString("PAYMENT_TIME"));
				bookConDTO.setPaymentMethod(rset.getString("PAYMENT_METHOD"));
				bookConDTO.setPaymentFee(rset.getInt("PAYMENT_AMOUNT"));
				bookConDTO.setAccomoNo(rset.getInt("ACCOMO_NO"));
				bookConDTO.setPaymentNo(rset.getInt("PAYMENT_NO"));
				bookConDTO.setRoomNo(rset.getInt("ROOM_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bookConDTO;
	}

	public int bookAllowUpdate(Connection con, int bookNo) {

		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("bookAllowUpadte");
		
		int bookAllowUpdate = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bookNo);
			
			bookAllowUpdate = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return bookAllowUpdate;
	}

	public int bookHistoryInsert(Connection con, int bookNo) {

		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertAllowBookHistory");
		
		int insertAllowBookHistory = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bookNo);
			
			insertAllowBookHistory = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return insertAllowBookHistory;
	}

	public int bookRejectUpdate(Connection con, int bookNo) {
		
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("bookRejectUpadte");
		
		int bookRejectUpdate = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bookNo);
			
			bookRejectUpdate = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
			close(con);
		}

		return bookRejectUpdate;
	}
	
	public int bookRejectUpdateBookConfirm(Connection con, int bookNo) {
		
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("bookRejectBookConfirmUpadte");
		
		int bookRejectUpdate = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bookNo);
			
			bookRejectUpdate = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
			close(con);
		}

		return bookRejectUpdate;
	}
	
	public int bookRejectHistoryInsert(Connection con, int bookNo, String rejecetReason) {

		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertRejectBookHistory");

		int insertRejectBookHistory = 0;

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bookNo);
			pstmt.setString(2, rejecetReason);
			
			insertRejectBookHistory = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return insertRejectBookHistory;
	}

	public int selectTotalCount(Connection con, int ownerNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		/* 반환시킬 변수 지정 */
		int totalCount = 0;
		
		String query = prop.getProperty("pastBookingTotalCount");


		
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

	public List<BookDTO> selectBookPastList(Connection con, PageInfoDTO pageInfo, int ownerNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		List<BookDTO> selectBookedList = new ArrayList<>();
	
		/* 반환 시킬 변수를 지정하자*/
		BookDTO bookDTO = new BookDTO();
		
		String query = prop.getProperty("selectPastBookingList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bookDTO = new BookDTO();
				
				bookDTO.setBookNo(rset.getInt("BOOK_NO"));
				bookDTO.setBookUserName(rset.getString("BOOK_USER_NAME"));
				bookDTO.setBookPersonnel(rset.getInt("BOOK_PERSONNEL"));
				bookDTO.setBookCheckDate(rset.getString("BOOK_CHECK_DATE")); // 디비에서도 문자열 값임.
				bookDTO.setBookCheckoutDate(rset.getString("BOOK_CHECKOUT_DATE"));
				bookDTO.setBookApproveYn(rset.getString("BOOK_APPROVE_YN"));
				bookDTO.setBookCheckIn(rset.getString("BOOK_CHECK_IN"));
				bookDTO.setRequest(rset.getString("REQUEST"));
				bookDTO.setRoomName(rset.getString("ROOM_NAME"));
				bookDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				bookDTO.setUserPhone(rset.getString("BOOK_PHONE"));
				bookDTO.setBookStatusYNC(rset.getString("BOOK_STATUS_YNC"));
				bookDTO.setRowNum(rset.getInt("RNUM"));

				bookDTO.setUserNo(rset.getInt("USER_NO"));
				bookDTO.setOwnerNo(rset.getInt("OWNER_NO"));
				
				selectBookedList.add(bookDTO);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return selectBookedList;
	}

	public int totalCount(Connection con, int ownerNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		/* 반환시킬 변수 지정 */
		int totalCount = 0;
		
		String query = prop.getProperty("bookingTotalCount");


		
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

	public int insertSelectHistoryDAO(Connection con, int roomNo, int paymentFee, int paymentNo, int accomoNo) {

		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertSelectHistory");
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, accomoNo);
			pstmt.setInt(2, roomNo);
			pstmt.setInt(3, paymentFee);
			pstmt.setInt(4, paymentNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int selectcompleteCountDAO(int bookNo, Connection con) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int selectcompleteCount = 0;
		String query = prop.getProperty("selectcompleteCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				selectcompleteCount = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return selectcompleteCount;
	}

	public int bookAllowStatusUpdateDAO(Connection con, int bookNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String query = prop.getProperty("bookAllowStatusUpadte");
		
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bookNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
























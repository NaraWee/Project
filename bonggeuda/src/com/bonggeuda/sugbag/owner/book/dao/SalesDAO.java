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
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.SalesDTO;

public class SalesDAO {

	private Properties prop = new Properties();

	public SalesDAO() {
	
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION+"owner/bookingList/bookingList-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<SalesDTO> selectSales(Connection con, int ownerNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<SalesDTO> selectSales = new ArrayList<>();

		SalesDTO SalesDTO = new SalesDTO();
		
		String query = prop.getProperty("selectAccomoList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				SalesDTO accomoList = new SalesDTO();
				
				accomoList.setAccomoName(rset.getString("ACCOMO_NAME"));
				accomoList.setRoomName(rset.getString("ROOM_NAME"));

				selectSales.add(accomoList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return selectSales;
		
	}

	public int rowspanCountDAO(Connection con, int ownerNo, int accmoNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int rowspanCount = 0;
		
		String query = prop.getProperty("rowspanCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);
			pstmt.setInt(2, accmoNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rowspanCount = rset.getInt("COUNT(*)");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return rowspanCount;
	}

	public List<String> selectRoomName(Connection con, int ownerNo, int accmoNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<String> selectRoomName = new  ArrayList<String>();

		String query = prop.getProperty("selectRoomName");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);
			pstmt.setInt(2, accmoNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				selectRoomName.add(rset.getString("ROOM_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}


		
		return selectRoomName;
	}

	public int selectBookCountDAO(Connection con, int accmoNo) {
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int selectBookCount = 0;
		
		String query = prop.getProperty("selectBookCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accmoNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				selectBookCount = rset.getInt("COUNT(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return selectBookCount;
	}

	public int sumSalePriceDAO(int accmoNo, Connection con) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int sumSalePrice = 0;
		
		String query = prop.getProperty("sumSalePrice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accmoNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				sumSalePrice = rset.getInt("SUM(SALES_PRICE)");
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}


		
		return sumSalePrice;
	}

}

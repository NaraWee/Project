package com.bonggeuda.sugbag.owner.book.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.bonggeuda.sugbag.model.dto.SalesDTO;
import com.bonggeuda.sugbag.owner.book.dao.SalesDAO;

public class SalesService {

	private SalesDAO salesDAO = new SalesDAO();

	public List<SalesDTO> selectSales(int ownerNo) {
		
		Connection con = getConnection();
		
		List<SalesDTO> selectSales = salesDAO.selectSales(con, ownerNo);
		
		close(con);
		
		return selectSales;
	}

	public int rowspanCountService(int ownerNo, int accmoNo) {
		
		Connection con = getConnection();
		
		int rowspanCount = salesDAO.rowspanCountDAO(con,ownerNo,accmoNo);
		
		close(con);
		
		return rowspanCount;
	}

	public List<String> selectRoomName(int ownerNo, int accmoNo) {
		Connection con = getConnection();
		 List<String> selectRoomName = new  ArrayList<String>();
		 
		 selectRoomName = salesDAO.selectRoomName(con,ownerNo, accmoNo);
		
		close(con);

		return selectRoomName;
	}

	public int selectBookCount(int accmoNo) {
		Connection con = getConnection();
		int selectBookCount = salesDAO.selectBookCountDAO(con,accmoNo);
		
		close(con);

		return selectBookCount;
	}

	public int sumSalePriceService(int accmoNo) {
		Connection con = getConnection();		
		
		int sumSalePrice = salesDAO.sumSalePriceDAO(accmoNo,con);
		
		close(con);
		return sumSalePrice;
	}

}

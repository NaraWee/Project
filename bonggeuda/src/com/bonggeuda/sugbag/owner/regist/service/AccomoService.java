package com.bonggeuda.sugbag.owner.regist.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.owner.regist.dao.AccomoDAO;

public class AccomoService {

	/*AccomoDAO와 연결할 필드 변수*/
	private AccomoDAO accomoDAO = new AccomoDAO();
	
	public int InsertAccomoServlet(AccomoDTO accomoDTO, int ownerNo) {

		Connection con = getConnection();

		/*Connection과 함께 정보를 전달하여 조회.*/
		int insertAccomo = accomoDAO.InsertAccomo(con, accomoDTO, ownerNo);
		
		if(insertAccomo > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return insertAccomo;
	}

	public int selectEnNo() {

		Connection con = getConnection();
		
		int slectEnNo = accomoDAO.selectEnNo(con);
		
		close(con);
		
		return slectEnNo;
	}

	public int selectRequestNextValService() {

		Connection con = getConnection();

		int selectCurrval = accomoDAO.selectRequestNextVal(con);
		
		close(con);

		
		return selectCurrval;
	}



}

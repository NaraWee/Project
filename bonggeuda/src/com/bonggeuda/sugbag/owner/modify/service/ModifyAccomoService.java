package com.bonggeuda.sugbag.owner.modify.service;

import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.RmAccomoInfoDTO;
import com.bonggeuda.sugbag.owner.modify.dao.ModifyAccomoDAO;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;


public class ModifyAccomoService {
	
	private ModifyAccomoDAO modifyDAO = new ModifyAccomoDAO();

	public RmAccomoInfoDTO selectAccomoInfo(int accomoNo) {

		Connection con = getConnection();
		
		RmAccomoInfoDTO rmAccomoInfo= modifyDAO.selectRmAccomoInfoDAO(con, accomoNo);
		
		close(con);
		
		return rmAccomoInfo;
	}


	public RmAccomoInfoDTO selectAccomoInfoTwo(int rmAccomoNo) {
		
		Connection con = getConnection();
		
		RmAccomoInfoDTO rmAccomoInfo= modifyDAO.selectRmAccomoInfoDAOTwo(con, rmAccomoNo);
		
		close(con);
		
		return rmAccomoInfo;
		
	}

	public RmAccomoInfoDTO selecAccomoInfoThree(int rmAccomoNo) {
		
		Connection con = getConnection();
		
		RmAccomoInfoDTO rmAccomoInfo= modifyDAO.selectRmAccomoInfoDAOThree(con, rmAccomoNo);
		
		close(con);
		
		return rmAccomoInfo;
	}
	
	public int insertModifyAccomoThumbnail(AttachmentDTO tempFileInfo, int selectReqNoMax) {
		/* Connection 생성 */
		Connection con = getConnection();
		
		/* 최종적으로 반환할 result 선언 */
		int result = 0;
		
		result = modifyDAO.insertModifyAttachment(con,tempFileInfo,selectReqNoMax);
		
		if(result > 0) {
			commit(con);
			
		}else {
			rollback(con);
		}
		
		return result;
	}


	public int insertAccomoThumbnail(AttachmentDTO tempFileInfo, int seqCurrvalSelect) {
		/* Connection 생성 */
		Connection con = getConnection();
		
		/* 최종적으로 반환할 result 선언 */
		int result = 0;
		
		result = modifyDAO.insertAccomoAttachment(con,tempFileInfo,seqCurrvalSelect);
		
		if(result > 0) {
			commit(con);
			
		}else {
			rollback(con);
		}
		
		return result;
	}


	public int selectrmCount(int accomoNo) {
		
		Connection con = getConnection();

		int result = 0;

		result = modifyDAO.selectRmCountDAO(con,accomoNo);

		if(result > 0) {
			commit(con);
			
		}else {
			rollback(con);
		}
		
		return result;
	}




}

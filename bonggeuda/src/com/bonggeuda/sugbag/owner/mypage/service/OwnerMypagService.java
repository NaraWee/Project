package com.bonggeuda.sugbag.owner.mypage.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.model.dto.NoticeDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.ReportDTO;
import com.bonggeuda.sugbag.model.dto.RequestTaxBillDTO;
import com.bonggeuda.sugbag.model.dto.SettlementDTO;
import com.bonggeuda.sugbag.owner.mypage.dao.OwnerMypageDAO;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

public class OwnerMypagService {
	
	private OwnerMypageDAO ownerDAO = new OwnerMypageDAO();
	
	public OwnerInfoDTO selectOwnerInfo(int ownerNo) {

		/* Connection 생성 */
		Connection con = getConnection();
		
		OwnerInfoDTO selectOwner = ownerDAO.selectOwner(con,ownerNo);
		
		/* 생각 : 트랜잭션 처리가 필요한 상황인가? (커밋,롤백) <- 셀렉트니 필요없지*/
		
		/* COnnection 닫기*/
		close(con);
		
		return selectOwner;
	}

	public List<ReportDTO> selectReportList(PageInfoDTO pageInfo, int ownerNo) {

		Connection con = getConnection();
		
		List<ReportDTO> selectReportList = ownerDAO.selectReportList(con, pageInfo, ownerNo);

		close(con);
		
		return selectReportList;
	}

	public ReportDTO selectReportDetail(int reportNo) {

		Connection con = getConnection();

		ReportDTO reportDTO = ownerDAO.selectReportDetail(con,reportNo);
		
		close(con);
		
		return reportDTO;
	}

	public String selectRejectReason(int reportNo) {
		Connection con = getConnection();
		
		String selectRejectReason = ownerDAO.selectRejectReason(reportNo,con);
		
		close(con);
		
		return selectRejectReason;
	}

	public int ownerWithdrawUpdateService(int ownerNo) {
		
		Connection con = getConnection();

		int ownerWithdrawUpdate = ownerDAO.ownerWithdrawUpdateDAO(con,ownerNo);
		
		
		if(ownerWithdrawUpdate>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);

		return ownerWithdrawUpdate;
	}

	public List<RequestTaxBillDTO> selectTaxBillList(PageInfoDTO pageInfo, int ownerNo) {
		
		Connection con = getConnection();

		List<RequestTaxBillDTO> selectTaxBillList = ownerDAO.selectTaxBillListDAO(con,pageInfo,ownerNo);
		
		close(con);

		return selectTaxBillList;
	}

	public int insertRequestTaxBill(int stlNo, int accomoNo) {
		
		Connection con = getConnection();

		int result = ownerDAO.insertRequestTaxBillDAO(con,accomoNo,stlNo);
				
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public List<AccomoDTO> selectAccomoNames(int ownerNo) {
		
		Connection con = getConnection();
		
		List<AccomoDTO> selectAccomoNames = ownerDAO.selectAccomoNamesDAO(ownerNo,con);
		
		close(con);
		
		return selectAccomoNames;
	}

	public int selectAccomoNo(String accomoName, int ownerNo) {

		Connection con = getConnection();

		int selectAccomoNo = ownerDAO.selectAccomoNoDAO(con,accomoName,ownerNo );
		
		close(con);
		
		return selectAccomoNo;
	}

	public List<SettlementDTO> selectStl(PageInfoDTO pageInfo, int ownerNo) {
	
		Connection con = getConnection();
		
		List<SettlementDTO> selectStl = ownerDAO.selectStl(con, pageInfo, ownerNo);
		
		close(con);

		return selectStl;
	}

	public String selectImagePath(int reportNo) {
		
		Connection con = getConnection();
		String selectImagePath = ownerDAO.selectImagePathDAO(con,reportNo);
		
		close(con);
		
		
		return selectImagePath;
	}
	
	public List<AccomoDTO> selectAccomo(int ownerNo) {

		Connection con = getConnection();
		
		List<AccomoDTO> selectAccomo = ownerDAO.selectAccomo(con,ownerNo);
		
		close(con);
		
		return selectAccomo;
	}

	public int insertStl(int accomoNo) {
		
		Connection con = getConnection();
		
		int insertStl = ownerDAO.insertStl(con, accomoNo);
		
		if(insertStl > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return insertStl;
	}
	
	//신고
	public int selectTotalCount(int ownerNo) {

		Connection con = getConnection();
		
		int totalCount = ownerDAO.selectTotalCount(con,ownerNo);
		
		if(totalCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return totalCount;
	}
	
	//정산신청
	public int selectStlTotalCount(int ownerNo) {

		Connection con = getConnection();
		
		int stlTotalCount = ownerDAO.selectStlTotalCount(con, ownerNo);
		
		if(stlTotalCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return stlTotalCount;
	}

	//세금계산서 신청
	public int taxTotalCount(int ownerNo) {
	
		Connection con = getConnection();
		
		int taxTotalCount = ownerDAO.taxTotalCount(con, ownerNo);
		
		if(taxTotalCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return taxTotalCount;
	}

	public int selectreportedCount(int ownerNo) {
		
		Connection con = getConnection();

		int selectreportedCount = ownerDAO.selectreportedCountDAO(con, ownerNo);
		
		close(con);
		
		return selectreportedCount;
	}

	public int updatePwd(String pwd, int ownerNo) {
		Connection con = getConnection();
		
		int result  = ownerDAO.updatePwdDAO(con,pwd,ownerNo);
		close(con);

		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public int ownerWithdrawInsertService(String realWithdrawReason, int ownerNo) {
		
		Connection con = getConnection();
		
		int result = ownerDAO.insertWithdrawDAO( realWithdrawReason,ownerNo,con);
		close(con);

		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public int updatePhoneNo(int ownerNo, String phone) {
		
		Connection con = getConnection();

		int result = ownerDAO.updatePhoneNoDAO(con,ownerNo, phone);
		close(con);

		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public List<AccomoDTO> selectAccomoList(int ownerNo) {
		
		Connection con = getConnection();
		List<AccomoDTO> selectAccomoList = new ArrayList<AccomoDTO>();
		
		selectAccomoList = ownerDAO.selectAccomoListDAO(con,ownerNo);
		
		close(con);

		
		return selectAccomoList;
	}

}

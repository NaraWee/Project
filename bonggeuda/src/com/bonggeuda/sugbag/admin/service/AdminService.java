package com.bonggeuda.sugbag.admin.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

import com.bonggeuda.sugbag.admin.common.dto.AttachmentDTO;
import com.bonggeuda.sugbag.admin.model.dao.OwnerDAO;
import com.bonggeuda.sugbag.admin.owner.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.BMemberDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.RoomInfoDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.PaymentDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.RequestDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.SettlementDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.StlPerDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.TaxBillDTO;

public class AdminService {
	private OwnerDAO ownerDAO;

	public AdminService() {
		ownerDAO = new OwnerDAO();

	}

	public List<OwnerInfoDTO> ownerListSelect(PageInfoDTO pageInfo) {

		Connection con = getConnection();

		List<OwnerInfoDTO> ownerList = new ArrayList<OwnerInfoDTO>();

		ownerList = ownerDAO.ownerListSelect(con, pageInfo);
		close(con);
		return ownerList;
	}

	public int selectTotalCount() {

		Connection con = getConnection();

		int totalCount = ownerDAO.selectTotalCount(con);
		close(con);
		return totalCount;
	}

	public OwnerInfoDTO ownerSearch(String searchValue) {

		Connection con = getConnection();

		OwnerInfoDTO searchOwner = new OwnerInfoDTO();

		searchOwner = ownerDAO.ownerSearch(con, searchValue);
		close(con);
		return searchOwner;
	}

	public List<AccomoInfoDTO> ownerDetailInfo(int ownerNo) {

		List<AccomoInfoDTO> accomoList = new ArrayList<AccomoInfoDTO>();

		Connection con = getConnection();

		accomoList = ownerDAO.ownerDetailInfo(con, ownerNo);
		close(con);
		return accomoList;
	}

	public int rmCountSelect(String yn) {
		int totalYNCount = 0;

		Connection con = getConnection();

		totalYNCount = ownerDAO.rmCountSelect(con, yn);
		close(con);
		return totalYNCount;
	}

	public Map<String, Object> accomoRMList(String yn) {
		Connection con = getConnection();

		Map<String, Object> totalRmMap = new HashMap<String, Object>();

		totalRmMap = ownerDAO.accomoRMList(con, yn);
		close(con);
		return totalRmMap;
	}

	public AccomoInfoDTO rmAccomoInfo(int requestNo) {
		Connection con = getConnection();

		AccomoInfoDTO accomoDetailInfo = new AccomoInfoDTO();

		accomoDetailInfo = ownerDAO.rmAccomoInfo(con, requestNo);
		close(con);
		return accomoDetailInfo;
	}

	public RoomInfoDTO rmRoomInfo(int requestNo) {

		RoomInfoDTO rmRoomInfo = new RoomInfoDTO();
		Connection con = getConnection();
		rmRoomInfo = ownerDAO.rmRoomInfo(con, requestNo);

		close(con);

		return rmRoomInfo;
	}

	public Map<String, Object> accomoInfoSelect(int accomoNo) {

		Map<String, Object> accomoMap = new HashMap<String, Object>();
		Connection con = getConnection();
		accomoMap = ownerDAO.accomoInfoSelect(con, accomoNo);
		close(con);

		return accomoMap;
	}

	public Map<String, Object> enInfoSelect(int requestNo) {

		Map<String, Object> enMap = new HashMap<String, Object>();

		Connection con = getConnection();

		enMap = ownerDAO.enInfoSelect(con, requestNo);
		close(con);

		return enMap;
	}

	public int accomoInsert(AccomoInfoDTO accomo, List<AttachmentDTO> attList) {
		Connection con = getConnection();

		int result = ownerDAO.accomoInsert(con, accomo, attList);
		if (result >= 1) {
			commit(con);
			close(con);
		}
		return result;
	}

	public int roomInsert(List<RoomInfoDTO> roomList, List<AttachmentDTO> attList) {
		Connection con = getConnection();

		int result = ownerDAO.roomInsert(con, roomList, attList);
		if (result >= 1) {
			commit(con);
			close(con);
		}
		return result;

	}

	public List<AttachmentDTO> selectAttachment(int requestNo, String ar) {

		List<AttachmentDTO> attList = new ArrayList<>();
		Connection con = getConnection();

		attList = ownerDAO.selectAttachment(con, requestNo, ar);

		close(con);

		return attList;
	}

	public int updateRmList(Map<String, Object> totalInfoMap) {

		int result = 0;

		Connection con = getConnection();

		result = ownerDAO.updateRmList(con, totalInfoMap);
		if (result >= 1) {

			commit(con);
			close(con);
		}

		return result;
	}

	public int insertHistory(Map<String, Object> enMap, String cancleReason) {

		int result = 0;

		Connection con = getConnection();

		result = ownerDAO.insertHistory(con, enMap, cancleReason);
		if (result >= 1) {

			commit(con);
			close(con);
		}

		return result;
	}

	public int updateAccomo(AccomoInfoDTO accomo) {
		int result = 0;
		Connection con = getConnection();

		result = ownerDAO.updateAccomo(con, accomo);
		if (result >= 1) {

			commit(con);
			close(con);
		}

		return result;
	}

	public int updateRoom(List<RoomInfoDTO> roomList) {

		int result = 0;
		Connection con = getConnection();

		result = ownerDAO.updateAccomo(con, roomList);
		if (result >= 1) {

			commit(con);
			close(con);
		}

		return result;
	}

	public List<BMemberDTO> bListSelect(PageInfoDTO pageInfo) {

		List<BMemberDTO> bList = new ArrayList<BMemberDTO>();

		Connection con = getConnection();

		bList = ownerDAO.bListSelect(con, pageInfo);
		return bList;
	}

	public int totalBlistCount() {
		Connection con = getConnection();
		int totalCount = ownerDAO.totalBlistCount(con);

		close(con);
		return totalCount;
	}

	public int totalPayCount() {

		Connection con = getConnection();

		int totalCount = ownerDAO.totalPayCount(con);

		close(con);
		return totalCount;
	}

	public List<PaymentDTO> payList(PageInfoDTO pageInfo) {

		List<PaymentDTO> payList = new ArrayList<PaymentDTO>();

		Connection con = getConnection();

		payList = ownerDAO.payList(con, pageInfo);

		return payList;
	}

	public PaymentDTO payInfo(int paymentNo) {

		PaymentDTO payInfo = new PaymentDTO();

		Connection con = getConnection();

		payInfo = ownerDAO.payInfo(con, paymentNo);

		return payInfo;

	}

	public int totalCancleCount(String refundStatus) {
		
		Connection con = getConnection();

		int totalCount = ownerDAO.totalCancleCount(con, refundStatus);

		close(con);
		return totalCount;
		
	}

	public List<PaymentDTO> cancleList(PageInfoDTO pageInfo, String refundStatus) {
		
		List<PaymentDTO> cancleList = new ArrayList<PaymentDTO>();

		Connection con = getConnection();

		cancleList = ownerDAO.cancleList(con, pageInfo, refundStatus);

		return cancleList;
		
	}

	public PaymentDTO cancleInfo(int cancleNo) {
		
		PaymentDTO cancle = new PaymentDTO();

		Connection con = getConnection();

		cancle = ownerDAO.cancleInfo(con, cancleNo);

		return cancle;
		
	}

	public int totalStlCount(int accomoNo) {

		Connection con = getConnection();

		int totalCount = ownerDAO.totalStlCount(con, accomoNo);

		close(con);
		
		return totalCount;
		
	}

	public List<SettlementDTO> monthStlList(PageInfoDTO pageInfo, int accomoNo) {
		
		List<SettlementDTO> stlList = new ArrayList<SettlementDTO>();

		Connection con = getConnection();

		stlList = ownerDAO.monthStlList(con, pageInfo, accomoNo);

		return stlList;
	}

	public int totalPerCount(int accomoNo, String yn) {
		
		Connection con = getConnection();

		int totalCount = ownerDAO.totalPerCount(con, accomoNo, yn);

		close(con);
		
		return totalCount;
	}

	public List<StlPerDTO> prePerList(int accomoNo, PageInfoDTO pageInfo) {
		
		List<StlPerDTO> prePerList = new ArrayList<StlPerDTO>();

		Connection con = getConnection();

		prePerList = ownerDAO.prePerList(con, pageInfo, accomoNo);

		return prePerList;
		
	}

	public int stlPerCount(int accomoNo) {
		
		Connection con = getConnection();

		int totalCount = ownerDAO.stlPerCount(con, accomoNo);

		close(con);
		
		return totalCount;
		
	}

	public List<StlPerDTO> stlPerList(int accomoNo, PageInfoDTO pageInfo3) {
		
		List<StlPerDTO> stlPerList = new ArrayList<StlPerDTO>();

		Connection con = getConnection();

		stlPerList = ownerDAO.stlPerList(con, pageInfo3, accomoNo);

		return stlPerList;
		
		
	}

	public int insertStl(int accomoNo) {
		
		Connection con = getConnection();

		int result = ownerDAO.insertStl(con, accomoNo);

		if(result >= 1) {
			commit(con);
		}
		close(con);
		
		return result;

		
	}

	public List<Integer> salesNoList(int accomoNo) {
		
		List<Integer> salesNoList = new ArrayList<Integer>();

		Connection con = getConnection();

		salesNoList = ownerDAO.salesNoList(con, accomoNo);

		return salesNoList;
		
	}

	public int updateSalesHistory(int accomoNo) {
		
		Connection con = getConnection();

		int result = ownerDAO.updateSalesHistory(con, accomoNo);

		if(result >= 1) {
			commit(con);
		}
		close(con);
		
		return result;
	}

	public int insertStlHistory(List<Integer> salesNoList) {
		
		Connection con = getConnection();

		int result = ownerDAO.insertStlHistory(con, salesNoList);

		if(result >= 1) {
			commit(con);
		}
		close(con);
		
		return result;
	}

	public TaxBillDTO taxBillInfo(int stlNo) {
		
		TaxBillDTO taxBill = new TaxBillDTO();

		Connection con = getConnection();

		taxBill = ownerDAO.taxBillInfo(con, stlNo);

		return taxBill;
	}

	public List<RequestDTO> requestList(PageInfoDTO pageInfo, String stlStatus) {
		
		List<RequestDTO> requestList = new ArrayList<RequestDTO>();

		Connection con = getConnection();

		requestList = ownerDAO.requestList(con, pageInfo ,stlStatus);

		return requestList;
		
	}

	public int totalRequestCount(String stlStatus) {
		
		Connection con = getConnection();

		int count = ownerDAO.totalRequestCount(con, stlStatus);

		close(con);
		
		return count;
		
	}

	public int totalTaxRequestCount(String taxStatus) {
		
		Connection con = getConnection();

		int count = ownerDAO.totalTaxRequestCount(con, taxStatus);

		close(con);
		
		return count;
		
	}

	public List<RequestDTO> requestTaxList(PageInfoDTO pageInfo, String taxStatus) {
		
		List<RequestDTO> requestTaxList = new ArrayList<RequestDTO>();

		Connection con = getConnection();

		requestTaxList = ownerDAO.requestTaxList(con, pageInfo ,taxStatus);

		return requestTaxList;
		
	}

	public int updateRequestList(int accomoNo) {
		
		Connection con = getConnection();

		int result = ownerDAO.updateRequestList(con, accomoNo);

		if(result >= 1) {
			commit(con);
		}
		close(con);
		
		return result;
		
	}

	public int updateTaxRequest(int requestNo) {
		
		Connection con = getConnection();

		int result = ownerDAO.updateTaxRequest(con, requestNo);

		if(result >= 1) {
			commit(con);
		}
		close(con);
		
		return result;
		
		
	}

	public int insertTaxHistory(int requestNo, String fileName) {
		
		Connection con = getConnection();

		int result = ownerDAO.insertTaxHistory(con, requestNo, fileName);

		if(result >= 1) {
			commit(con);
		}
		close(con);
		
		return result;
		
	}

}

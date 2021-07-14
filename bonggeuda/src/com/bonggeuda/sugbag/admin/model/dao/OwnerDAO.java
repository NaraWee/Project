package com.bonggeuda.sugbag.admin.model.dao;

import java.beans.Statement;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.bonggeuda.sugbag.common.config.ConfigLocation;

import com.bonggeuda.sugbag.admin.common.dto.AttachmentDTO;

import com.bonggeuda.sugbag.model.dto.PageInfoDTO;

import com.bonggeuda.sugbag.admin.owner.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.BMemberDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.admin.owner.model.dto.RoomInfoDTO;
import com.bonggeuda.sugbag.admin.sales.common.SalesCalculator;
import com.bonggeuda.sugbag.admin.sales.model.dto.PaymentDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.RequestDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.SettlementDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.StlPerDTO;
import com.bonggeuda.sugbag.admin.sales.model.dto.TaxBillDTO;

import oracle.net.aso.r;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

public class OwnerDAO {

	Properties prop = null;

	SalesCalculator calc = null;
	
	public OwnerDAO() {
		
		calc = new SalesCalculator();

		try {
			prop = new Properties();

			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/owner-mapper.xml"));

		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public List<OwnerInfoDTO> ownerListSelect(Connection con, PageInfoDTO pageInfo) {

		List<OwnerInfoDTO> ownerList = new ArrayList<OwnerInfoDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectOwnerList");

		OwnerInfoDTO ownerInfo = null;
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {

				ownerInfo = new OwnerInfoDTO();

//				OWNER_NO
//				OWNER_ID
//				OWNER_PWD
//				OWNER_PHONE
//				OWNER_WITHDRAW_YN
//				OWNER_SIGNDATE
//				OWNER_WITHDATE

				ownerInfo.setOwnerNo(rset.getInt("OWNER_NO"));
				ownerInfo.setOwnerId(rset.getString("OWNER_ID"));
				ownerInfo.setPhone(rset.getString("OWNER_PHONE"));
				ownerInfo.setSignDate(rset.getDate("OWNER_SIGNDATE"));
				ownerInfo.setOwnerWithDrawYN(rset.getString("OWNER_WITHDRAW_YN"));
//				ownerInfo.setWithDate(rset.getDate("OWNER_WITHDATE"));

				ownerList.add(ownerInfo);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return ownerList;
	}

	public int selectTotalCount(Connection con) {

		int totalCount = 0;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectMaxNum");

		try {

			pstmt = con.prepareStatement(query);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return totalCount;
	}

	public OwnerInfoDTO ownerSearch(Connection con, String searchValue) {

		OwnerInfoDTO searchOwner = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("ownerSearch");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, searchValue);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				searchOwner = new OwnerInfoDTO();

//				OWNER_NO
//				OWNER_ID
//				OWNER_PWD
//				OWNER_PHONE
//				OWNER_WITHDRAW_YN
//				OWNER_SIGNDATE
//				OWNER_WITHDATE
				searchOwner.setOwnerNo(rset.getInt("OWNER_NO"));
				searchOwner.setOwnerId(rset.getString("OWNER_ID"));
				searchOwner.setPhone(rset.getString("OWNER_PHONE"));
				searchOwner.setSignDate(rset.getDate("OWNER_SIGNDATE"));
				searchOwner.setOwnerWithDrawYN(rset.getString("OWNER_WITHDRAW_YN"));
//				ownerInfo.setWithDate(rset.getDate("OWNER_WITHDATE"));

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return searchOwner;
	}

	public List<AccomoInfoDTO> ownerDetailInfo(Connection con, int ownerNo) {

		List<AccomoInfoDTO> accomoList = new ArrayList<AccomoInfoDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		AccomoInfoDTO accomoInfo = null;

		String query = prop.getProperty("selectOwnerAccomoList");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, ownerNo);
			pstmt.setInt(2, ownerNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				accomoInfo = new AccomoInfoDTO();
				
				accomoInfo.setPhone(rset.getString("OWNER_PHONE"));
				accomoInfo.setOwnerEmail(rset.getString("OWNER_ID"));
				accomoInfo.setAccomoName(rset.getString("ACCOMO_NAME"));
				accomoInfo.setAccomoNo(rset.getInt("ACCOMO_NO"));
				accomoInfo.setAccomoType(rset.getString("ACCOMO_TYPE"));
				accomoInfo.setAddress(rset.getString("ACCOMO_ADDRESS"));
				accomoInfo.setCeoName(rset.getString("CEO_NAME"));
				accomoInfo.setCheckIn(rset.getString("CHECK_IN"));
				accomoInfo.setCheckOut(rset.getString("CHECK_OUT"));
				accomoInfo.setFacility(rset.getString("ACCOMO_FACILITY"));
				accomoInfo.setEmail(rset.getString("ACCOMO_EMAIL"));
				accomoInfo.setHomePage(rset.getString("ACCOMO_HOMEPAGE"));
				accomoInfo.setNear(rset.getString("ACCOMO_NEAR"));
				accomoInfo.setOwnerNo(rset.getInt("OWNER_NO"));
				accomoInfo.setParking(rset.getString("ACCOMO_PARKING"));
				accomoInfo.setPath(rset.getString("ACCOMO_PATH"));
				accomoInfo.setPeakEndDate(rset.getDate("PEAK_DATE_END"));
				accomoInfo.setPeakStartDate(rset.getDate("PEAK_DATE_START"));
				accomoInfo.setRegistrationNo(rset.getString("REGISTRATION_NO"));
				accomoInfo.setRule(rset.getString("ACCOMO_RULE"));

				accomoList.add(accomoInfo);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}

		return accomoList;
	}

	public int rmCountSelect(Connection con, String yn) {

		int totalYNCount = 0;
		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("rmTotalCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, yn);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalYNCount = rset.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return totalYNCount;
	}

	public Map<String, Object> accomoRMList(Connection con, String yn) {

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;

		ResultSet rset = null;
		ResultSet rset2 = null;

		List<AccomoInfoDTO> accomoRmList = new ArrayList<AccomoInfoDTO>();
		List<RoomInfoDTO> roomRmList = new ArrayList<RoomInfoDTO>();

		Map<String, Object> totalRmMap = new HashMap<String, Object>();

		String query = prop.getProperty("accomoRmList");
		String query2 = prop.getProperty("roomRmList");

		AccomoInfoDTO rmAccomoInfo = null;
		RoomInfoDTO rmRoomInfo = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt2 = con.prepareStatement(query2);

			pstmt.setString(1, yn);
			pstmt2.setString(1, yn);

			rset = pstmt.executeQuery();
			rset2 = pstmt2.executeQuery();

			while (rset.next()) {
				rmAccomoInfo = new AccomoInfoDTO();

				rmAccomoInfo.setRequestNo(rset.getInt("REQUEST_NO"));

				rmAccomoInfo.setAccomoName(rset.getString("RM_ACCOMO_NAME"));
				rmAccomoInfo.setAccomoNo(rset.getInt("RM_ACCOMO_NO"));
				rmAccomoInfo.setAccomoType(rset.getString("RM_ACCOMO_TYPE"));
				rmAccomoInfo.setAddress(rset.getString("ACCOMO_ADDRESS"));
				rmAccomoInfo.setCeoName(rset.getString("RM_CEO_NAME"));
				rmAccomoInfo.setCheckIn(rset.getString("CHECK_IN"));
				rmAccomoInfo.setCheckOut(rset.getString("CHECK_OUT"));
				rmAccomoInfo.setFacility(rset.getString("ACCOMO_FACILITY"));
				rmAccomoInfo.setEmail(rset.getString("ACCOMO_EMAIL"));
				rmAccomoInfo.setHomePage(rset.getString("ACCOMO_HOMEPAGE"));
				rmAccomoInfo.setNear(rset.getString("ACCOMO_NEAR"));
				rmAccomoInfo.setOwnerNo(rset.getInt("OWNER_NO"));
				rmAccomoInfo.setParking(rset.getString("ACCOMO_PARKING"));
				rmAccomoInfo.setPath(rset.getString("ACCOMO_PATH"));
				rmAccomoInfo.setPeakEndDate(rset.getDate("PEAK_DATE_END"));
				rmAccomoInfo.setPeakStartDate(rset.getDate("PEAK_DATE_START"));
				rmAccomoInfo.setRegistrationNo(rset.getString("RM_REGISTRATION_NO"));
				rmAccomoInfo.setRule(rset.getString("ACCOMO_RULE"));

				rmAccomoInfo.setRmType(rset.getNString("RM_TYPE"));
				rmAccomoInfo.setApprovalYn(rset.getNString("APPROVAL_YN"));

				accomoRmList.add(rmAccomoInfo);

			}

			while (rset2.next()) {
				rmRoomInfo = new RoomInfoDTO();

				rmRoomInfo.setRequestNo(rset2.getInt("REQUEST_NO"));
				rmRoomInfo.setRmType(rset2.getNString("RM_TYPE"));
				rmRoomInfo.setAccomoNo(rset2.getInt("ACCOMO_NO_RM"));
				rmRoomInfo.setRoomFee(rset2.getInt("ROOM_FEE_RM"));
				rmRoomInfo.setRoomIntro(rset2.getString("ROOM_INTRO_RM"));
				rmRoomInfo.setRoomMax(rset2.getInt("ROOM_MAX_RM"));
				rmRoomInfo.setRoomName(rset2.getString("ROOM_NAME_RM"));
				rmRoomInfo.setRoomNo(rset2.getInt("ROOM_NO_RM"));
				rmRoomInfo.setRoomVisibleYn(rset2.getString("ROOM_VISIBLE_YN_RM"));
				rmRoomInfo.setEnAccomoNo(rset2.getInt("EN_ACCOMO_NO"));
				rmRoomInfo.setApprovalYn(rset2.getNString("APPROVAL_YN"));
				rmRoomInfo.setPeakFee(rset2.getInt("PEAK_FEE"));

				roomRmList.add(rmRoomInfo);

			}
			totalRmMap.put("accomoRmList", accomoRmList);
			totalRmMap.put("roomRmList", roomRmList);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return totalRmMap;
	}

	public AccomoInfoDTO rmAccomoInfo(Connection con, int requestNo) {

		AccomoInfoDTO accomoDetailInfo = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("rmAccomoInfo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestNo);

			rset = pstmt.executeQuery();

			
			if (rset.next()) {
				accomoDetailInfo = new AccomoInfoDTO();
				accomoDetailInfo.setRequestNo(rset.getInt("REQUEST_NO"));

				accomoDetailInfo.setAccomoName(rset.getString("RM_ACCOMO_NAME"));
				accomoDetailInfo.setAccomoNo(rset.getInt("RM_ACCOMO_NO"));
				accomoDetailInfo.setAccomoType(rset.getString("RM_ACCOMO_TYPE"));
				accomoDetailInfo.setAddress(rset.getString("ACCOMO_ADDRESS"));
				accomoDetailInfo.setCeoName(rset.getString("RM_CEO_NAME"));
				accomoDetailInfo.setCheckIn(rset.getString("CHECK_IN"));
				accomoDetailInfo.setCheckOut(rset.getString("CHECK_OUT"));
				accomoDetailInfo.setFacility(rset.getString("ACCOMO_FACILITY"));
				accomoDetailInfo.setEmail(rset.getString("ACCOMO_EMAIL"));
				accomoDetailInfo.setHomePage(rset.getString("ACCOMO_HOMEPAGE"));
				accomoDetailInfo.setNear(rset.getString("ACCOMO_NEAR"));
				accomoDetailInfo.setOwnerNo(rset.getInt("OWNER_NO"));
				accomoDetailInfo.setParking(rset.getString("ACCOMO_PARKING"));
				accomoDetailInfo.setPath(rset.getString("ACCOMO_PATH"));
				accomoDetailInfo.setPeakEndDate(rset.getDate("PEAK_DATE_END"));
				accomoDetailInfo.setPeakStartDate(rset.getDate("PEAK_DATE_START"));
				accomoDetailInfo.setRegistrationNo(rset.getString("RM_REGISTRATION_NO"));
				accomoDetailInfo.setRule(rset.getString("ACCOMO_RULE"));

				accomoDetailInfo.setRmType(rset.getString("RM_TYPE"));
				accomoDetailInfo.setApprovalYn(rset.getString("APPROVAL_YN"));

				AttachmentDTO att = new AttachmentDTO();
				att.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));
				accomoDetailInfo.setAttachment(att);

			} else {
				
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}
		return accomoDetailInfo;
	}

	public RoomInfoDTO rmRoomInfo(Connection con, int requestNo) {

		RoomInfoDTO rmRoomInfo = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("rmRoomInfo");
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, requestNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				rmRoomInfo = new RoomInfoDTO();

				rmRoomInfo.setRequestNo(rset.getInt("REQUEST_NO"));
				rmRoomInfo.setRmType(rset.getString("RM_TYPE"));
				rmRoomInfo.setAccomoNo(rset.getInt("ACCOMO_NO_RM"));
				rmRoomInfo.setRoomFee(rset.getInt("ROOM_FEE_RM"));
				rmRoomInfo.setRoomIntro(rset.getString("ROOM_INTRO_RM"));
				rmRoomInfo.setRoomMax(rset.getInt("ROOM_MAX_RM"));
				rmRoomInfo.setRoomName(rset.getString("ROOM_NAME_RM"));
				rmRoomInfo.setRoomNo(rset.getInt("ROOM_NO_RM"));
				rmRoomInfo.setRoomVisibleYn(rset.getString("ROOM_VISIBLE_YN_RM"));
				rmRoomInfo.setPeakFee(rset.getInt("PEAK_FEE"));
				rmRoomInfo.setApprovalYn(rset.getString("APPROVAL_YN"));

				AttachmentDTO att = new AttachmentDTO();

				att.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));

				rmRoomInfo.setAttachment(att);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rmRoomInfo;
	}

	public Map<String, Object> accomoInfoSelect(Connection con, int accomoNo) {

		Map<String, Object> accomoMap = new HashMap<String, Object>();

		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;

		ResultSet rset1 = null;
		ResultSet rset2 = null;

		AttachmentDTO attachment = null;

		AccomoInfoDTO accomo = null;

		RoomInfoDTO room = null;

		List<RoomInfoDTO> roomList = new ArrayList<RoomInfoDTO>();

		String query1 = prop.getProperty("selectAccomo");

		String query2 = prop.getProperty("selectRoom");

		try {
			pstmt1 = con.prepareStatement(query1);
			pstmt1.setInt(1, accomoNo);
			pstmt1.setInt(2, 3);
			rset1 = pstmt1.executeQuery();

			pstmt2 = con.prepareStatement(query2);
			pstmt2.setInt(1, accomoNo);
			pstmt2.setInt(2, 4);
			rset2 = pstmt2.executeQuery();

			while (rset1.next()) {
				
				accomo = new AccomoInfoDTO();

				attachment = new AttachmentDTO();
				accomo.setAccomoNo(rset1.getInt("ACCOMO_NO"));
				accomo.setOwnerNo(rset1.getInt("OWNER_NO"));
				accomo.setAccomoName(rset1.getString("ACCOMO_NAME"));
				accomo.setCeoName(rset1.getString("CEO_NAME"));
				accomo.setAccomoType(rset1.getString("ACCOMO_TYPE"));
				accomo.setRegistrationNo(rset1.getString("REGISTRATION_NO"));
				accomo.setAddress(rset1.getString("ACCOMO_ADDRESS"));
				accomo.setEmail(rset1.getString("ACCOMO_EMAIL"));
				accomo.setHomePage(rset1.getString("ACCOMO_HOMEPAGE"));
				accomo.setFacility(rset1.getString("ACCOMO_FACILITY"));
				accomo.setPath(rset1.getString("ACCOMO_PATH"));
				accomo.setNear(rset1.getString("ACCOMO_NEAR"));
				accomo.setRule(rset1.getString("ACCOMO_RULE"));
				accomo.setParking(rset1.getString("ACCOMO_PARKING"));
				accomo.setCheckIn(rset1.getString("CHECK_IN"));
				accomo.setCheckOut(rset1.getString("CHECK_OUT"));
				accomo.setPeakStartDate(rset1.getDate("PEAK_DATE_START"));
				accomo.setPeakEndDate(rset1.getDate("PEAK_DATE_END"));

				attachment.setThumbnailPath(rset1.getString("THUMBNAIL_PATH"));
				accomo.setAttachment(attachment);
			}

			while (rset2.next()) {
				room = new RoomInfoDTO();
				attachment = new AttachmentDTO();

				room.setRoomNo(rset2.getInt("ROOM_NO"));
				room.setAccomoNo(rset2.getInt("ACCOMO_NO"));
				room.setRoomName(rset2.getString("ROOM_NAME"));
				room.setRoomMax(rset2.getInt("ROOM_MAX"));
				room.setRoomIntro(rset2.getString("ROOM_INTRO"));
				room.setRoomFee(rset2.getInt("ROOM_FEE"));
				room.setRoomVisibleYn(rset2.getString("ROOM_VISIBLE_YN"));
				room.setPeakFee(rset2.getInt("PEAK_FEE"));

				attachment.setThumbnailPath(rset2.getString("THUMBNAIL_PATH"));

				room.setAttachment(attachment);

				roomList.add(room);
			}
			

			accomoMap.put("roomList", roomList);
			accomoMap.put("accomo", accomo);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt1);
			close(rset1);
			close(pstmt2);
			close(rset2);
		}

		return accomoMap;
	}

	public Map<String, Object> enInfoSelect(Connection con, int requestNo) {

		Map<String, Object> enMap = new HashMap<String, Object>();

		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;

		ResultSet rset1 = null;
		ResultSet rset2 = null;

		AttachmentDTO attachment = null;

		AccomoInfoDTO rmAccomoInfo = null;

		RoomInfoDTO rmRoomInfo = null;

		List<RoomInfoDTO> rmRoomList = new ArrayList<RoomInfoDTO>();

		String query1 = prop.getProperty("selectEnAccomoInfo");
		String query2 = prop.getProperty("selectEnRoomInfo");

		try {
			pstmt1 = con.prepareStatement(query1);
			pstmt1.setInt(1, requestNo);
			rset1 = pstmt1.executeQuery();

			pstmt2 = con.prepareStatement(query2);
			pstmt2.setInt(1, requestNo);
			rset2 = pstmt2.executeQuery();

			while (rset1.next()) {
				attachment = new AttachmentDTO();
				rmAccomoInfo = new AccomoInfoDTO();

				rmAccomoInfo.setRequestNo(rset1.getInt("REQUEST_NO"));

				rmAccomoInfo.setAccomoName(rset1.getString("RM_ACCOMO_NAME"));
				rmAccomoInfo.setAccomoNo(rset1.getInt("RM_ACCOMO_NO"));
				rmAccomoInfo.setAccomoType(rset1.getString("RM_ACCOMO_TYPE"));
				rmAccomoInfo.setAddress(rset1.getString("ACCOMO_ADDRESS"));
				rmAccomoInfo.setCeoName(rset1.getString("RM_CEO_NAME"));
				rmAccomoInfo.setCheckIn(rset1.getString("CHECK_IN"));
				rmAccomoInfo.setCheckOut(rset1.getString("CHECK_OUT"));
				rmAccomoInfo.setFacility(rset1.getString("ACCOMO_FACILITY"));
				rmAccomoInfo.setEmail(rset1.getString("ACCOMO_EMAIL"));
				rmAccomoInfo.setHomePage(rset1.getString("ACCOMO_HOMEPAGE"));
				rmAccomoInfo.setNear(rset1.getString("ACCOMO_NEAR"));
				rmAccomoInfo.setOwnerNo(rset1.getInt("OWNER_NO"));
				rmAccomoInfo.setParking(rset1.getString("ACCOMO_PARKING"));
				rmAccomoInfo.setPath(rset1.getString("ACCOMO_PATH"));
				rmAccomoInfo.setPeakEndDate(rset1.getDate("PEAK_DATE_END"));
				rmAccomoInfo.setPeakStartDate(rset1.getDate("PEAK_DATE_START"));
				rmAccomoInfo.setRegistrationNo(rset1.getString("RM_REGISTRATION_NO"));
				rmAccomoInfo.setRule(rset1.getString("ACCOMO_RULE"));
				rmAccomoInfo.setEnAccomoNo(rset1.getInt("EN_ACCOMO_NO"));

				rmAccomoInfo.setRmType(rset1.getNString("RM_TYPE"));
				rmAccomoInfo.setApprovalYn(rset1.getNString("APPROVAL_YN"));

				attachment.setThumbnailPath(rset1.getString("THUMBNAIL_PATH"));

				rmAccomoInfo.setAttachment(attachment);

			}

			while (rset2.next()) {
				rmRoomInfo = new RoomInfoDTO();
				attachment = new AttachmentDTO();

				rmRoomInfo.setRequestNo(rset2.getInt("REQUEST_NO"));
				rmRoomInfo.setRmType(rset2.getNString("RM_TYPE"));
				rmRoomInfo.setAccomoNo(rset2.getInt("ACCOMO_NO_RM"));
				rmRoomInfo.setRoomFee(rset2.getInt("ROOM_FEE_RM"));
				rmRoomInfo.setRoomIntro(rset2.getString("ROOM_INTRO_RM"));
				rmRoomInfo.setRoomMax(rset2.getInt("ROOM_MAX_RM"));
				rmRoomInfo.setRoomName(rset2.getString("ROOM_NAME_RM"));
				rmRoomInfo.setRoomNo(rset2.getInt("ROOM_NO_RM"));
				rmRoomInfo.setRoomVisibleYn(rset2.getString("ROOM_VISIBLE_YN_RM"));
				rmRoomInfo.setEnAccomoNo(rset2.getInt("EN_ACCOMO_NO"));
				rmRoomInfo.setApprovalYn(rset2.getNString("APPROVAL_YN"));
				rmRoomInfo.setPeakFee(rset2.getInt("PEAK_FEE"));

				attachment.setThumbnailPath(rset2.getString("THUMBNAIL_PATH"));

				rmRoomInfo.setAttachment(attachment);

				rmRoomList.add(rmRoomInfo);
				
			}

			enMap.put("roomList", rmRoomList);
			enMap.put("accomo", rmAccomoInfo);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt1);
			close(rset1);
			close(pstmt2);
			close(rset2);
		}

		return enMap;
	}

	public int accomoInsert(Connection con, AccomoInfoDTO accomo, List<AttachmentDTO> attList) {

		int result = 0;
		int result2 = 0;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		java.sql.Statement stmt = null;
		ResultSet rset = null;

		String query3 = prop.getProperty("selectAccomoMaxNum");
		String query2 = prop.getProperty("insertAttach");
		String query = prop.getProperty("insertAccomo");

		try {

			pstmt = con.prepareStatement(query);
			pstmt2 = con.prepareStatement(query2);

			pstmt.setInt(1, accomo.getOwnerNo());
			pstmt.setString(2, accomo.getAccomoName());
			pstmt.setString(3, accomo.getCeoName());
			pstmt.setString(4, accomo.getAccomoType());
			pstmt.setString(5, accomo.getRegistrationNo());
			pstmt.setString(6, accomo.getAddress());
			pstmt.setString(7, accomo.getEmail());
			pstmt.setString(8, accomo.getHomePage());
			pstmt.setString(9, accomo.getFacility());
			pstmt.setString(10, accomo.getPath());
			pstmt.setString(11, accomo.getNear());
			pstmt.setString(12, accomo.getRule());
			pstmt.setString(13, accomo.getParking());
			pstmt.setString(14, accomo.getCheckIn());
			pstmt.setString(15, accomo.getCheckOut());
			pstmt.setDate(16, accomo.getPeakStartDate());
			pstmt.setDate(17, accomo.getPeakEndDate());
			pstmt.setString(18, "Y");

			result = pstmt.executeUpdate();

			if (result >= 1) {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query3);
				int maxNum = 0;
				if (rset.next()) {
					maxNum = rset.getInt(1);
				}

				pstmt2.setInt(1, 3);
				pstmt2.setString(2, attList.get(0).getOriginName());
				pstmt2.setString(3, attList.get(0).getSavedName());
				pstmt2.setString(4, attList.get(0).getSavePath());
				pstmt2.setString(5, attList.get(0).getFileType());
				pstmt2.setString(6, attList.get(0).getThumbnailPath());
				pstmt2.setString(7, attList.get(0).getStatus());
				pstmt2.setInt(8, maxNum);

				result2 = pstmt2.executeUpdate();

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result + result2;
	}

	public int roomInsert(Connection con, List<RoomInfoDTO> roomList, List<AttachmentDTO> attList) {

		int result = 0;
		int result2 = 0;

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;

		ResultSet rset = null;
		java.sql.Statement stmt = null;

		String query3 = prop.getProperty("selectRoomMaxNum");
		String query2 = prop.getProperty("insertAttach");
		String query = prop.getProperty("insertRoom");
		int count = 0;
		try {

			for (RoomInfoDTO room : roomList) {
				pstmt = con.prepareStatement(query);

				pstmt.setString(1, room.getRoomName());
				pstmt.setInt(2, room.getRoomMax());
				pstmt.setString(3, room.getRoomIntro());
				pstmt.setInt(4, room.getRoomFee());
				pstmt.setString(5, room.getRoomVisibleYn());
				pstmt.setInt(6, room.getPeakFee());

				result += pstmt.executeUpdate();

				if (result >= 1) {
					count++;
				}

				if (count >= 1) {
					stmt = con.createStatement();
					rset = stmt.executeQuery(query3);
					int maxNum = 0;
					
					if (rset.next()) {
						maxNum = rset.getInt(1);
						
					}
					pstmt2 = con.prepareStatement(query2);

					pstmt2.setInt(1, 4);
					pstmt2.setString(2, attList.get(count - 1).getOriginName());
					pstmt2.setString(3, attList.get(count - 1).getSavedName());
					pstmt2.setString(4, attList.get(count - 1).getSavePath());
					pstmt2.setString(5, attList.get(count - 1).getFileType());
					pstmt2.setString(6, attList.get(count - 1).getThumbnailPath());
					pstmt2.setString(7, attList.get(count - 1).getStatus());
					pstmt2.setInt(8, maxNum);

					result2 += pstmt2.executeUpdate();
				}

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			close(pstmt2);

		}

		return result + result2;
	}

	public List<AttachmentDTO> selectAttachment(Connection con, int requestNo, String ar) {

		List<AttachmentDTO> attList = new ArrayList<>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		AttachmentDTO att = null;
		String query = "";

		if (ar.equals("a")) {
			query = prop.getProperty("selectAccomoAttachment");

		} else if (ar.equals("r")) {
			query = prop.getProperty("selectRoomAttachment");

		}
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, requestNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				att = new AttachmentDTO();

				att.setAttachNo(rset.getInt("ATTACHMENT_NO"));
				att.setCategoryNo(rset.getInt("CATEGORY_NO"));
				att.setFileType(rset.getString("FILE_TYPE"));
				att.setOriginName(rset.getString("ORIGIN_NAME"));
				att.setRefNo(rset.getInt("REF_NO"));
				att.setSavedName(rset.getString("SAVE_NAME"));
				att.setSavePath(rset.getString("SAVE_PATH"));
				att.setStatus(rset.getString("ATTACHMENT_STATUS"));
				att.setThumbnailPath(rset.getString("THUMBNAIL_PATH"));
				
				attList.add(att);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return attList;
	}

	public int updateRmList(Connection con, Map<String, Object> totalInfoMap) {

		int updateResult = 0;

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;

		AccomoInfoDTO accomo = (AccomoInfoDTO) totalInfoMap.get("accomo");
		List<RoomInfoDTO> roomList = (List<RoomInfoDTO>) totalInfoMap.get("roomList");

		String query = prop.getProperty("updateRmAccomo");

		try {
			if (accomo != null) {
				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, accomo.getRequestNo());

				updateResult += pstmt.executeUpdate();

			}

			if (roomList != null) {
				for (RoomInfoDTO room : roomList) {
					String query2 = prop.getProperty("updateRmRoom");
					pstmt2 = con.prepareStatement(query2);
					pstmt2.setInt(1, room.getRequestNo());

					updateResult += pstmt2.executeUpdate();

				}
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return updateResult;
	}

	public int insertHistory(Connection con, Map<String, Object> enMap, String cancleReason) {

		int result = 0;

		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertRmHistory");

		AccomoInfoDTO accomo = (AccomoInfoDTO) enMap.get("accomo");
		List<RoomInfoDTO> roomList = (List<RoomInfoDTO>) enMap.get("roomList");

		try {
//			등록일 때
			if (cancleReason.equals("")) {

				if (accomo != null) {

					pstmt = con.prepareStatement(query);

					pstmt.setString(1, "검열 완료, 등록/수정 처리");
					pstmt.setString(2, "Y");
					pstmt.setInt(3, accomo.getRequestNo());
					pstmt.setNull(4, Types.NUMERIC);

					result += pstmt.executeUpdate();
				}

				if (roomList != null) {

					for (RoomInfoDTO room : roomList) {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, "검열 완료, 등록/수정 처리");
						pstmt.setString(2, "Y");
						pstmt.setNull(3, Types.NUMERIC);
						pstmt.setInt(4, room.getRequestNo());

						result += pstmt.executeUpdate();
					}

				}
//				취소 일때
			} else {

				if (accomo != null) {
					pstmt = con.prepareStatement(query);

					pstmt.setString(1, cancleReason);
					pstmt.setString(2, "N");
					pstmt.setInt(3, accomo.getRequestNo());
					pstmt.setNull(4, Types.NUMERIC);

					result += pstmt.executeUpdate();

				}

				if (roomList != null) {

					for (RoomInfoDTO room : roomList) {
						pstmt = con.prepareStatement(query);

						pstmt.setString(1, cancleReason);
						pstmt.setString(2, "N");
						pstmt.setNull(3, Types.NUMERIC);
						pstmt.setInt(4, room.getRequestNo());

						result += pstmt.executeUpdate();
					}

				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	public int updateAccomo(Connection con, AccomoInfoDTO accomo) {

		int result = 0;

		PreparedStatement pstmt = null;

		String query = prop.getProperty("updateAccomo");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, accomo.getOwnerNo());
			pstmt.setString(2, accomo.getAccomoName());
			pstmt.setString(3, accomo.getCeoName());
			pstmt.setString(4, accomo.getAccomoType());
			pstmt.setString(5, accomo.getRegistrationNo());
			pstmt.setString(6, accomo.getAddress());
			pstmt.setString(7, accomo.getEmail());
			pstmt.setString(8, accomo.getHomePage());
			pstmt.setString(9, accomo.getFacility());
			pstmt.setString(10, accomo.getPath());
			pstmt.setString(11, accomo.getNear());
			pstmt.setString(12, accomo.getRule());
			pstmt.setString(13, accomo.getParking());
			pstmt.setString(14, accomo.getCheckIn());
			pstmt.setString(15, accomo.getCheckOut());
			pstmt.setDate(16, accomo.getPeakStartDate());
			pstmt.setDate(17, accomo.getPeakEndDate());
			pstmt.setInt(18, accomo.getAccomoNo());
//			pstmt.setString(18, accomo.getVisibleYn());

			result += pstmt.executeUpdate();
			result += updateImage(con, accomo.getAttachment().getThumbnailPath(), accomo.getAccomoNo(), 3);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateAccomo(Connection con, List<RoomInfoDTO> roomList) {

		int result = 0;

		PreparedStatement pstmt = null;

		String query = prop.getProperty("updateRoom");

		RoomInfoDTO room = roomList.get(0);

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, room.getAccomoNo());
			pstmt.setString(2, room.getRoomName());
			pstmt.setInt(3, room.getRoomMax());
			pstmt.setString(4, room.getRoomIntro());
			pstmt.setInt(5, room.getRoomFee());
			pstmt.setString(6, room.getRoomVisibleYn());
			pstmt.setInt(7, room.getPeakFee());
			pstmt.setInt(8, room.getRoomNo());

			result += pstmt.executeUpdate();
			result += updateImage(con, room.getAttachment().getThumbnailPath(), room.getRoomNo(), 4);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int updateImage(Connection con, String image, int no, int categoryNo) {

		int result = 0;

		String query = prop.getProperty("updateImage");

		PreparedStatement pstmt = null;

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, image);
			pstmt.setInt(2, no);
			pstmt.setInt(3, categoryNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
			try {
				con.commit();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return result;

	}

	public List<BMemberDTO> bListSelect(Connection con, PageInfoDTO pageInfo) {

		List<BMemberDTO> bList = new ArrayList<BMemberDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("bListSelect");

		BMemberDTO bMember = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "owner");
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				bMember = new BMemberDTO();

				bMember.setRowNum(rset.getInt(1));
				bMember.setbListNo(rset.getInt("BLIST_NO"));
				bMember.setbReason(rset.getString("BLIST_REASON"));
				bMember.setEnrollDate(rset.getDate("ENROLL_DATE"));
				bMember.setMemberNo(rset.getInt("MEMBER_NO"));
				bMember.setMemberType(rset.getString("WRITER_TYPE"));

				bList.add(bMember);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return bList;
	}

	public int totalBlistCount(Connection con) {

		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("totalBlistCount");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, "owner");

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return totalCount;
	}

	public int totalPayCount(Connection con) {

		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("totalPayCount");

		try {
			pstmt = con.prepareStatement(query);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return totalCount;

	}

	public List<PaymentDTO> payList(Connection con, PageInfoDTO pageInfo) {

		List<PaymentDTO> payList = new ArrayList<PaymentDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("payListSelect");

		PaymentDTO pay = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				pay = new PaymentDTO();

				pay.setPaymentNo(rset.getInt("PAYMENT_NO"));
				pay.setBookNo(rset.getInt("BOOK_NO"));
				pay.setCouponYn(rset.getString("COUPON_YN"));
				pay.setDiscount(rset.getInt("DISCOUNT"));
				pay.setPaymentAmount(rset.getInt("PAYMENT_AMOUNT"));
				pay.setPaymentMethod(rset.getString("PAYMENT_METHOD"));
				pay.setPaymentTime(rset.getDate("PAYMENT_TIME"));
				pay.setPointYn(rset.getString("POINT_YN"));

				pay.setUserName(rset.getString("BOOK_USER_NAME"));
				pay.setUserNo(rset.getInt("USER_NO"));

				pay.setRoomNo(rset.getInt("ROOM_NO"));
				pay.setRoomName(rset.getString("ROOM_NAME"));

				pay.setAccomoName(rset.getString("ACCOMO_NAME"));
				pay.setAccomoNo(rset.getInt("ACCOMO_NO"));

				pay.setPhone(rset.getString("BOOK_PHONE"));

				payList.add(pay);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return payList;

	}

	public PaymentDTO payInfo(Connection con, int paymentNo) {

		PaymentDTO pay = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("payDetailInfo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, paymentNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				pay = new PaymentDTO();

				pay.setPaymentNo(rset.getInt("PAYMENT_NO"));
				pay.setBookNo(rset.getInt("BOOK_NO"));
				pay.setCouponYn(rset.getString("COUPON_YN"));
				pay.setDiscount(rset.getInt("DISCOUNT"));
				pay.setPaymentAmount(rset.getInt("PAYMENT_AMOUNT"));
				pay.setPaymentMethod(rset.getString("PAYMENT_METHOD"));
				pay.setPaymentTime(rset.getDate("PAYMENT_TIME"));
				pay.setPointYn(rset.getString("POINT_YN"));

				pay.setUserName(rset.getString("BOOK_USER_NAME"));
				pay.setUserNo(rset.getInt("USER_NO"));

				pay.setRoomNo(rset.getInt("ROOM_NO"));
				pay.setRoomName(rset.getString("ROOM_NAME"));

				pay.setAccomoName(rset.getString("ACCOMO_NAME"));
				pay.setAccomoNo(rset.getInt("ACCOMO_NO"));

				pay.setPhone(rset.getString("BOOK_PHONE"));

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return pay;

	}

	public int totalCancleCount(Connection con, String refundStatus) {

		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("totalCancleCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, refundStatus);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return totalCount;
	}

	public List<PaymentDTO> cancleList(Connection con, PageInfoDTO pageInfo, String refundStatus) {

		List<PaymentDTO> cancleList = new ArrayList<PaymentDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("cancleList");

		PaymentDTO pay = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, refundStatus);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				pay = new PaymentDTO();

				pay.setPaymentNo(rset.getInt("PAYMENT_NO"));
				pay.setBookNo(rset.getInt("BOOK_NO"));
				pay.setCouponYn(rset.getString("COUPON_YN"));
				pay.setDiscount(rset.getInt("DISCOUNT"));
				pay.setPaymentAmount(rset.getInt("PAYMENT_AMOUNT"));
				pay.setPaymentMethod(rset.getString("PAYMENT_METHOD"));
				pay.setPaymentTime(rset.getDate("PAYMENT_TIME"));
				pay.setPointYn(rset.getString("POINT_YN"));

				pay.setUserName(rset.getString("BOOK_USER_NAME"));
				pay.setUserNo(rset.getInt("USER_NO"));

				pay.setRoomNo(rset.getInt("ROOM_NO"));
				pay.setRoomName(rset.getString("ROOM_NAME"));

				pay.setAccomoName(rset.getString("ACCOMO_NAME"));
				pay.setAccomoNo(rset.getInt("ACCOMO_NO"));

				pay.setPhone(rset.getString("BOOK_PHONE"));

				pay.setCancleDate(rset.getDate("CANCLE_DATE"));
				pay.setCancleNo(rset.getInt("CANCLE_NO"));
				pay.setCancleReason(rset.getString("REASON_CANCLE"));
				pay.setRefundStatus(rset.getString("REFUND_STATUS"));

				cancleList.add(pay);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return cancleList;

	}

	public PaymentDTO cancleInfo(Connection con, int cancleNo) {

		PaymentDTO pay = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("cancleDetailInfo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cancleNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				pay = new PaymentDTO();

				pay.setPaymentNo(rset.getInt("PAYMENT_NO"));
				pay.setBookNo(rset.getInt("BOOK_NO"));
				pay.setCouponYn(rset.getString("COUPON_YN"));
				pay.setDiscount(rset.getInt("DISCOUNT"));
				pay.setPaymentAmount(rset.getInt("PAYMENT_AMOUNT"));
				pay.setPaymentMethod(rset.getString("PAYMENT_METHOD"));
				pay.setPaymentTime(rset.getDate("PAYMENT_TIME"));
				pay.setPointYn(rset.getString("POINT_YN"));

				pay.setUserName(rset.getString("BOOK_USER_NAME"));
				pay.setUserNo(rset.getInt("USER_NO"));

				pay.setRefundPrice(rset.getInt("CANCLE_AMOUNT"));
				
				pay.setRoomNo(rset.getInt("ROOM_NO"));
				pay.setRoomName(rset.getString("ROOM_NAME"));

				pay.setAccomoName(rset.getString("ACCOMO_NAME"));
				pay.setAccomoNo(rset.getInt("ACCOMO_NO"));

				pay.setPhone(rset.getString("BOOK_PHONE"));

				pay.setCancleDate(rset.getDate("CANCLE_DATE"));
				pay.setCancleNo(rset.getInt("CANCLE_NO"));
				pay.setCancleReason(rset.getString("REASON_CANCLE"));
				pay.setRefundStatus(rset.getString("REFUND_STATUS"));

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return pay;
	}

	public int totalStlCount(Connection con, int accomoNo) {

		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("totalStlCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomoNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return totalCount;
	}

	public List<SettlementDTO> monthStlList(Connection con, PageInfoDTO pageInfo, int accomoNo) {

		SettlementDTO stl = null;

		List<SettlementDTO> stlList = new ArrayList<SettlementDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("monthStlList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomoNo);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				stl = new SettlementDTO();

				stl.setStlNo(rset.getInt("STL_NO"));
				stl.setStlDate(rset.getDate("STL_DATE"));
				stl.setAccomoNo(rset.getInt("ACCOMO_NO"));

				stl.setAccomoName(rset.getString("ACCOMO_NAME"));
				stl.setCeoName(rset.getString("CEO_NAME"));
				stl.setRegistrationNo(rset.getString("REGISTRATION_NO"));
				stl.setPhone(rset.getString("OWNER_PHONE"));
				
				int salePrice = rset.getInt("MONTH_AMOUNT");
				
				stl.setSupplyPrice(calc.getSupplyPrice(salePrice));
				stl.setMonthFee(calc.getFee(salePrice));
				stl.setMonthTaxPrice(calc.getTax(salePrice));
				stl.setFinalStlAmount(calc.getFinalStlPrice(salePrice));
				stl.setMonthAmount(salePrice);
				stl.setPreTaxAmount(calc.getPrice(salePrice));

				stlList.add(stl);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return stlList;

	}

	public int totalPerCount(Connection con, int accomoNo, String yn) {

		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("totalPerCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, yn);
			pstmt.setInt(2, accomoNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return totalCount;
	}

	public List<StlPerDTO> prePerList(Connection con, PageInfoDTO pageInfo, int accomoNo) {

		StlPerDTO prePer = null;

		List<StlPerDTO> prePerList = new ArrayList<StlPerDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("prePerList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomoNo);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				prePer = new StlPerDTO();
				
				prePer.setAccomoNo(rset.getInt("ACCOMO_NO"));
				prePer.setAccomoName(rset.getString("ACCOMO_NAME"));
				prePer.setSaleDate(rset.getDate("SALES_DATE"));
				prePer.setRoomName(rset.getString("ROOM_NAME"));
				
				int salePrice = rset.getInt("SALES_PRICE");
				
				prePer.setSalePrice(salePrice);
				prePer.setFee(calc.getFee(salePrice));
				prePer.setTaxPrice(calc.getTax(salePrice));
				prePer.setFinalStlPrice(calc.getFinalStlPrice(salePrice));
				prePer.setPreTaxPrice(calc.getPrice(salePrice));
				prePer.setSupplyPrice(calc.getSupplyPrice(salePrice));
				
				prePerList.add(prePer);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return prePerList;

	}

	public int stlPerCount(Connection con, int accomoNo) {
		
		int totalCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("stlPerCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomoNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return totalCount;
		
	}

	public List<StlPerDTO> stlPerList(Connection con, PageInfoDTO pageInfo3, int accomoNo) {
		
		StlPerDTO stlPer = null;

		List<StlPerDTO> stlPerList = new ArrayList<StlPerDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("stlPerList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomoNo);
			pstmt.setInt(2, pageInfo3.getStartRow());
			pstmt.setInt(3, pageInfo3.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				stlPer = new StlPerDTO();
				
				stlPer.setRoomName(rset.getString("ROOM_NAME"));
				stlPer.setStlDate(rset.getDate("STL_DATE"));
				stlPer.setSaleDate(rset.getDate("SALES_DATE"));
				
				int salePrice = rset.getInt("SALES_PRICE");
				
				stlPer.setSalePrice(salePrice);
				stlPer.setFee(calc.getFee(salePrice));
				stlPer.setTaxPrice(calc.getTax(salePrice));
				stlPer.setFinalStlPrice(calc.getFinalStlPrice(salePrice));
				stlPer.setPreTaxPrice(calc.getPrice(salePrice));
				stlPer.setSupplyPrice(calc.getSupplyPrice(salePrice));
				
				stlPerList.add(stlPer);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return stlPerList;
		
		
	}

	public int insertStl(Connection con, int accomoNo) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertStl");
		int result = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomoNo);
			pstmt.setInt(2, accomoNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public List<Integer> salesNoList(Connection con, int accomoNo) {
		
		List<Integer> salesNoList = new ArrayList<Integer>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectSalesNo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomoNo);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				
				int saleNo = rset.getInt("SALES_NO");
				
				salesNoList.add(saleNo);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return salesNoList;
		
		
	}

	public int updateSalesHistory(Connection con, int accomoNo) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("updateSalesHistory");
		
		int result = 0;

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, accomoNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

	public int insertStlHistory(Connection con, List<Integer> salesNoList) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertStlHistory");
		
		int result = 0;

		try {

			for(int saleNo : salesNoList) {
				
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, saleNo);
				
				result += pstmt.executeUpdate();
			}
			

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

	public TaxBillDTO taxBillInfo(Connection con, int stlNo) {
		
		TaxBillDTO taxBill = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("taxBillInfo");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, stlNo);
			pstmt.setInt(2, stlNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				taxBill = new TaxBillDTO();
				
				taxBill.setRequestNo(rset.getInt("REQUEST_NO"));
				
				taxBill.setAccomoAddress(rset.getString("ACCOMO_ADDRESS"));
				taxBill.setAccomoName(rset.getString("ACCOMO_NAME"));
				taxBill.setAccomoType(rset.getString("ACCOMO_TYPE"));
				taxBill.setCeoName(rset.getString("CEO_NAME"));
				taxBill.setRegistrationNo(rset.getString("REGISTRATION_NO"));
				taxBill.setStlDate(rset.getDate("STL_DATE"));
				int price = rset.getInt("MONTH_AMOUNT");
				taxBill.setCount(rset.getInt(9));
				
				taxBill.setPrice(calc.getPrice(price));
				taxBill.setTax(calc.getTax(price));
				taxBill.setSupplyPrice(calc.getSupplyPrice(price));
				
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return taxBill;
		
	}

	public List<RequestDTO> requestList(Connection con, PageInfoDTO pageInfo,String stlStatus) {
		
		RequestDTO request = null;

		List<RequestDTO> requestList = new ArrayList<RequestDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("stlRequestList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, stlStatus);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				request = new RequestDTO();
				request.setAccomoName(rset.getString("ACCOMO_NAME"));
				request.setAccomoNo(rset.getInt("ACCOMO_NO"));
				request.setRequestDate(rset.getDate("REQUEST_DATE"));
				request.setRequestNo(rset.getInt("REQUEST_STL_NO"));
				request.setStlYn(rset.getString("STL_YN"));
				
				requestList.add(request);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return requestList;
	}

	public int totalRequestCount(Connection con, String stlStatus) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("stlRequestCount");
		
		int count = 0;
		
		ResultSet rset = null;

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, stlStatus);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
				

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return count;
		
	}

	public int totalTaxRequestCount(Connection con, String taxStatus) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("taxRequestCount");
		
		int count = 0;
		
		ResultSet rset = null;

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, taxStatus);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
				

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return count;
		
	}

	public List<RequestDTO> requestTaxList(Connection con, PageInfoDTO pageInfo, String taxStatus) {
		
		RequestDTO request = null;

		List<RequestDTO> requestList = new ArrayList<RequestDTO>();

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("taxBillList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, taxStatus);
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				request = new RequestDTO();
				request.setAccomoName(rset.getString("ACCOMO_NAME"));
				request.setAccomoNo(rset.getInt("ACCOMO_NO"));
				request.setRequestDate(rset.getDate("REQUEST_DATE"));
				request.setRequestNo(rset.getInt("REQUEST_NO"));
				request.setStlYn(rset.getString("RESPONSE_YN"));
				request.setStlDate(rset.getDate("STL_DATE"));
				
				request.setStlNo(rset.getInt("STL_NO"));
				
				requestList.add(request);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return requestList;
		
	}

	public int updateRequestList(Connection con, int accomoNo) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("updateRequestList");
		
		int result = 0;

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, accomoNo);
				
			result += pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

	public int updateTaxRequest(Connection con, int requestNo) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("updateTaxRequest");
		
		int result = 0;

		try {

			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, requestNo);
				
			result += pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

	public int insertTaxHistory(Connection con, int requestNo, String fileName) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertTaxHistory");
		
		int result = 0;

		try {

			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, requestNo);
			pstmt.setString(2, fileName);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

}

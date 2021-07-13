package com.bonggeuda.sugbag.owner.mypage.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.model.dto.NoticeDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.model.dto.PageInfoDTO;
import com.bonggeuda.sugbag.model.dto.ReportDTO;
import com.bonggeuda.sugbag.model.dto.RequestTaxBillDTO;
import com.bonggeuda.sugbag.model.dto.SettlementDTO;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

public class OwnerMypageDAO {
	
	private Properties prop = new Properties();
	
	public OwnerMypageDAO() {
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION+"owner/mypage/mypage-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public OwnerInfoDTO selectOwner(Connection con, int ownerNo) {
		
		/* 웨어절에 ? 로 하기위해*/
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		OwnerInfoDTO ownerInfoDTO = null;
		
		String query = prop.getProperty("selectOwnerInfo");
		
				
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ownerInfoDTO = new OwnerInfoDTO();
				
				ownerInfoDTO.setOwnerID(rset.getString("OWNER_ID"));
				ownerInfoDTO.setOwnerPwd(rset.getString("OWNER_PWD"));
				ownerInfoDTO.setOwnerPhone(rset.getString("OWNER_PHONE"));
				ownerInfoDTO.setOwnerNo(rset.getInt("OWNER_NO"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			close(con);
		}
		
	
		return ownerInfoDTO;
	}


	public List<ReportDTO> selectReportList(Connection con, PageInfoDTO pageInfo, int ownerNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		List<ReportDTO> selectReprotList = new ArrayList<ReportDTO>();
		ReportDTO reportDTO = new ReportDTO();
		
		String query = prop.getProperty("selectReportList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);//업체번호
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reportDTO = new ReportDTO();
				
				reportDTO.setReportNo(rset.getInt("REPORT_NO"));
				reportDTO.setWriterType(rset.getString("WRITER_TYPE"));
				reportDTO.setReportReason(rset.getString("REPORT_REASON"));
				reportDTO.setMemberNo(rset.getInt("MEMBER_NO"));
				reportDTO.setReportDate(rset.getDate("REPORT_DATE"));
				reportDTO.setReportTitle(rset.getString("REPORT_TITLE"));
				reportDTO.setReportStatus(rset.getString("REPORT_STATUS"));
				reportDTO.setReportedType(rset.getString("REPORTED_TYPE"));
				reportDTO.setReportedNo(rset.getInt("REPORTED_NO"));
				reportDTO.setRowNum(rset.getInt("RNUM"));
				
				selectReprotList.add(reportDTO);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			close(con);
		}
		
		return selectReprotList;
	}

	public ReportDTO selectReportDetail(Connection con, int reportNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ReportDTO reportDTO = new ReportDTO();
		
		String query = prop.getProperty("selctReportDetail");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, reportNo);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				reportDTO = new ReportDTO();
				
				reportDTO.setReportNo(rset.getInt("REPORT_NO"));
				reportDTO.setWriterType(rset.getString("WRITER_TYPE"));
				reportDTO.setReportReason(rset.getString("REPORT_REASON"));
				reportDTO.setMemberNo(rset.getInt("MEMBER_NO"));
				reportDTO.setReportDate(rset.getDate("REPORT_DATE"));
				reportDTO.setReportTitle(rset.getString("REPORT_TITLE"));
				reportDTO.setReportStatus(rset.getString("REPORT_STATUS"));
				reportDTO.setReportedType(rset.getString("REPORTED_TYPE"));
				reportDTO.setReportedNo(rset.getInt("REPORTED_NO"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(rset);
			close(pstmt);
			close(con);
		}

		return reportDTO;
	}


	public String selectRejectReason(int reportNo, Connection con ) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ReportDTO reportDTO = new ReportDTO();
		String rejectReason = "";
		
		String query = prop.getProperty("selectRejectReason");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, reportNo);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				
				rejectReason = rset.getString("REPORT_ANSWER");
			}
		} catch (SQLException e) {

			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
			close(rset);
		}
		
		return rejectReason;
	}


	public int ownerWithdrawUpdateDAO(Connection con, int ownerNo) {
		
		PreparedStatement pstmt = null;

		String query = prop.getProperty("ownerWithdrawUpdate");
		
		int ownerWithdrawUpdate = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, ownerNo);
			
			ownerWithdrawUpdate = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return ownerWithdrawUpdate;
	}

	public List<RequestTaxBillDTO> selectTaxBillListDAO(Connection con, PageInfoDTO pageInfo, int ownerNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		List<RequestTaxBillDTO> selectTaxBillList = new ArrayList<RequestTaxBillDTO>();
		
		RequestTaxBillDTO requestTaxBillDTO = new RequestTaxBillDTO();
		
		String query = prop.getProperty("selectTaxBillList");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);//업체번호
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				
				requestTaxBillDTO = new RequestTaxBillDTO();
				
				requestTaxBillDTO.setRequestNo(rset.getInt("REQUEST_NO"));
				requestTaxBillDTO.setRequestDate(rset.getString("REQUEST_DATE"));
				requestTaxBillDTO.setAccomoNo(rset.getInt("ACCOMO_NO"));
				requestTaxBillDTO.setResponseYn(rset.getString("RESPONSE_YN"));
				requestTaxBillDTO.setStlNo(rset.getInt("STL_NO"));
				requestTaxBillDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				requestTaxBillDTO.setRowNum(rset.getInt("RNUM"));
				
				selectTaxBillList.add(requestTaxBillDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
			close(rset);
		}

		return selectTaxBillList;
	}

	public int insertRequestTaxBillDAO(Connection con, int accomoNo, int stlNo) {
		
		PreparedStatement pstmt = null;

		int result = 0;
				
		String query = prop.getProperty("insertRequestTaxBill");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, accomoNo);
			pstmt.setInt(2, accomoNo);
			pstmt.setInt(3, stlNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}

		return result;
	}

	public List<AccomoDTO> selectAccomoNamesDAO(int ownerNo, Connection con) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		AccomoDTO accomoDTO = new AccomoDTO();
		
		List<AccomoDTO> selectAccomoNames = new ArrayList<AccomoDTO>();
		
		String query = prop.getProperty("selectAccomoNames");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, ownerNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				accomoDTO = new AccomoDTO();
				
				accomoDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				accomoDTO.setAccomoNo(rset.getInt("ACCOMO_NO"));
				
				selectAccomoNames.add(accomoDTO);
			}
			
			rset = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return selectAccomoNames;
	}

	public int selectAccomoNoDAO(Connection con, String accomoName, int ownerNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		int accomoNo = 0;
		
		String query = prop.getProperty("selectAccomoNo");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, accomoName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				accomoNo = rset.getInt("ACCOMO_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return accomoNo;
	}

	public List<SettlementDTO> selectStl(Connection con, PageInfoDTO pageInfo, int ownerNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;

		List<SettlementDTO> selectStl = new ArrayList<>(); //모든 행을 다 받아서 최종 리스트를 만듬
		
		String query = prop.getProperty("selectStl");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo); //업체번호
			pstmt.setInt(2, pageInfo.getStartRow());
			pstmt.setInt(3, pageInfo.getEndRow());

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				SettlementDTO stl = new SettlementDTO();

				stl.setReqStlNo(rset.getInt("REQUEST_STL_NO"));
				stl.setAccomoNo(rset.getInt("ACCOMO_NO"));
				stl.setReqDate(rset.getDate("REQUEST_DATE"));
				stl.setStlYn(rset.getString("STL_YN"));
				stl.setAccomoName(rset.getString("ACCOMO_NAME"));
				stl.setRowNum(rset.getInt("RNUM"));

				selectStl.add(stl); //한 행씩 저장됨
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return selectStl;
	}

	public String selectImagePathDAO(Connection con, int reportNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String selectImagePathDAO = "";
		
		String query = prop.getProperty("selectImagePath");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, reportNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				selectImagePathDAO = rset.getString("THUMBNAIL_PATH");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return selectImagePathDAO;
	}
	
	public List<AccomoDTO> selectAccomo(Connection con, int ownerNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		List<AccomoDTO> selectAccomo = new ArrayList<AccomoDTO>();
		
		String query = prop.getProperty("selectAccomo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo); //업체번호
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				AccomoDTO accomoName = new AccomoDTO();
				accomoName.setAccomoName(rset.getString("ACCOMO_NAME"));
				accomoName.setAccomoNo(rset.getInt("ACCOMO_NO"));
				selectAccomo.add(accomoName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return selectAccomo;
	}

	public int insertStl(Connection con, int accomoNo) {

		PreparedStatement pstmt = null;
		
		/* 반환시킬 변수 지정 */
		int insert = 0;
		
		String query = prop.getProperty("insertStl");

		//잘 넘어왔는지 확인용 출력
		
		try {
			
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, accomoNo);
			
			insert = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
     
		return insert;
	}
	
	//신고페이지 카운트
	public int selectTotalCount(Connection con, int ownerNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		/* 반환시킬 변수 지정 */
		int totalCount = 0;
		
		String query = prop.getProperty("reportTotalCount");


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

	//정산페이지 카운트
	public int selectStlTotalCount(Connection con, int ownerNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		/* 반환시킬 변수 지정 */
		int stlTotalCount = 0;
		
		String query = prop.getProperty("stlTotalCount");

		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo); //업체번호
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				stlTotalCount = rset.getInt("COUNT(*)");
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
     
		return stlTotalCount;
	}

	public int taxTotalCount(Connection con, int ownerNo) {

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		/* 반환시킬 변수 지정 */
		int taxTotalCount = 0;
		
		String query = prop.getProperty("taxTotalCount");

		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo); //업체번호
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				taxTotalCount = rset.getInt("COUNT(*)");
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
     
		return taxTotalCount;

	}

	public int selectreportedCountDAO(Connection con, int ownerNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int selectreportedCount = 0;
		
		String query = prop.getProperty("selectreportedCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, ownerNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				selectreportedCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
			close(con);

		}

		return selectreportedCount;
	}

	public int updatePwdDAO(Connection con, String pwd, int ownerNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("updatePwd");
	
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, pwd);
			pstmt.setInt(2, ownerNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
			close(rset);
			close(con);

		}
		
		
		return result;
	}

	public int insertWithdrawDAO(String realWithdrawReason, int ownerNo, Connection con) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("insertWithdraw");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, ownerNo);
			pstmt.setString(2, realWithdrawReason);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
			close(rset);
			close(con);

		}
		
		
		
		return result;
	}

	public int updatePhoneNoDAO(Connection con, int ownerNo, String phone) {
		
		PreparedStatement pstmt = null;
		
		int result  = 0;
		String query = prop.getProperty("updatePhoneNo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, phone);
			pstmt.setInt(2, ownerNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
			close(con);
		}
		
		
		
		return result;
	}

	public List<AccomoDTO> selectAccomoListDAO(Connection con, int ownerNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<AccomoDTO> selectAccomoList = new ArrayList<AccomoDTO>();
		AccomoDTO accomoDTO = new AccomoDTO();
		
		String query = prop.getProperty("selectAccomoList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ownerNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				accomoDTO = new AccomoDTO();
				
				accomoDTO.setImagePath(rset.getString("THUMBNAIL_PATH"));
				accomoDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				accomoDTO.setAccomoType(rset.getString("ACCOMO_TYPE"));
				
				selectAccomoList.add(accomoDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		
		
		return selectAccomoList;
	}

}

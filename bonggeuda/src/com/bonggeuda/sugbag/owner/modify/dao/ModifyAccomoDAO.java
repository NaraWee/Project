package com.bonggeuda.sugbag.owner.modify.dao;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.RmAccomoInfoDTO;

public class ModifyAccomoDAO {
	private Properties prop = new Properties();

	public ModifyAccomoDAO() {
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION+"owner/roomManagement/roomManagement-mapper.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	public RmAccomoInfoDTO selectRmAccomoInfoDAO(Connection con, int accomoNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		RmAccomoInfoDTO rmAccomoDTO = new RmAccomoInfoDTO();
		
		String query = prop.getProperty("selectModifyAccomo");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1,accomoNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rmAccomoDTO = new RmAccomoInfoDTO();
				
				rmAccomoDTO.setAccomoNo(rset.getInt("ACCOMO_NO"));
				rmAccomoDTO.setAccomoName(rset.getString("ACCOMO_NAME"));
				rmAccomoDTO.setCeoName(rset.getString("CEO_NAME"));
				rmAccomoDTO.setAccomoType(rset.getString("ACCOMO_TYPE"));
				rmAccomoDTO.setRegistNo(rset.getString("REGISTRATION_NO"));
				rmAccomoDTO.setAddress(rset.getString("ACCOMO_ADDRESS"));
				rmAccomoDTO.setEmail(rset.getString("ACCOMO_EMAIL"));
				rmAccomoDTO.setHomepage(rset.getString("ACCOMO_HOMEPAGE"));
//				rmAccomoDTO.setFacility(rset.getString("ACCOMO_FACILITY"));
//				rmAccomoDTO.setAccomoPath(rset.getString("ACCOMO_PATH"));
//				rmAccomoDTO.setNear(rset.getString("ACCOMO_NEAR"));
//				rmAccomoDTO.setRule(rset.getString("ACCOMO_RULE"));
//				rmAccomoDTO.setParking(rset.getString("ACCOMO_PARKING"));
//				rmAccomoDTO.setCheckIn(rset.getString("CHECK_IN"));
//				rmAccomoDTO.setCheckOut(rset.getString("CHECK_OUT"));
//				rmAccomoDTO.setPeakEnd(rset.getDate("PEAK_DATE_END"));
//				rmAccomoDTO.setPeakStart(rset.getDate("PEAK_DATE_START"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return rmAccomoDTO;
	}

	public int insertModifyAttachment(Connection con, AttachmentDTO tempFileInfo, int selectReqNoMax) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertModifyAccomoAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setString(1, tempFileInfo.getOriginName());
			pstmt.setString(2, tempFileInfo.getSavedName());
			pstmt.setString(3, tempFileInfo.getSavePath());
			pstmt.setString(4, tempFileInfo.getFileType());
			pstmt.setString(5, tempFileInfo.getThumbnailPath());
			pstmt.setInt(6, selectReqNoMax );
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public RmAccomoInfoDTO selectRmAccomoInfoDAOTwo(Connection con, int rmAccomoNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		RmAccomoInfoDTO rmAccomoDTO = new RmAccomoInfoDTO();
		
		String query = prop.getProperty("selectModifyAccomoTwo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,rmAccomoNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			rmAccomoDTO.setFacility(rset.getString("ACCOMO_FACILITY"));
			rmAccomoDTO.setAccomoPath(rset.getString("ACCOMO_PATH"));
			rmAccomoDTO.setNear(rset.getString("ACCOMO_NEAR"));
			rmAccomoDTO.setRule(rset.getString("ACCOMO_RULE"));
			rmAccomoDTO.setParking(rset.getString("ACCOMO_PARKING"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			close(pstmt);
			close(rset);
		}
		
		return rmAccomoDTO;
	}

	public RmAccomoInfoDTO selectRmAccomoInfoDAOThree(Connection con, int rmAccomoNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		RmAccomoInfoDTO rmAccomoDTO = new RmAccomoInfoDTO();
		
		String query = prop.getProperty("selectModifyAccomoThree");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,rmAccomoNo);

			rset = pstmt.executeQuery();

			if(rset.next()) {
//				rmAccomoDTO.set
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rmAccomoDTO;
	}

	public int insertAccomoAttachment(Connection con, AttachmentDTO tempFileInfo, int seqCurrvalSelect) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAccomoAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
		
			pstmt.setString(1, tempFileInfo.getOriginName());
			pstmt.setString(2, tempFileInfo.getSavedName());
			pstmt.setString(3, tempFileInfo.getSavePath());
			pstmt.setString(4, tempFileInfo.getFileType());
			pstmt.setString(5, tempFileInfo.getThumbnailPath());
			pstmt.setInt(6, seqCurrvalSelect);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectRmCountDAO(Connection con, int accomoNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectRmCount");
		int selectRmCount = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, accomoNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				selectRmCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return selectRmCount;
	}

}





















package com.bonggeuda.sugbag.model.dao;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;

public class LoginDAO {

	private Properties prop = new Properties();
	
	public LoginDAO() {
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "/common/common-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	/**
	 * 암호화된 사용자 비밀번호 조회
	 * @param con
	 * @param loginEmail
	 * @param loginPassword
	 * @return
	 */
	public String selectEncryptedPwd(Connection con, String loginEmail, String loginPassword) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String encPwd = null;
		
		String query = prop.getProperty("selectEncryptedPwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				encPwd = rset.getString("USER_PWD");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return encPwd;
	}
	
	/**
	 * 암호화된 업체 비밀번호 조회
	 * @param con
	 * @param loginEmail
	 * @param loginPassword
	 * @return
	 */
	public String selectEncryptedOwnerPwd(Connection con, String loginEmail, String loginPassword) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String encPwd = null;
		
		String query = prop.getProperty("selectEncryptedOwnerPwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				encPwd = rset.getString("OWNER_PWD");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return encPwd;
	}

	/**
	 * 사용자 로그인 체크
	 * @param con
	 * @param loginEmail
	 * @param loginPassword
	 * @return
	 */
	public MemberDTO userLoginCheck(Connection con, String loginEmail, String loginPassword) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		MemberDTO userMember = new MemberDTO();
		
		String query = prop.getProperty("userLoginCheck");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				userMember.setUserNo(rset.getInt("USER_NO"));
				userMember.setUserId(rset.getString("USER_ID"));
				userMember.setUserPwd(rset.getString("USER_PWD"));
				userMember.setUserPhone(rset.getString("USER_PHONE"));
				userMember.setReportCnt(rset.getInt("REPORT_COUNT"));
				userMember.setNickName(rset.getString("USER_NICKNAME"));
				userMember.setWithDrawYn(rset.getString("USER_WITHDRAW_YN"));
				userMember.setUserRole(rset.getString("USER_ROLE"));
				userMember.setSignDate(rset.getDate("SIGNDATE"));
				userMember.setWithDrawDate(rset.getDate("WITHDRAWDATE"));
				
			}
			
			System.out.println("login 정보 : " + userMember);
			if(userMember.getUserId() == null) {
				userMember = null;
			}
			System.out.println("login 정보 확인 : " + userMember);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userMember;
	}

	/**
	 * 업체 로그인 체크
	 * @param con
	 * @param loginEmail
	 * @param loginPassword
	 * @return
	 */
	public OwnerInfoDTO ownerLoginCheck(Connection con, String loginEmail, String loginPassword) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		OwnerInfoDTO ownerMember = new OwnerInfoDTO();
		
		String query = prop.getProperty("ownerLoginCheck");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				ownerMember.setOwnerNo(rset.getInt("OWNER_NO"));
				ownerMember.setOwnerID(rset.getString("OWNER_ID"));
				ownerMember.setOwnerPwd(rset.getString("OWNER_PWD"));
				ownerMember.setOwnerPhone(rset.getString("OWNER_PHONE"));
				ownerMember.setOwnerWithdrawYn(rset.getString("OWNER_WITHDRAW_YN"));
				ownerMember.setOwnerSignDate(rset.getDate("OWNER_SIGNDATE"));
				ownerMember.setOwnerWithDate(rset.getDate("OWNER_WITHDATE"));

			}
			
			System.out.println("login 정보 : " + ownerMember);
			
			if(ownerMember.getOwnerID() == null) {
				ownerMember = null;
			}
			System.out.println("login 정보 확인 : " + ownerMember);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ownerMember;
	}

	/**
	 * 관리자 로그인 체크
	 * @param con
	 * @param loginEmail
	 * @param loginPassword
	 * @return
	 */
	public MemberDTO adminLoginCheck(Connection con, String loginEmail, String loginPassword) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		MemberDTO adminMember = new MemberDTO();
		
		String query = prop.getProperty("userLoginCheck");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, loginEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				adminMember.setUserNo(rset.getInt("USER_NO"));
				adminMember.setUserId(rset.getString("USER_ID"));
				adminMember.setUserPwd(rset.getString("USER_PWD"));
				adminMember.setUserPhone(rset.getString("USER_PHONE"));
				adminMember.setReportCnt(rset.getInt("REPORT_COUNT"));
				adminMember.setNickName(rset.getString("USER_NICKNAME"));
				adminMember.setWithDrawYn(rset.getString("USER_WITHDRAW_YN"));
				adminMember.setUserRole(rset.getString("USER_ROLE"));
				adminMember.setSignDate(rset.getDate("SIGNDATE"));
				adminMember.setWithDrawDate(rset.getDate("WITHDRAWDATE"));
				
			}
			
			System.out.println("login 정보 : " + adminMember);
			if(adminMember.getUserId() == null) {
				adminMember = null;
			}
			System.out.println("login 정보 확인 : " + adminMember);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return adminMember;
	}

	/**
	 * 사용자 회원가입 insert & POINT 테이블 값 insert
	 * @param con
	 * @param requestMember
	 * @return
	 */
	public int registMember(Connection con, MemberDTO requestMember) {

		PreparedStatement pstmt = null;
		
		int result1 = 0;
		int result2 = 0;
		
		/* 회원정보 등록 */
		String query = prop.getProperty("signUpRegist");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getUserId());
			pstmt.setString(2, requestMember.getUserPwd());
			pstmt.setString(3, requestMember.getUserPhone());
			pstmt.setString(4, requestMember.getNickName());
			
			
			result1 = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		/* point정보 등록 */
		String query2 = prop.getProperty("pointInsert");
		try {
			pstmt = con.prepareStatement(query2);
			
			result2 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		int result = result1 + result2;
		
		return result;
	}


	/**
	 * 회원가입시 닉네임 중복확인
	 * @param con
	 * @param nickName
	 * @return
	 */
	public int selectUserNickName(Connection con, String nickName) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("userNicknameSelect");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nickName);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	/**
	 * 회원가입시 이메일 중복확인
	 * @param con
	 * @param email
	 * @return
	 */
	public int selectUserEmail(Connection con, String email) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("userEmailSelect");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	/**
	 * 업체 회원가입
	 * @param con
	 * @param requestMember
	 * @return
	 */
	public int registMember(Connection con, OwnerInfoDTO requestMember) {

		PreparedStatement pstmt = null;
		
		int result = 0;
		
		/* 회원정보 등록 */
		String query = prop.getProperty("signUpRegistOwner");
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestMember.getOwnerID());
			pstmt.setString(2, requestMember.getOwnerPwd());
			pstmt.setString(3, requestMember.getOwnerPhone());
			
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}


	

	
}

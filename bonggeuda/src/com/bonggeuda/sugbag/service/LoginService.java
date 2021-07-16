package com.bonggeuda.sugbag.service;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.commit;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.getConnection;
import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.rollback;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.util.HashMap;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.bonggeuda.sugbag.model.dao.LoginDAO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class LoginService {
	
	private LoginDAO loginDAO = new LoginDAO();

	/**
	 * 사용자 로그인 체크
	 * @param loginEmail
	 * @param loginPassword
	 * @return
	 */
	public MemberDTO userLoginCheck(String loginEmail, String loginPassword) {

		Connection con = getConnection();
		
		MemberDTO userloginMember = null;
		
		String encPwd = loginDAO.selectEncryptedPwd(con, loginEmail, loginPassword);
		
		System.out.println("encPwd : " + encPwd);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(passwordEncoder.matches(loginPassword, encPwd)); {
			
			userloginMember = loginDAO.userLoginCheck(con, loginEmail, loginPassword);
			
		}
		
		return userloginMember;
		
	}

	/**
	 * 업체 로그인 체크
	 * @param loginEmail
	 * @param loginPassword
	 * @return
	 */
	public OwnerInfoDTO ownerLoginCheck(String loginEmail, String loginPassword) {

		Connection con = getConnection();
		
		OwnerInfoDTO ownerloginMember = null;
		
		String encPwd = loginDAO.selectEncryptedOwnerPwd(con, loginEmail, loginPassword);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(passwordEncoder.matches(loginPassword, encPwd)); {
			
			ownerloginMember = loginDAO.ownerLoginCheck(con, loginEmail, loginPassword);
		}
		
		return ownerloginMember;
	}

	/**
	 * 관리자 로그인 체크
	 * @param loginEmail
	 * @param loginPassword
	 * @return
	 */
	public MemberDTO adminLoginCheck(String loginEmail, String loginPassword) {
		
		Connection con = getConnection();
		
		MemberDTO adminloginMember = null;
		
		String encPwd = loginDAO.selectEncryptedPwd(con, loginEmail, loginPassword);
		
		System.out.println("encPwd : " + encPwd);
				
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(passwordEncoder.matches(loginPassword, encPwd)); {
			
			adminloginMember = loginDAO.adminLoginCheck(con, loginEmail, loginPassword);
			
		}
		
		return adminloginMember;
	}
	
	/**
	 * 카카오 로그이 토큰
	 * @param access_Token
	 * @return
	 */
	public HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}

	/**
	 * 사용자 회원가입
	 * @param requestMember
	 * @return
	 */
	public int registMember(MemberDTO requestMember) {

		Connection con = getConnection();
		
		int result = loginDAO.registMember(con, requestMember);
		
		if(result > 1) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	/**
	 * 회원가입시 닉네임 중복확인
	 * @param nickName
	 * @return
	 */
	public int selectUserNickName(String nickName) {
		
		Connection con = getConnection();
		
		int userNickName = loginDAO.selectUserNickName(con, nickName);
		
		close(con);
		
		return userNickName;
	}

	/**
	 * 회원가입시 이메일 중복확인
	 * @param email
	 * @return
	 */
	public int selectUserEmail(String email) {

		Connection con = getConnection();
		
		int userEmail = loginDAO.selectUserEmail(con, email);
		
		close(con);
		
		return userEmail;
	}

	/**
	 * 업체 회원가입
	 * @param requestMember
	 * @return
	 */
	public int registMember(OwnerInfoDTO requestMember) {

		Connection con = getConnection();
		
		int result = loginDAO.registMember(con, requestMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
		
	}


}

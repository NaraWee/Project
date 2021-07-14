package com.nobanryeo.petpal.user.mypage.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.BoradAndCommentDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;
import com.nobanryeo.petpal.user.mypage.dao.BoardManageMapper;
import com.nobanryeo.petpal.user.mypage.dao.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	
	private UserMapper mapper;
	private BoardManageMapper boardMapper;
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	public UserServiceImpl(UserMapper mapper, BCryptPasswordEncoder passwordEncoder, BoardManageMapper boardMapper) {
		this.mapper = mapper;
		this.passwordEncoder = passwordEncoder;
		this.boardMapper = boardMapper;
	}


	/**
	 * ID 중복체크 서비스impl 
	 * true or false를 service로 반환
	 */
	@Override
	public boolean checkId(UserInfoDTO userInfo) {
		System.out.println("서비스까지 왔습니다 : " + userInfo.getId());
		return mapper.selectUserIdcheck(userInfo).equals("0")? true:false;
	}


	/**
	 * Nick 중복체크 서비스impl
	 * true or false를 service로 반환
	 */
	@Override
	public boolean checkNick(UserInfoDTO userInfo) {
		System.out.println("서비스까지 왔습니다 : " + userInfo.getNikname());
		return mapper.selectUserNickcheck(userInfo).equals("0")? true:false;
	}


	/**
	 * Email 중복체크 서비스impl
	 * true or false를 service로 반환
	 */
	@Override
	public boolean checkEmail(UserInfoDTO userInfo) {
		System.out.println("서비스까지 왔습니다 : " + userInfo.getEmail());
		return mapper.selectUserEmailcheck(userInfo).equals("0")? true:false;
	}


	/**
	 * insert작업
	 * 성공 > 0, 실패=0
	 */
	@Override
	public boolean insertUser(UserInfoDTO userInfo) {
		System.out.println("서비스까지 왔습니다 : " + userInfo);
		return mapper.insertUser(userInfo) > 0 ? true:false;
	}


	/**
	 *비밀번호 매치
	 * true : 유저 셀렉트
	 * false : return null
	 */
	@Override
	public UserInfoDTO selectUser(UserInfoDTO userInfo) {
		
		if(!passwordEncoder.matches(userInfo.getPwd(), mapper.selectUserPassword(userInfo.getId()))) {
			return null;
		}
		
		return mapper.selectUser(userInfo.getId());
	}


	/**
	 * 입력된 이메일과 같은 아이디 찾기
	 */
	@Override
	public String findIdService(String email) {
		
		System.out.println("서비스까지 왔습니다. : " + email);
		
		
		return mapper.selectUserId(email);
	}


	@Override
	public void findPwd(HttpServletResponse response, UserInfoDTO userInfo) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		UserInfoDTO user = mapper.selectUser(userInfo.getId());
		
		// 아이디가 없으면
		if(mapper.selectUser(userInfo.getId()) == null) {
			out.print("조회하시는 아이디와 일치하는 아이디가 존재하지 않습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!userInfo.getEmail().equals(user.getEmail())) {
			out.print("조회하시는 아이디와 일치하는 아이디가 존재하지 않습니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pwd = "";
			for (int i = 0; i < 12; i++) {
				pwd += (char) ((Math.random() * 26) + 97);
			}
			
			
			System.out.println("변경 된 비밀번호 : " + pwd);
			// 비밀번호 변경
			userInfo.setPwd(pwd);
			// 비밀번호 변경 메일 발송
			sendEmail(userInfo, "findPwd");
			
			userInfo.setPwd(passwordEncoder.encode(userInfo.getPwd()));
			mapper.modifyPwd(userInfo);
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		} 
	}


	@Override
	public void sendEmail(UserInfoDTO userInfo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "final.petpal@gmail.com";
		String hostSMTPpwd = "petpal1234!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "final.petpal@gmail.com";
		String fromName = "펫팔";
		String subject = "";
		String msg = "";

		if(div.equals("findPwd")) {
			subject = "펫팔 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += userInfo.getId() + " 님의 임시 비밀번호 입니다. 로그인 후, 반드시 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += userInfo.getPwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = userInfo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}


	/**
	 * 닉네임 업데이트
	 */
	@Override
	public int updateNick(UserInfoDTO userInfo) {
		
		
		int result = mapper.updateNick(userInfo);
		
		System.out.println("닉네임 업데이트 성공 여부 : " + result);
		
		return result;
		
	}


	/**
	 * ID를 사용하여 유저정보 조회
	 */
	@Override
	public UserInfoDTO selectNewUserInfo(UserInfoDTO userInfo) {
		
		return mapper.selectUser(userInfo.getId());
	}


	/**
	 * 계정관리에서의 유저 이메일 업데이트
	 */
	@Override
	public int updateEmail(UserInfoDTO userInfo) {
		
		int result = mapper.updateEmail(userInfo);
		
		System.out.println("닉네임 업데이트 성공 여부 : " + result);
		
		return result;
	}


	/**
	 * 계정관리에서의 유저정보 업데이트
	 */
	@Override
	public boolean updateUserInfo(UserInfoDTO userInfo) {
		return mapper.updateUserInfo(userInfo) > 0? true:false;
	}


	/**
	 * 계정 탈퇴
	 */
	@Override
	public String withdrawUser(UserInfoDTO userInfo) {
		
		String result = "";
		
		if(!passwordEncoder.matches(userInfo.getPwd(), mapper.selectUserPassword(userInfo.getId()))) {
			result = "pwdFail";
			return result;
		} else {
			if(mapper.updatewithdrawUser(userInfo) > 0) {
				System.out.println("우선 탈퇴여부를 Y처리 성공했습니다.");
				if(mapper.insertwithdrawUser(userInfo) > 0) {
					System.out.println("탈퇴회원 테이블에 인서트 성공했습니다! 이 회원은 이제 탈퇴한 회원입니다!");
					result = "true";
					return result;
				} else {
					System.out.println("탈퇴회원 테이블에 인서트 실패했습니다....");
					result = "fail";
					return result;
				}
				
			} else {
				System.out.println("탈퇴여부 Y처리 실패했습니다. fail리턴합니다.");
				result = "fail";
				return result;
			}
		}
		
	}


	@Override
	public boolean insertQuestion(AdQnADTO qnaDTO) {
		return mapper.insertQuestion(qnaDTO) > 0 ? true : false;
	}


	@Override
	public int selectReviewPostCount() {
		return boardMapper.selectReviewPostCount();
	}


	@Override
	public List<BoradAndCommentDTO> selectMissing(PageDTO page) {
		return boardMapper.selectReviewPostList(page);
	}
	
	
	
}

	


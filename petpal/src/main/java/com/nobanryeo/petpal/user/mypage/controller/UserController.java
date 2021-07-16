package com.nobanryeo.petpal.user.mypage.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;
import com.nobanryeo.petpal.user.mypage.dao.UserMapper;
import com.nobanryeo.petpal.user.mypage.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	private final UserService userService;
	private final BCryptPasswordEncoder encoder;

	@Autowired 
	public UserController(UserService userService,BCryptPasswordEncoder encoder) { 
		this.userService = userService; 
		this.encoder = encoder;
	}
	 
	@GetMapping("login")
	public String LoginForm() {
		return "common/login";
	}

	@GetMapping("regist")
	public String registForm() {
		return "common/regist";
	}
	@GetMapping("main/usefulLinks")
	public String usefulLinks() {
		return "user/main/usefulLinks";
	}


	/**
	 * ID 중복확인 컨트롤러
	 * @param userInfo
	 * @param requestm
	 * @param userId
	 * @return success or fail
	 */
	@PostMapping(value = "registIdChk", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String registIdChk(@ModelAttribute UserInfoDTO userInfo) {

		// 아이디 중복체크
		
		boolean notOverId = userService.checkId(userInfo);
		System.out.println("notOverId : " + notOverId);
		
		String result = "";
		if(notOverId == true) {
			result = "success";
		} else {
			result = "fail";
		}
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(result);
		
	}
	
	/**
	 * NickName 중복확인 컨트롤러
	 * @param userInfo
	 * @param userNickName
	 * @return
	 */
	@PostMapping(value = "registNickChk", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String registNickChk(@ModelAttribute UserInfoDTO userInfo) {
		
		boolean notOverNick = userService.checkNick(userInfo);
		System.out.println("notOverNick : " + notOverNick);
		
		String result = "";
		if(notOverNick == true) {
			result = "success";
		} else {
			result = "fail";
		}
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(result);
		
	}
	
	/**
	 * Email 중복확인 컨트롤러
	 * @param userInfo
	 * @param userEmail
	 * @return
	 */
	@PostMapping(value = "registEmailChk", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String registEmailChk(@ModelAttribute UserInfoDTO userInfo) {
		
		boolean notOverEmail = userService.checkEmail(userInfo);
		System.out.println("notOverEmail : " + notOverEmail);
		
		String result = "";
		if(notOverEmail == true) {
			result = "success";
		} else {
			result = "fail";
		}
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(result);
		
	}
	
	
	 /**
	 * 회원가입 컨트롤러
	 * @param userInfo 유저정보
	 * @param request 
	 * @param rttr success message
	 * @return 
	 */
	@PostMapping("regist") 
	 public String registInsert(@ModelAttribute UserInfoDTO userInfo, RedirectAttributes rttr) {
	 
		System.out.println(userInfo);
		
		//비밀번호 암호화 작업
		userInfo.setPwd(encoder.encode(userInfo.getPwd()));
		
		boolean insertUser = userService.insertUser(userInfo);
		
		System.out.println("유저 insert 결과 : " + insertUser);
			
		
		if(insertUser == true) {
			rttr.addFlashAttribute("message", "회원가입에 성공하셨습니다! 로그인 후, 펫팔의 더 다양한 기능을 이용해보세요!");
		}
		
		return "redirect:login"; 
	 
	 }

	/**
	 * 로그인을 위한 컨트롤러
	 * @param userInfo
	 * @param request
	 * @param mv
	 * @return
	 */
	@PostMapping("login")
	public String userLogin(@ModelAttribute UserInfoDTO userInfo, 
			HttpServletRequest request, RedirectAttributes rttr) {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		userInfo.setId(userId);
		userInfo.setPwd(userPwd);
		
		System.out.println("입력된 아이디 : " + userId);
		System.out.println("입력된 비밀번호 : " + userPwd);
		
		UserInfoDTO loginUser = userService.selectUser(userInfo);
		
		
		System.out.println("로그인한 유저의 정보  : " + loginUser);
		
		if(loginUser == null) {
			System.out.println("정보 불일치 조건문에 들어왔습니다.");
			rttr.addFlashAttribute("message", "아이디와 비밀번호가 일치하지 않습니다.");
			return "redirect:/user/login";
	
		} else {
			
			if(loginUser != null && loginUser.getReportCount() >= 3) {
				System.out.println("차단유저 조건문에 들어왔습니다.");
				rttr.addFlashAttribute("message", "이용약관에 의한 경고 횟수 초과로 인하여 차단 된 사용자입니다. 문의사항은 고객센터(02-7777-7777)로 문의바랍니다.");
				return "redirect:/user/login";
			} else if(loginUser.getWithdrawYn().equals("Y")) {
				System.out.println("탈퇴유저 조건문에 들어왔습니다.");
				rttr.addFlashAttribute("message", "이미 탈퇴한 회원입니다. 문의사항은 고객센터(02-7777-7777)로 문의바랍니다.");
				return "redirect:/user/login";
			} else {
				
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				
				return "redirect:/";
				
			}
		}
	}
	
	/**
	 * 로그아웃을 위한 세션파기
	 * @param session
	 * @param mv
	 * @return
	 */
	@GetMapping("logout")
	public ModelAndView userLogout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		mv.setViewName("redirect:/");
		return mv;
	}
	
	/**
	 * 아이디 찾기 컨트롤러
	 * @param userInfo
	 * @return
	 */
	@PostMapping(value = "findId", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String findUserId(@ModelAttribute UserInfoDTO userInfo) {
		
		System.out.println("입력된 email : " + userInfo.getEmail());
		
		String findId = userService.findIdService(userInfo.getEmail());
		
		System.out.println("찾은 Id : " + findId);
		
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(findId);
	}
	
	/**
	 * 임시비밀번호 발급 컨트롤러
	 * @param userInfo
	 * @param response
	 * @throws Exception
	 */
	@PostMapping(value = "findPwd", produces = "application/json; charset=UTF-8")
	public void findUserPwd(@ModelAttribute UserInfoDTO userInfo, HttpServletResponse response) throws Exception {
		System.out.println("입력된 email : " + userInfo.getEmail());
		System.out.println("입력된 id : " + userInfo.getId());
		userService.findPwd(response, userInfo);
		
		
	}
	
	/**
	 * 문의하기
	 * @param qnaDTO
	 * @param rttr
	 * @return
	 */
	@PostMapping("question")
	public String questionSend(@ModelAttribute AdQnADTO qnaDTO, RedirectAttributes rttr) {
		
		if(qnaDTO.getUserCode() == 0) {
			System.out.println("비로그인 유저 처리로 넘어옴!");
			rttr.addFlashAttribute("message", "문의하기 위해서는 우선 회원가입 또는 로그인이 필요합니다!");
			return "redirect:/user/login";
		}
		
		System.out.println("넘어 온 문의 정보 : " + qnaDTO);
		
		if(userService.insertQuestion(qnaDTO)) {
			rttr.addFlashAttribute("message", "문의 처리 예상 기간은 문의하고 난 후, 3일 이내입니다. 문의내역은 마이페이지에서 조회가 가능합니다!");
		} else {
			rttr.addFlashAttribute("message", "문의하기에 실패했습니다. 지속 된 실패는 고객센터(02-7777-7777)로 문의바랍니다.");
		}
		
		
		return "redirect:/";
	}
	
	


}



















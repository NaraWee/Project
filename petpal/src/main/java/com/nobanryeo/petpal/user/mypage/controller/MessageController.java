package com.nobanryeo.petpal.user.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;
import com.nobanryeo.petpal.user.mypage.service.MessageService;

@Controller
@RequestMapping("/user/mypage/*")
public class MessageController {
	
	private final MessageService messageService;
	  
	@Autowired
	public MessageController(MessageService messageService) {
	   this.messageService = messageService;
	}
	   
	
	@GetMapping("message")
	public String message(@ModelAttribute MessageTableDTO messageDTO, @SessionAttribute UserInfoDTO loginUser
			, PageDTO page , Model model, @RequestParam String type
			, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {

		System.out.println("타입 : " + type);
		messageDTO.setUserCode1(loginUser.getCode());
		
		int code = loginUser.getCode();
		
		
		System.out.println("쪽지 컨트롤러 도착");
		System.out.println("현재 조회할 로그인중인 수신자 유저코드 : " + messageDTO.getUserCode1());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("type", type);
		
		int total = messageService.selectMessageCount(map);
		
		System.out.println("토탈 카운트 : " + total);
		System.out.println("nowPage : " + nowPage);
		System.out.println("cntPerPage : " + cntPerPage);
		
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		
		page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		System.out.println("현재 페이지 : " + page.getNowPage());
		System.out.println("마지막 페이지 : " + page.getEnd());
		System.out.println("페이지당 글 갯수 : " + page.getCntPerPage());
		
		map.put("msgDTO", messageDTO);
		map.put("pageInfo", page);
		
		List<MessageTableDTO> msgList = messageService.selectMessage(map);
		System.out.println("쪽지 리스트 : " + msgList);
		
		model.addAttribute("paging", page);
		model.addAttribute("msgList", msgList);
		model.addAttribute("type", type);
		
		if(type.equals("A")) {
			model.addAttribute("num", 0);
		} else {
			model.addAttribute("num", 1);
		}
		
		return "user/mypage/message";
	}
	
	
	/**
	 * 쪽지 상세보기
	 * @param messageDTO 
	 * @param page 
	 * @param model
	 * @param nowPage
	 * @param cntPerPage
	 * @return
	 */
	@GetMapping("message/messageDetail")
	public String messageDetail(@ModelAttribute MessageTableDTO messageDTO
			, PageDTO page , Model model
			, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage
			, @RequestParam int userCode1, @RequestParam int userCode) {
		
		System.out.println("쪽지 상세보기로 들어왔습니다.");
		System.out.println(messageDTO);
		
		int total = messageService.selectMessageDtailCount(messageDTO);
		

		System.out.println("토탈 카운트 : " + total);
		System.out.println("nowPage : " + nowPage);
		System.out.println("cntPerPage : " + cntPerPage);
		
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		
		page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		System.out.println("현재 페이지 : " + page.getNowPage());
		System.out.println("마지막 페이지 : " + page.getEnd());
		System.out.println("페이지당 글 갯수 : " + page.getCntPerPage());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("msgDTO", messageDTO);
		map.put("pageInfo", page);
		
		List<MessageTableDTO> msgList = messageService.selectDetailMessage(map);
		System.out.println("쪽지 리스트 : " + msgList);
		
		
		model.addAttribute("paging", page);
		model.addAttribute("msgList", msgList);
		
		model.addAttribute("userCode1", userCode1);
		model.addAttribute("userCode", userCode);
		
		return"user/mypage/messageDetail";
	}
	
	
	/**
	 * 쪽지 보내기
	 * @param messageDTO
	 * @param userCode1
	 * @param userCode
	 * @param rttr
	 * @return
	 */
	@PostMapping("message/messageSend")
	public String messageSend(@ModelAttribute MessageTableDTO messageDTO
			, @RequestParam int userCode1, @RequestParam int userCode, RedirectAttributes rttr) {
		
			messageDTO.setUserCode(userCode);
			messageDTO.setUserCode1(userCode1);
			
			System.out.println("아아아악!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			
			System.out.println("보내는 사람!!!!!!!!!!!!!!!!!!!!!! : "+messageDTO.getUserCode());
			System.out.println("받는 사람!!!!!!!!!!!!!!!!!!!!!!! :"+messageDTO.getUserCode1());
			
			
			if(messageService.insertMessageFromMypage(messageDTO)) {
				System.out.println("쪽지 보내기 성공!");
			} else {
				System.out.println("쪽지 보내기 실패...");
				rttr.addFlashAttribute("message", "쪽지 전송에 실패했습니다. 관련 오류 문의는 문의게시판 이용부탁드립니다.");
				return "user/mypage/message/messageDetail?userCode1="+messageDTO.getUserCode()+"&userCode="+messageDTO.getUserCode1();
			}
			
		return "redirect:/user/mypage/message/messageDetail?userCode1="+messageDTO.getUserCode()+"&userCode="+messageDTO.getUserCode1();
	}
	
	

	
	
	
	
	
}

















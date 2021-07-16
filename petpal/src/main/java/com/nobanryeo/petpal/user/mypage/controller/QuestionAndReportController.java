package com.nobanryeo.petpal.user.mypage.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.ReportManageDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;
import com.nobanryeo.petpal.user.mypage.service.QuestionService;

@Controller
@RequestMapping("/user/mypage/*")
public class QuestionAndReportController {
	
	private final QuestionService questionService;
	
	@Autowired
	public QuestionAndReportController(QuestionService questionService) {
		this.questionService = questionService;
	}

	/**
	 * 문의내역 리스트
	 * @param qnaDTO
	 * @param loginUser
	 * @param page
	 * @param model
	 * @param nowPage
	 * @param cntPerPage
	 * @return
	 */
	@GetMapping("qnaAndReportList")
	public String qnaReportList(@ModelAttribute AdQnADTO qnaDTO, @SessionAttribute UserInfoDTO loginUser
			, PageDTO page , Model model, @ModelAttribute ReportManageDTO reportDTO
			, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage
			, @RequestParam(value = "type", defaultValue =  "A") String type) {
		
		System.out.println("type? : " + type);
		
		qnaDTO.setUserCode(loginUser.getCode());
		reportDTO.setUserCode(loginUser.getCode());
		
		int code = qnaDTO.getUserCode();
		
		if(type.equals("A")) {
			
			//문의내역 리스트 조회
			int total = questionService.selectQnACount(code);
			
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
			
			System.out.println("문의 현재 페이지 : " + page.getNowPage());
			System.out.println("문의 마지막 페이지 : " + page.getEnd());
			System.out.println("문의 페이지당 글 갯수 : " + page.getCntPerPage());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("qnaDTO", qnaDTO);
			map.put("pageInfo", page);
			
			List<AdQnADTO> qnaList = questionService.selectQnAList(map);
			
			System.out.println("문의 리스트 : " + qnaList);
			
			model.addAttribute("paging", page);
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("type", "A");
			model.addAttribute("num", "0");
			
		} else if(type.equals("B")) {
			//신고내역 리스트 조회
			int total = questionService.selectReportCount(code);
				
			System.out.println("신고내역 카운트 : " + total);
				
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
				
			System.out.println("신고 현재 페이지 : " + page.getNowPage());
			System.out.println("신고 마지막 페이지 : " + page.getEnd());
			System.out.println("신고 페이지당 글 갯수 : " + page.getCntPerPage());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("reportDTO", reportDTO);
			map.put("pageInfo", page);
			
			List<ReportManageDTO> reportList = questionService.selectReportList(map);
			
			System.out.println("신고내역 리스트 : " + reportList);
			
			model.addAttribute("paging", page);
			model.addAttribute("reportList", reportList);
			model.addAttribute("type", "B");
			model.addAttribute("num", "1");
			
		} else if(type.equals("C")) {
			
			//신고내역 리스트 조회
			int total = questionService.selectReplyReportCount(code);
				
			System.out.println("신고내역 카운트 : " + total);
				
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
				
			System.out.println("신고 현재 페이지 : " + page.getNowPage());
			System.out.println("신고 마지막 페이지 : " + page.getEnd());
			System.out.println("신고 페이지당 글 갯수 : " + page.getCntPerPage());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("reportDTO", reportDTO);
			map.put("pageInfo", page);
			
			List<ReportManageDTO> replyList = questionService.selectReplyReportList(map);
			
			System.out.println("신고내역 리스트 : " + replyList);
			
			model.addAttribute("paging", page);
			model.addAttribute("replyList", replyList);
			model.addAttribute("type", "C");
			model.addAttribute("num", "2");
			
		}
		
		
	    return "user/mypage/qnaReportList";
	}
	
	@GetMapping("qnaAndReportList/qnaDetail")
	public String qnaDetail(@RequestParam int boardCode, Model model) {
		
		System.out.println("넘어온 문의 코드 : " + boardCode);
		
		AdQnADTO qnA = questionService.selectQnADetail(boardCode);
		
		System.out.println("상세정보 : " + qnA);
		
		model.addAttribute("qnA", qnA);
		
		
		return "user/mypage/qnaDetail";
	}
	
	@GetMapping("qnaAndReportList/reportDetail")
	public String reportDetail(@RequestParam(value="reportCode", required = false, defaultValue = "0") int reportCode
			, @RequestParam(value = "type") String type
			, @RequestParam(value = "replyTitle", required = false) String replyTitle
			, @RequestParam(value = "replyContent", required = false) String replyContent
			, @RequestParam(value = "replyDate", required = false) Date replyDate
			, @RequestParam(value = "dCode", required = false, defaultValue = "0") int decisionCode
			, Model model) {
		
		System.out.println("넘어온 타입 : " + type);
		
		if(type.equals("B")) {
			
			System.out.println("넘어온 신고 코드 : " + reportCode);
			ReportManageDTO report = questionService.selectReportDetail(reportCode);
			
			model.addAttribute("report", report);
			model.addAttribute("type", "B");
			
		} else if(type.equals("C")) {
			
			System.out.println("댓글 : " + replyTitle);
			System.out.println("신고내용 : " + replyContent);
			System.out.println("심사코드 있나? : " + decisionCode);
			
			if(decisionCode > 0) {
				System.out.println("심사됐음");
				
				ReportManageDTO decision = questionService.selectDecision(decisionCode);
				
				model.addAttribute("decision", decision);
				model.addAttribute("replyTitle", replyTitle);
				model.addAttribute("replyContent", replyContent);
				model.addAttribute("replyDate", replyDate);
				model.addAttribute("type", "C");
				
				
			} else {
				
				int stateCode = 1; 
				
				System.out.println("심사되지 않음");
				model.addAttribute("replyTitle", replyTitle);
				model.addAttribute("replyContent", replyContent);
				model.addAttribute("stateCode", stateCode);
				model.addAttribute("replyDate", replyDate);
				model.addAttribute("type", "C");
			}
			
			
		}
			
			
		return "user/mypage/reportDetail";
	}
	
	

	
	
}





















package com.nobanryeo.petpal.admin.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.AdminReviewDTO;
import com.nobanryeo.petpal.admin.dto.AdminReviewDetailDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;
import com.nobanryeo.petpal.admin.review.service.AdminReviewService;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

@Controller
@RequestMapping("/admin/*") 
public class AdminReviewController {
	
	private final AdminReviewService reviewService;
	
	public AdminReviewController(AdminReviewService reviewService) {
		this.reviewService = reviewService;
	}
	@RequestMapping("reviewList")
    public String reviewList(Model model , AdminPageInfoDTO paging,
            @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage
            , @RequestParam(value="category", required=false)String category
            , @RequestParam(value="searchCondition", required=false)String searchCondition
            , @RequestParam(value="searchValue", required=false)String searchValue
            , @RequestParam(value="sortValue", required=false)String sortValue) {
       
		if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
         } else if (nowPage == null) {
            nowPage = "1";
         } else if (cntPerPage == null) { 
            cntPerPage = "5";
         }
	   	if(category == null) {
	   		category = "0";
	   	}
	   	
	   	if(searchValue == null) {
    		int total = 0;
        	AdminPageInfoDTO cat = new AdminPageInfoDTO(category);
      	    total = reviewService.selectReviewCount(cat);
        	paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),category,sortValue);
        	model.addAttribute("paging", paging);
            model.addAttribute("total",total);
            model.addAttribute("category", category);
            model.addAttribute("sortValue",sortValue);
            
            
            List<AdminReviewDTO> reviewList = reviewService.selectReview(paging);
        	System.out.println(reviewList);
        	model.addAttribute("total",total);

            model.addAttribute("reviewList", reviewList);
    	}else {
    		int total = 0;
        	AdminPageInfoDTO cat = new AdminPageInfoDTO(category,searchCondition,searchValue);
      	    total = reviewService.selectReviewCount(cat);
        	paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),category,searchCondition,searchValue,sortValue);
        	model.addAttribute("paging", paging);
            model.addAttribute("total",total);
            model.addAttribute("category", category);
            model.addAttribute("sortValue",sortValue);
            model.addAttribute("searchCondition", searchCondition);
            model.addAttribute("searchValue", searchValue);
            
            List<AdminReviewDTO> reviewList = reviewService.selectReview(paging);
        	System.out.println(reviewList);
            model.addAttribute("reviewList", reviewList);
        	model.addAttribute("total",total);

    		
    		
    	}
		
		
       return "admin/main/reviewInfo";
    }
    
    @RequestMapping("reviewDetail")
    public String reviewDetail(Model model ,
            @RequestParam(value="boardCode", required=false)String boardCode
            , @RequestParam(value="category", required=false)String category) {
       
    	Map param = new HashMap();
        
        param.put("boardCode", boardCode);
        param.put("category", category);
    	
        AdminReviewDetailDTO reviewDetail = reviewService.selectReviewDetail(param);
    	
        model.addAttribute("reviewDetail",reviewDetail);
        model.addAttribute("boardCode",boardCode);
        model.addAttribute("category",category);
       return "admin/main/reviewInfo_detail";
    }
    
    @RequestMapping("updateReviewDecision")
    public String updateDecision(Model model
    		,@RequestParam(value="decision", required=false)String decision
    		,@RequestParam(value="message", required=false)String message
    		,@RequestParam(value="category", required=false)String category
    		,@RequestParam(value="boardCode", required=false)String boardCode
    		,HttpServletRequest request) {
       
    	HttpSession session = request.getSession();
		session.getAttribute("loginUser");
	    System.out.println("세션 정보 : " + session);
	    UserInfoDTO userInfo = (UserInfoDTO) session.getAttribute("loginUser");
	    int code = userInfo.getCode();
	    
	    System.out.println("관리자 유저 코드 : " + code);
	    
	    System.out.println("decision"+decision);
	    //카테고리 7일때는 쿼리문 다른거 줘야함 중요
       if(decision.equals("2")) { //승인
    	   System.out.println("승인됨ㅇㅇㅇㅇ");
    	   System.out.println("boardCode"+boardCode);
    	   
    	   DecisionDTO decisionData = new DecisionDTO(message, Integer.parseInt(decision), code, category,boardCode);
    	   if(reviewService.insertDecision(decisionData) == true) {
    		   System.out.println("성공");
    		   if(reviewService.updateReport(decisionData) == true) {
    			   System.out.println("ㄹㅇ성공");
    		   }else {
    			   System.out.println("update실패");
    		   }
    	   }else {
    		   System.out.println("실패");
    	   }
       }else { //거절
    	   //심사여부에 insert
    	   DecisionDTO decisionData = new DecisionDTO(message, Integer.parseInt(decision), code, category,boardCode);
    	   if(reviewService.insertDecision(decisionData) == true) {
    		   System.out.println("성공");
    		   if(reviewService.updateReport(decisionData) == true) {
    			   System.out.println("ㄹㅇ성공");
    		   }else {
    			   System.out.println("update실패");
    		   }
    	   }else {
    		   System.out.println("실패");

    	   }
       }
	    
	    
       model.addAttribute("boardCode",boardCode);
       model.addAttribute("category",category);

       return "redirect:/admin/reviewDetail?boardCode={boardCode}&category={category}";
    }
}

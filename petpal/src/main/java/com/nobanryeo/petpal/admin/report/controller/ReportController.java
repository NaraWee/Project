package com.nobanryeo.petpal.admin.report.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;
import com.nobanryeo.petpal.admin.dto.ReportDTO;
import com.nobanryeo.petpal.admin.dto.ReportDetailDTO;
import com.nobanryeo.petpal.admin.dto.reportPopupDTO;
import com.nobanryeo.petpal.admin.report.service.ReportService;
import com.nobanryeo.petpal.user.adopt.service.AdoptService;
import com.nobanryeo.petpal.user.adopt.service.MissingService;
import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

@Controller
@RequestMapping("/admin/*")  
public class ReportController {
	private final AdoptService adoptService; 
	private final MissingService missingService;
	private final ReportService reportService;
	
	@Autowired
	public ReportController(ReportService reportService,AdoptService adoptService,MissingService missingService) {
		this.adoptService = adoptService;
		this.missingService = missingService;
		this.reportService = reportService;
	}
	
    @RequestMapping("reportList")
    public String reportList(Model model , AdminPageInfoDTO paging,
            @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage
            , @RequestParam(value="category", required=false)String category
            , @RequestParam(value="searchCondition", required=false)String searchCondition
            , @RequestParam(value="searchValue", required=false)String searchValue
            , @RequestParam(value="sortValue", required=false)String sortValue) {
       
    	// 페이징처리에 필요한 객체들
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
    	
    	// 검색후 조회가 아닌 일반조회일때
    	if(searchValue == null) {
    		int total = 0;
    		
    		// 보려고하는 카테고리를 매개변수로 하여 그 게시판의 게시물수로 페이징 DTO를 생성
        	AdminPageInfoDTO cat = new AdminPageInfoDTO(category);
      	    total = reportService.selectReportCount(cat);
        	paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),category,sortValue);
        	model.addAttribute("paging", paging);
            model.addAttribute("total",total);
            model.addAttribute("category", category);
            model.addAttribute("sortValue",sortValue);
            
            // 페이징 DTO를 기준으로 결과를 출력하여 jsp에 보내줌
            List<ReportDTO> reportList = reportService.selectReport(paging);
        	System.out.println(reportList);
        	model.addAttribute("total",total);
            model.addAttribute("reportList", reportList);
            
    	}else {
    		// 검색시 출력되는 리스트
    		int total = 0;
    		// 보려고하는 카테고리와 검색 카테고리, 검색한 값을 매개변수로 하여 그 게시판의 게시물수로 페이징 DTO를 생성
        	AdminPageInfoDTO cat = new AdminPageInfoDTO(category,searchCondition,searchValue);
      	    total = reportService.selectReportCount(cat);
        	paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),category,searchCondition,searchValue,sortValue);
        	model.addAttribute("paging", paging);
            model.addAttribute("total",total);
            model.addAttribute("category", category);
            model.addAttribute("sortValue",sortValue);
            model.addAttribute("searchCondition", searchCondition);
            model.addAttribute("searchValue", searchValue);
            
         // 페이징 DTO를 기준으로 결과를 출력하여 jsp에 보내줌
            List<ReportDTO> reportList = reportService.selectReport(paging);
        	System.out.println(reportList);
        	model.addAttribute("total",total);
            model.addAttribute("reportList", reportList);
    		
    		
    	}
    	

       return "admin/main/report";
    }
    
    @RequestMapping("reportDetail")
    public String reportDetail(Model model, @RequestParam(value="category", required=false)String category
    		,@RequestParam(value="reportCode", required=false)String reportCode) {
       
       if(category == null) {
   		category = "0";
   	}
       Map param = new HashMap();
       
       param.put("reportCode", reportCode);
       param.put("category", category);
       ReportDetailDTO reportDetail = reportService.selectReportDetail(param);
       System.out.println(reportDetail);
       
       model.addAttribute("reportDetail",reportDetail);
       model.addAttribute("category",category);
       model.addAttribute("reportCode",reportCode);


       return "admin/main/report_detail";
    }
    
    
    @RequestMapping("updateDecision")
    public String updateDecision(Model model
    		,@RequestParam(value="reportCode", required=false)String reportCode
    		,@RequestParam(value="decision", required=false)String decision
    		,@RequestParam(value="message", required=false)String message
    		,@RequestParam(value="category", required=false)String category
    		,@RequestParam(value="boardCode", required=false)String boardCode
    		,HttpServletRequest request) {
       
    	HttpSession session = request.getSession();
		session.getAttribute("loginUser");
	    System.out.println("세션 정보 : " + session);
	    UserInfoDTO userInfo = (UserInfoDTO) session.getAttribute("loginUser"); // 현재 로그인한 관리자의 유저코드를 UserInfoDTO에 담아둠
	    int code = userInfo.getCode();
	    System.out.println("관리자 유저 코드 : " + code);
	    System.out.println("reportCode"+reportCode);
	    System.out.println("decision"+decision);
	    
       if(decision.equals("2")) { // 신고를 승인하였을때
    	   System.out.println("승인됨");
    	   System.out.println("boardCode"+boardCode);
    	   
    	   // 신고당한 게시물번호와 해당 게시물이 어떤 게시판의 게시물인지 확인하기위한 카테고리코드, 그리고 승인여부, 관리자의 유저코드를 DecisionDTO에 담아줌
    	   DecisionDTO decisionData = new DecisionDTO(message, Integer.parseInt(decision), code, Integer.parseInt(reportCode),category,boardCode);
    	   if(reportService.insertDecision(decisionData) == true) { // DecisionDTO를 기준으로 DECISION_TABLE에 심사내역을 INSERT해줌
    		   System.out.println("insert 성공");
    		   if(reportService.updateReport(decisionData) == true) { // INSERT한 DECISION_TABLE의 PK를 신고테이블의 DECISION_CODE에 UPDATE해줌
    			   System.out.println("update 성공");
    			   if(reportService.updateBoardBlind(decisionData) == true) { // 현재 신고한 게시물의 공개여부를 Y에서 N으로 바꿔줌
    				   System.out.println("게시글 블라인드 성공");
    				   if(reportService.updateUserBan(decisionData) == true) { // 현재 신고한 게시물을 작성한 유저의 차단카운트를 1 올려줌. 3일시엔 로그인 불가
    					   System.out.println("유저 차단카운트 update 성공");
    				   }else {
        				   System.out.println("유저 차단카운트 update 실패");
        			   }
    			   }else {
    				   System.out.println("블라인드 실패");
    			   }
    		   }else {
    			   System.out.println("update 실패");
    		   }
    	   }else {
    		   System.out.println("insert 실패");
    	   }
       }else { //거절
    	   
    	   DecisionDTO decisionData = new DecisionDTO(message, Integer.parseInt(decision), code, Integer.parseInt(reportCode),category,boardCode);
    	   if(reportService.insertDecision(decisionData) == true) {
    		   System.out.println("insert 성공");
    		   if(reportService.updateReport(decisionData) == true) {
    			   System.out.println("update성공");
    		   }else {
    			   System.out.println("update실패");
    		   }
    	   }else {
    		   System.out.println("insert 실패");

    	   }
       }
	    
	    
       model.addAttribute("reportCode",reportCode);
       model.addAttribute("category",category);

       return "redirect:/admin/reportDetail?reportCode={reportCode}&category={category}";
    }
    
    @RequestMapping("reportPopup")
    public String reportPopup(Model model,
            @RequestParam(value="boardCode", required=false) int boardCode,
            @RequestParam(value="category", required=false)String category) {
    	
    	System.out.println(category+"////"+boardCode);
    	Map param = new HashMap();
        
        param.put("boardCode", boardCode);
        param.put("category", category);
        reportPopupDTO popUp;
    	
        String returnValue = "";
        switch(category) {
        case "0" :
            popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpDefault";
        	break;
        case "1" :
        	popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpDefault";
        	break;
        case "2" :
        	popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpDefault";
        	break;
        	
        case "3" :
        	popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpDefault";
        	break;
        case "4" :
        	MissingDTO missingDetail = new MissingDTO();
        	missingDetail=reportService.selectMissingDetail(boardCode);
        	List<PictureDTO> pictureMissingList = new ArrayList<>(); 
    		pictureMissingList = missingService.selectMissingDetailPicture(boardCode);
    		model.addAttribute("missingDetail",missingDetail);
    		model.addAttribute("pictureMissingList",pictureMissingList);
        	returnValue = "admin/main/popUpMissing";
        	break;
        case "5" :
        	popUp = reportService.selectReportPopup(param);
            model.addAttribute("popUp",popUp);
        	returnValue = "admin/main/popUpMap";
        	break;
        case "6" :
        	AdoptDTO adoptDetail = new AdoptDTO();
    		adoptDetail=reportService.selectAdoptDetail(boardCode);
    		
    		
    		List<PictureDTO> pictureList = new ArrayList<>();
    		pictureList = adoptService.selectPictureList(boardCode);
    		model.addAttribute("adoptDetail",adoptDetail);
    		model.addAttribute("pictureList",pictureList);
        	returnValue = "admin/main/popUpAdopt";
        	break;
        }
        
    	return returnValue;
    }
}

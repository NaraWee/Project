package com.nobanryeo.petpal.admin.ad.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nobanryeo.petpal.admin.ad.service.AdAdminService;
import com.nobanryeo.petpal.admin.dto.AdAdminDTO;
import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

/**
 * @author Haein Kim
 * date : 210625 ~
 */

@Controller
@RequestMapping("/admin/*")   
public class AdAdminController {
	
	private AdAdminService adAdminService;

	@Autowired
	public AdAdminController(AdAdminService adAdminService) {
		this.adAdminService = adAdminService;
	}
	
	/* 광고심사 리스트 */
	@RequestMapping(value="adApproveList")
	public String adApproveListReturning(Model model, AdminPageInfoDTO paging,
			  @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="category", required=false)String category
			, @RequestParam(value="searchCondition", required=false)String searchCondition
            , @RequestParam(value="searchValue", required=false)String searchValue, HttpServletRequest request) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		

		// 검색 안 했을 떄
		if(searchValue == null) {
			
			AdminPageInfoDTO cat = new AdminPageInfoDTO(category);
			
			System.out.println("검색 안했을 때 cat 출력 : " + cat);
			
			HttpSession session = request.getSession();
			session.getAttribute("loginUser");
		    System.out.println("세션 정보 : " + session);
		    UserInfoDTO userInfo = (UserInfoDTO) session.getAttribute("loginUser");
		    int code = userInfo.getCode();
		    
		    System.out.println("관리자 유저 코드 : " + code);
			
			// 총 개수
			int total = adAdminService.selectAdApply(cat);
			
			System.out.println("총 개수 : " + total);
			
			// 페이징 정보
			paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category);
			
			// 광고 심사 리스트
			List<AdAdminDTO> selectAdApproveList = adAdminService.selectAdApproveList(paging);
			
			System.out.println("검색 안 했을 때 검색결과 : " + selectAdApproveList);
			
			// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
			model.addAttribute("paging", paging);
			model.addAttribute("adApproveList", selectAdApproveList);
			model.addAttribute("category", category);
			model.addAttribute("total", total);
			
		} else {
			
		// 검색했을 때
			
			AdminPageInfoDTO cat = new AdminPageInfoDTO(category,searchCondition,searchValue);
		
			System.out.println("검색했을 때 cat 출력 : " + cat);
			System.out.println(cat.getSearchValue());
			
			// 카테고리
	        System.out.println("카테고리 : " + category);
	        // 검색조건
	        System.out.println("검색조건 : " + searchCondition);
	        // 검색값
	        System.out.println("검색값 : " + searchValue);
			
			// 총 개수
			int total = adAdminService.searchAdApply(cat);
	         
	        System.out.println("총 개수 : " + total);
	        
	        paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category, searchCondition, searchValue);
			
			// 광고 심사 리스트
			List<AdAdminDTO> searchAdApproveList = adAdminService.searchAdApproveList(paging);
			
			System.out.println("검색 했을 때 검색결과 : " + searchAdApproveList);
		
			// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
			model.addAttribute("paging", paging);
			model.addAttribute("adApproveList", searchAdApproveList);
			model.addAttribute("category", category);
			model.addAttribute("total", total);
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchValue", searchValue);
		
		}

		
		// 전달할 페이지 설정
		return "admin/main/adApproveList";
	}
	
	
	/* 광고심사 디테일 */
	@RequestMapping(value="adApproveDetail/{adCode}", method=RequestMethod.GET)
	public String adApproveDetailReturning(Model model, @PathVariable("adCode") int adCode) {
		
		// 광고 정보 조회
		List<AdAdminDTO> selectAdApproveDetail = adAdminService.selectAdApproveDetail(adCode);
		
		model.addAttribute("adApproveDetail", selectAdApproveDetail);
		
		// 심사 사유 조회
		List<AdAdminDTO> selectAdApproveDecision = adAdminService.selectAdApproveDecision(adCode);
				
		model.addAttribute("adApproveDecision", selectAdApproveDecision);
		
		System.out.println("심사 사유1 : " + model.getAttribute("adApproveDecision"));
		
		return "admin/main/adApproveDetail";
		
	}
	
	/* 광고내용 팝업창 */
	@RequestMapping("adPopUp")
	public String adListReturning(Model model,
			                      @RequestParam(value="adCode", required=false) int adCode) {
		System.out.println("광고코드 : " + adCode);
		
		// 광고 정보 조회
		List<AdAdminDTO> selectAdPopUp = adAdminService.selectAdPopUp(adCode);
				
		model.addAttribute("adPopUp", selectAdPopUp);
		
		return "admin/main/adPopUp";
	}
	
	
	/* 광고심사 심사 입력 */
	@RequestMapping(value="adApproveDetail/{adCode}", method=RequestMethod.POST)
	public String adApproveInsert(Model model, 
								 HttpServletRequest req,
			                     @PathVariable("adCode") int adCode, DecisionDTO decision) {
		
		HttpSession session = req.getSession();
		session.getAttribute("loginUser");
	    System.out.println("세션 정보 : " + session);
	    UserInfoDTO userInfo = (UserInfoDTO) session.getAttribute("loginUser");
	    int code = userInfo.getCode();
	    
	    System.out.println("관리자 유저 코드 : " + code);
	    
	    int stateCode = 0;
		
	    if (req.getParameter("state").equals("광고 승인")) {
	    	stateCode = 2;
	    } else if (req.getParameter("state").equals("광고 거절")) {
	    	stateCode = 3;
	    }
	    
	    decision = new DecisionDTO(req.getParameter("decisionReason"), stateCode, code, adCode);
	    
	    // 심사 사유 입력
	    Boolean result = adAdminService.insertAdApprove(decision);
		
		if (result != true) {
			System.out.println("심사 사유 입력 실패");
		} else {
			
			System.out.println("심사 사유 입력 성공");
			
			if(!adAdminService.updateAdApprove(decision)) {
				System.out.println("심사 결과 업데이트 실패");
			}
			System.out.println("심사 결과 업데이트 성공");
		}
		
		return "redirect:/admin/adApproveDetail/{adCode}";
	}
	
	/* 광고관리 리스트 */
	@RequestMapping("adList")
	public String adListReturning(Model model, AdminPageInfoDTO paging,
			  @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="category", required=false)String category
			, @RequestParam(value="searchCondition", required=false)String searchCondition
            , @RequestParam(value="searchValue", required=false)String searchValue, HttpServletRequest request) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		List<AdAdminDTO> selectAdList = null;
		
		// 검색 안 했을 떄
	    if(searchValue == null) {
	    	
	    	AdminPageInfoDTO cat = new AdminPageInfoDTO(category);
	    	
	    	System.out.println("검색 안했을 때 cat 출력 : " + cat);
	    	
	    	// 총 개수
	    	int total = adAdminService.selectAdList(cat);
	    	
	    	System.out.println("총 개수 : " + total);
	    	
	    	// 페이징 정보
	    	paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category);
	    	
	    	// 광고 심사 리스트
	    	selectAdList = adAdminService.selectAdAllList(paging);
	    	
	    	System.out.println("검색 안 했을 때 검색결과 : " + selectAdList);
	    	
	    	// 게시중(category 2)일 때 클릭 수 조회
	    	if (category != null && category.equals("2")) {
	    		List<AdAdminDTO> selectClickAdList = adAdminService.selectClickList(selectAdList);
	    		
	    		System.out.println("클릭 수 : " + selectClickAdList);
	    		
	    		model.addAttribute("paging", paging);
	    		model.addAttribute("adList", selectClickAdList);
	    		model.addAttribute("category", category);
	    		model.addAttribute("total", total);
	    		
	    	} else {
	    		// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
	    		model.addAttribute("paging", paging);
	    		model.addAttribute("adList", selectAdList);
	    		model.addAttribute("category", category);
	    		model.addAttribute("total", total);
	    	}
	    	
	    } else {
	    	
		// 검색했을 때
				
				AdminPageInfoDTO cat = new AdminPageInfoDTO(category,searchCondition,searchValue);
			
				System.out.println("검색했을 때 cat 출력 : " + cat);
				System.out.println(cat.getSearchValue());
				
				// 카테고리
		        System.out.println("카테고리 : " + category);
		        // 검색조건
		        System.out.println("검색조건 : " + searchCondition);
		        // 검색값
		        System.out.println("검색값 : " + searchValue);
				
				// 총 개수
				int total = adAdminService.searchAdList(cat);
		         
		        System.out.println("총 개수 : " + total);
		        
		        paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category, searchCondition, searchValue);
				
				// 광고 심사 리스트
				List<AdAdminDTO> searchAdAllList = adAdminService.searchAdAllList(paging);
				
				System.out.println("검색 했을 때 검색결과 : " + searchAdAllList);
			
				// 게시중(category 2)일 때 클릭 수 조회
		    	if (category != null && category.equals("2")) {
		    		
		    		List<AdAdminDTO> searchClickAdList = adAdminService.selectClickAdList(searchAdAllList);
		    		
		    		System.out.println("클릭 수 : " + searchClickAdList);
		    		
		    		model.addAttribute("paging", paging);
		    		model.addAttribute("adList", searchClickAdList);
		    		model.addAttribute("category", category);
		    		model.addAttribute("total", total);
		    		model.addAttribute("searchCondition", searchCondition);
					model.addAttribute("searchValue", searchValue);
		    		
		    	} else {
		    		// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
		    		model.addAttribute("paging", paging);
		    		model.addAttribute("adList", searchAdAllList);
		    		model.addAttribute("category", category);
		    		model.addAttribute("total", total);
		    		model.addAttribute("searchCondition", searchCondition);
					model.addAttribute("searchValue", searchValue);
		    	}
		    	
	    	
	    }
				
		return "admin/main/adList";
	}
	
	/* 광고관리 디테일 */
	@RequestMapping(value="adDetail/{adCode}", method=RequestMethod.GET)
	public String adDetailReturning(Model model, @PathVariable("adCode") int adCode) {
		
		System.out.println("adCode : " + adCode);
		
		// 광고관리 정보 조회
		List<AdAdminDTO> selectAdDetail = adAdminService.selectAdDetail(adCode);
		
		System.out.println("조회된 광고 관리 디테일 : " + selectAdDetail);
		
		model.addAttribute("adApproveDetail", selectAdDetail);
		
		
		return "admin/main/adDetail";
	}
	
	

	
}


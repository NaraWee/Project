package com.nobanryeo.petpal.admin.blacklist.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nobanryeo.petpal.admin.blacklist.service.BlackListService;
import com.nobanryeo.petpal.admin.dto.AdAdminDTO;
import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;

@Controller
@RequestMapping("/admin/*")
public class BlackListController {
	
	private BlackListService blackListService;

	@Autowired
	public BlackListController(BlackListService blackListService) {
		this.blackListService = blackListService;
	}

	//블랙리스트 리스트
	@RequestMapping("blackList")
	public String paymentManageListReturning(Model model, AdminPageInfoDTO paging,
			  @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="category", required=false)String category
			, @RequestParam(value="searchCondition", required=false)String searchCondition
			, @RequestParam(value="searchValue", required=false)String searchValue) {
			
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
			
			// 총 개수
	    	int total = blackListService.selectUserNumber(cat);
	    	
	    	System.out.println("총 개수 : " + total);
	    	
	    	// 페이징 정보
	    	paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category);
	    				
	    	// 유저 리스트
	    	List<AdAdminDTO> selectUserList = blackListService.selectUserList(paging);
	    	
	    	System.out.println("검색하지 않았을 때 결과 : " + selectUserList);
	    	
	    	// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
	        model.addAttribute("paging", paging);
	        model.addAttribute("userList", selectUserList);
	        model.addAttribute("category", category);
	        model.addAttribute("total", total);
			
		
		} else {
			
			AdminPageInfoDTO cat = new AdminPageInfoDTO(category, searchValue);
	    	
	    	System.out.println("검색 했을 때 cat 출력 : " + cat);
	    	
	    	// 총 개수
	    	int total = blackListService.searchUserNumber(cat);
	    	
	    	System.out.println("총 개수 : " + total);
			
	    	paging = new AdminPageInfoDTO(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), category, searchValue, total);
				
			// 검색된 유저 리스트
			List<AdAdminDTO> searchUserList = blackListService.searchUserList(paging);
			
			// model 객체에 view로 전달할 결과값을 key, value 형태로 넣어줌
			model.addAttribute("paging", paging);
			model.addAttribute("userList", searchUserList);
			model.addAttribute("category", category);
			model.addAttribute("total", total);
			model.addAttribute("searchValue", searchValue);
			
		}
		
		
		
		return "admin/main/blackList";
	}
	
}

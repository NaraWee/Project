package com.nobanryeo.petpal.admin.ask.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.AskDTO;
import com.nobanryeo.petpal.admin.ask.service.AskService;
import com.nobanryeo.petpal.admin.dto.AskDetailDTO;
@Controller
@RequestMapping("/admin/*") 
public class AskController {
   private final AskService askService;
   
   @Autowired
   public AskController(AskService askService) {
      this.askService = askService;
   }
   
    
   @RequestMapping("askList")
    public String searchAskList(Model model , AdminPageInfoDTO paging,
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
       
       if(searchValue == null) {
    	   AdminPageInfoDTO cat = new AdminPageInfoDTO(category);
           int total = askService.selectListCount(cat);
           
          paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),category,sortValue);
          model.addAttribute("paging", paging);
          model.addAttribute("total",total);
          model.addAttribute("category", category);
          model.addAttribute("sortValue",sortValue);
           
           List<AskDTO> askList = askService.selectAsk(paging);
           System.out.println(askList);
           model.addAttribute("askList", askList);
       }else {
       System.out.println("카테고리 : "+category);
       //글 카운트 
       AdminPageInfoDTO cat = new AdminPageInfoDTO(category,searchCondition,searchValue);
       System.out.println("카테고리 2 : "+cat.getCategory());
       int total = askService.selectSearchCount(cat);
       
      paging = new AdminPageInfoDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),category,searchCondition,searchValue,sortValue);
      model.addAttribute("paging", paging);
      model.addAttribute("total",total);
      model.addAttribute("category", category);
      model.addAttribute("searchCondition", searchCondition);
      model.addAttribute("searchValue", searchValue);
      model.addAttribute("sortValue",sortValue);

       List<AskDTO> askList = askService.selectSearchAsk(paging);
       System.out.println(askList);
       model.addAttribute("askList", askList);
       }
       return "admin/main/ask_board";
    }
    
    
    @RequestMapping("askDetail")
    public String askDetail(Model model,HttpServletRequest request) {
       int boardCode = Integer.parseInt(request.getParameter("boardCode"));
       AskDetailDTO askDetail = askService.selectListDetail(boardCode);
       System.out.println(askDetail);
       model.addAttribute("askDetail",askDetail);

       return "admin/main/ask_board_detail";
    }
    
    @RequestMapping("updateAskReply")
    public String updateReply(Model model,@RequestParam(value="boardCode", required=false)String boardString,@RequestParam(value="message", required=false)String message) {
       System.out.println(message+","+boardString);
       int boardCode = Integer.parseInt(boardString);
       Map param = new HashMap();
       
       param.put("boardCode", boardCode);
       param.put("message", message);
       
       if(!askService.updateReply(param)) {
    	   System.out.println("업데이트 실패");
       }else {
    	   System.out.println("업데이트 성공");
    	   if(askService.updateState(boardCode)) {
    		   System.out.println("업데이트 ㄹㅇ성공");
    	   }
       }

       
       model.addAttribute("boardCode",boardCode);
       
       return "redirect:/admin/askDetail?boardCode={boardCode}";
    }
}
package com.nobanryeo.petpal.user.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.BoradAndCommentDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.ReviewReplyDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;
import com.nobanryeo.petpal.user.mypage.service.BoardManagementService;

@Controller
@RequestMapping("/user/mypage/*")
public class BoardManagementController {
	
	private BoardManagementService boardService;
	
	@Autowired
	public BoardManagementController(BoardManagementService boardService) {
		this.boardService = boardService;
	}
	
	/**
	 * 게시물과 댓글 조회
	 * @param model
	 * @param bcDTO
	 * @param type
	 * @param loginUser
	 * @param page
	 * @param replyDTO
	 * @param page2
	 * @param nowPage
	 * @param cntPerPage
	 * @param nowPage2
	 * @param cntPerPage2
	 * @param response
	 * @param request
	 * @return
	 */
	@GetMapping("boardCommentList")
	public String boardList(
			Model model, BoradAndCommentDTO bcDTO
			, @RequestParam(value = "type", defaultValue =  "A") String type
			, @SessionAttribute UserInfoDTO loginUser
			, PageDTO page, ReviewReplyDTO replyDTO, PageDTO page2
			, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage
			, @RequestParam(value="nowPage2", required = false)String nowPage2
			, @RequestParam(value="cntPerPage2", required = false)String cntPerPage2
			, HttpServletResponse response, HttpServletRequest request) {
		
		Cookie[] cookies = request.getCookies();
    	
    	for(Cookie cookie: cookies) {
    		
    		if(!(cookie.getName().equals("freeboard"))) {
    			
    			cookie = new Cookie("freeboard",null); 				//freeboard라는 이름의 쿠키 생성
    			cookie.setComment("freeboard 게시글 조회 확인");			//해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);							//사용자에게 해당 쿠키를 추가
    			
    		}
    		
    		if(!(cookie.getName().equals("reviewboard"))) {
    			
    			cookie = new Cookie("reviewboard",null); 				//reviewboard라는 이름의 쿠키 생성
    			cookie.setComment("reviewboard 게시글 조회 확인");			//해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);								//사용자에게 해당 쿠키를 추가
    			
    		}
    		
    		if(!(cookie.getName().equals("sharefree"))) {
    			
    			cookie = new Cookie("sharefree",null); 				//sharefree라는 이름의 쿠키 생성
    			cookie.setComment("sharefree 게시글 조회 확인");			//해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);							//사용자에게 해당 쿠키를 추가
    			
    		}
		}
    	
    	
    	
		bcDTO.setType(type);
		
		if(type.equals("A")) {
			
			System.out.println("들어온 타입 : " + type);
			System.out.println(bcDTO);
			
			bcDTO.setUserCode(loginUser.getCode());
	
			int total = boardService.selectMissingCount(bcDTO);
			int total2 = boardService.selectReplyCount(bcDTO);
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			
			if(nowPage2 == null && cntPerPage2 == null) {
				nowPage2 = "1";
				cntPerPage2 = "10";
			} else if(nowPage2 == null) {
				nowPage2 = "1";
				
			} else if(cntPerPage == null) {
				cntPerPage2 = "10";
			}
			
			page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			page2 = new PageDTO(total2, Integer.parseInt(nowPage2), Integer.parseInt(cntPerPage2));
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bcDTO", bcDTO);
			map.put("pageInfo", page);
			map.put("pageInfo2", page2);
			
			List<MissingDTO> aList = boardService.selectMissing(map);
			System.out.println(aList);
			
			model.addAttribute("paging", page);
			model.addAttribute("aList", aList);
			model.addAttribute("reply", boardService.selectReplyList(map));
			model.addAttribute("paging2", page2);
			model.addAttribute("type", "A");
			model.addAttribute("num", 0);

		} else if(type.equals("B")) {
			
			System.out.println("들어온 타입 : " + type);
			bcDTO.setUserCode(loginUser.getCode());
			
			int total = boardService.selectAdoptCount(bcDTO);
			int total2 = boardService.selectReplyCount(bcDTO);
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			
			if(nowPage2 == null && cntPerPage2 == null) {
				nowPage2 = "1";
				cntPerPage2 = "10";
			} else if(nowPage2 == null) {
				nowPage2 = "1";
			} else if(cntPerPage == null) {
				cntPerPage2 = "10";
			}
			
			page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			page2 = new PageDTO(total2, Integer.parseInt(nowPage2), Integer.parseInt(cntPerPage2));
			
			System.out.println("문의 현재 페이지 : " + page.getNowPage());
			System.out.println("문의 마지막 페이지 : " + page.getEnd());
			System.out.println("문의 페이지당 글 갯수 : " + page.getCntPerPage());
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bcDTO", bcDTO);
			map.put("pageInfo", page);
			map.put("pageInfo2", page2);
			
			System.out.println("page2 정보!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println(page2);
			
			List<AdoptDTO> bList = boardService.selectAdoptList(map);
			System.out.println(bList);
			
			model.addAttribute("reply", boardService.selectReplyList(map));
			model.addAttribute("paging", page);
			model.addAttribute("paging2", page2);
			model.addAttribute("bList", bList);
			model.addAttribute("type", "B");
			model.addAttribute("num", 1);
		} else if(type.equals("C")) {
			
			System.out.println("들어온 타입 : " + type);
			bcDTO.setUserCode(loginUser.getCode());
			
			int total = boardService.selectInfoCount(bcDTO);
			int total2 = boardService.selectReplyCount(bcDTO);

			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			
			if(nowPage2 == null && cntPerPage2 == null) {
				nowPage2 = "1";
				cntPerPage2 = "10";
			} else if(nowPage2 == null) {
				nowPage2 = "1";
			} else if(cntPerPage == null) {
				cntPerPage2 = "10";
			}

			
			page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			page2 = new PageDTO(total2, Integer.parseInt(nowPage2), Integer.parseInt(cntPerPage2));
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bcDTO", bcDTO);
			map.put("pageInfo", page);
			map.put("pageInfo2", page2);
			
			List<BoradAndCommentDTO> cList = boardService.selectInfoList(map);
			System.out.println(cList);
			
			model.addAttribute("paging", page);
			model.addAttribute("cList", cList);
			model.addAttribute("type", "C");
			model.addAttribute("reply", boardService.selectReplyList(map));
			model.addAttribute("paging2", page2);
			model.addAttribute("num", 2);
			
		} else if(type.equals("D")) {
			
			
	    	
			System.out.println("들어온 타입 : " + type);
			bcDTO.setUserCode(loginUser.getCode());
			
			int total = boardService.selectFreeCount(bcDTO);
			int total2 = boardService.selectReplyCount(bcDTO);
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			
			if(nowPage2 == null && cntPerPage2 == null) {
				nowPage2 = "1";
				cntPerPage2 = "10";
			} else if(nowPage2 == null) {
				nowPage2 = "1";
			} else if(cntPerPage == null) {
				cntPerPage2 = "10";
			}
			
			page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			page2 = new PageDTO(total2, Integer.parseInt(nowPage2), Integer.parseInt(cntPerPage2));
		
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bcDTO", bcDTO);
			map.put("pageInfo", page);
			map.put("pageInfo2", page2);
			
			List<BoradAndCommentDTO> dList = boardService.selectFreeList(map);
			System.out.println(dList);
			
			model.addAttribute("paging", page);
			model.addAttribute("dList", dList);
			model.addAttribute("type", "D");
			model.addAttribute("reply", boardService.selectReplyList(map));
			model.addAttribute("paging2", page2);
			model.addAttribute("num", 3);
			
		} else if(type.equals("E")) {
			
			bcDTO.setUserCode(loginUser.getCode());
			
			int total = boardService.selectShareCount(bcDTO);

			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}

			
			page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bcDTO", bcDTO);
			map.put("pageInfo", page);

			
			List<BoradAndCommentDTO> eList = boardService.selectShareList(map);
			System.out.println(eList);
			
			model.addAttribute("paging", page);
			model.addAttribute("eList", eList);
			model.addAttribute("type", "E");
			model.addAttribute("num", 4);
			
		} else if(type.equals("F")) {
			
			System.out.println("들어온 타입 : " + type);
			bcDTO.setUserCode(loginUser.getCode());
			System.out.println(bcDTO);
			
			int total = boardService.selectReviewCount(bcDTO);
			int total2 = boardService.selectReplyCount(bcDTO);
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			
			if(nowPage2 == null && cntPerPage2 == null) {
				nowPage2 = "1";
				cntPerPage2 = "10";
			} else if(nowPage2 == null) {
				nowPage2 = "1";
			} else if(cntPerPage == null) {
				cntPerPage2 = "10";
			}
			
			page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			page2 = new PageDTO(total2, Integer.parseInt(nowPage2), Integer.parseInt(cntPerPage2));
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bcDTO", bcDTO);
			map.put("pageInfo", page);
			map.put("pageInfo2", page2);

			
			List<BoradAndCommentDTO> fList = boardService.selectReviewList(map);
			System.out.println(fList);
			
			model.addAttribute("paging", page);
			model.addAttribute("fList", fList);
			model.addAttribute("type", "F");
			model.addAttribute("reply", boardService.selectReplyList(map));
			model.addAttribute("paging2", page2);
			model.addAttribute("num", 5);
			
		} else if(type.equals("H")) {
			
			System.out.println("들어온 타입 : " + type);
			
			bcDTO.setUserCode(loginUser.getCode());
			System.out.println(bcDTO);
			
			int total = boardService.selectFriendlyCount(bcDTO);
			int total2 = boardService.selectReplyCount(bcDTO);
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			
			if(nowPage2 == null && cntPerPage2 == null) {
				nowPage2 = "1";
				cntPerPage2 = "10";
			} else if(nowPage2 == null) {
				nowPage2 = "1";
			} else if(cntPerPage == null) {
				cntPerPage2 = "10";
			}
			
			page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			page2 = new PageDTO(total2, Integer.parseInt(nowPage2), Integer.parseInt(cntPerPage2));
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bcDTO", bcDTO);
			map.put("pageInfo", page);
			map.put("pageInfo2", page2);

			
			List<BoradAndCommentDTO> hList = boardService.selectFriendlyList(map);
			System.out.println(hList);
			
			model.addAttribute("paging", page);
			model.addAttribute("hList", hList);
			model.addAttribute("type", "H");
			model.addAttribute("reply", boardService.selectReplyList(map));
			model.addAttribute("paging2", page2);
			model.addAttribute("num", 6);
		}
		
		return "user/mypage/boardCommentList";
	}
	
	/**
	 * 게시물 삭제하기
	 * @param boardCode
	 * @param type
	 * @param load
	 * @return
	 */
	@PostMapping(value = "deletePost", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deletePost(@RequestParam(value="boardCode", required = false) int boardCode
			,@RequestParam(value="type", required = false) String type
		,@RequestParam(value="load", required = false) String load) {
		
		System.out.println("boardCode : " + boardCode);
		System.out.println("type : " + type);
		System.out.println("load : " + load);
		
		String result = "";
		
		if(type.equals("A")) {
			System.out.println("A들어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			boolean value = boardService.deletePost(boardCode);
			
			if(value == true) {
				result = "A";
			} else {
				result = "fail";
			}
			
		} else if(type.equals("B")) {
			System.out.println("B들어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println("B타입에 들어옴");
			
			boolean value = boardService.deletePostAdopt(boardCode);
			
			if(value == true) {
				result = "B";
			} else {
				result = "fail";
			}

		} else if(type.equals("C")) {
			System.out.println("C들어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			boolean value = boardService.deletePostInfo(boardCode);
			if(value == true) {
				result = "C";
			} else {
				result = "fail";
			}
		} else if(type.equals("D")) {
			System.out.println("D들어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			boolean value = boardService.deletePostFree(boardCode);
			if(value == true) {
				result = "D";
			} else {
				result = "fail";
			}
		} else if(type.equals("E")) {
			System.out.println("E들어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			boolean value = boardService.deletePostShare(boardCode);
			if(value == true) {
				result = "E";
			} else {
				result = "fail";
			}
		} else if(type.equals("F")) {
			System.out.println("F들어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			boolean value = boardService.deletePostReview(boardCode);
			if(value == true) {
				result = "F";
			} else {
				result = "fail";
			}
		} else if(type.equals("H")) {
			System.out.println("H들어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			boolean value = boardService.deletePostFriendly(boardCode);
			if(value == true) {
				result = "H";
			} else {
				result = "fail";
			}
		} else if(type.equals("G")) {
			
			System.out.println("G들어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			boolean value = boardService.deleteReply(boardCode);
			
			if(value == true) {
			
				switch (load) {
				case "A":result = "A"; break;
				case "B":result = "B"; break;
				case "C":result = "C"; break;
				case "D":result = "D"; break;
				case "E":result = "E"; break;
				case "F":result = "F"; break;
				case "H":result = "H"; break;
				}
				
			} else {
				result = "fail";
			}
		}
		
	    Gson gson = new GsonBuilder().create();
	     
	    return gson.toJson(result);
	}
	
	
	
	
}





















package com.nobanryeo.petpal.user.adopt.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.nobanryeo.petpal.user.ad.service.UserAdService;
import com.nobanryeo.petpal.user.adopt.service.ShareFreeService;
import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.ShareFreeDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

/**
 * @author judyh
 *
 */
@Controller
@RequestMapping("/user/*")
public class ShareFreeController {
	
	private ShareFreeService sharefreeService;
	private final UserAdService adService;

	@Autowired
	public ShareFreeController(ShareFreeService sharefreeService, UserAdService adService) {
		this.sharefreeService = sharefreeService;
		this.adService = adService;
	}
	
	
	/** 
	 * 페이징 처리 & 전체 셀렉트
	 * @param shareDTO
	 * @param model
	 * @param response
	 * @param request
	 * @param page
	 * @param nowPage
	 * @param cntPerPage
	 * @return
	 */
	@GetMapping("shareFree/list")
	public String shareFreeList(@ModelAttribute ShareFreeDTO shareDTO, Model model, HttpServletResponse response, HttpServletRequest request, PageDTO page
    		, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage
			, @RequestParam(value="category", required=false) String category
			, @RequestParam(value="keyword", required = false) String keyword) {
		
		Cookie[] cookies = request.getCookies();
		
		for(Cookie cookie : cookies) {
			if(!cookie.getName().equals("sharefree")) {
				
				cookie = new Cookie("sharefree",null); // 쿠키생성
				cookie.setComment("무료나눔 쿠키 생성");
				response.addCookie(cookie);
				
			}
			if(!(cookie.getName().equals("AdCookie"))) {		// 광고
    			
    			cookie = new Cookie("AdCookie",null); 		// sharInfoAd라는 이름의 쿠키 생성
    			cookie.setComment("AdCookie 게시글 조회 확인");	// 해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);						// 사용자에게 해당 쿠키를 추가
    			
    		}
		}
		//전체 리스트 호출
		if(category == null) {
			int totalCount = sharefreeService.selectTotalCount();
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
	    	
	    	page = new PageDTO(totalCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sharefreeDTO", shareDTO);
			map.put("pageInfo", page);
	    	
	    	List<ShareFreeDTO> shareList = sharefreeService.selectShareFreeList(map);
	    	
	    	model.addAttribute("paging", page);
	    	model.addAttribute("shareList", shareList);
	    	model.addAttribute("category", null);
	    	model.addAttribute("keyword", null);
	    	model.addAttribute("randomAdNonPlace", adService.selectRandomAdNonPlace());
	    	
		} else if(category.equals("S")) { // 무료 나눔중 리스트 호출
    		int totalIngCount = sharefreeService.selectTotalIngCount();
    		
    		if(nowPage == null && cntPerPage == null) {
    			nowPage = "1";
    			cntPerPage = "12";
    		} else if(nowPage == null) {
    			nowPage = "1";
    		} else if(cntPerPage == null) {
    			cntPerPage = "12";
    		}
    		
    		page = new PageDTO(totalIngCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
    		
    		HashMap<String, Object> map1 = new HashMap<String, Object>();
    		map1.put("sharefreeDTO", shareDTO);
    		map1.put("pageInfo", page);
        	
        	List<ShareFreeDTO> shareIngList = sharefreeService.selectIngList(map1);
        	
        	model.addAttribute("paging", page);
        	model.addAttribute("category", "S");
        	model.addAttribute("shareIngList", shareIngList);
        	model.addAttribute("randomAdNonPlace", adService.selectRandomAdNonPlace());
    		
    	} else if(category.equals("C")) {  // 무료 나눔 리스트 호출
    		
    		int totalComCount = sharefreeService.selectTotalComCount();
    		
    		if(nowPage == null && cntPerPage == null) {
    			nowPage = "1";
    			cntPerPage = "12";
    		} else if(nowPage == null) {
    			nowPage = "1";
    		} else if(cntPerPage == null) {
    			cntPerPage = "12";
    		}
    		
    		page = new PageDTO(totalComCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

    		HashMap<String, Object> map2 = new HashMap<String, Object>();
    		map2.put("sharefreeDTO", shareDTO);
    		map2.put("pageInfo", page);
    		
        	
        	List<ShareFreeDTO> shareComList = sharefreeService.selectComList(map2);
        	
        	model.addAttribute("paging", page);
        	model.addAttribute("category", "C");
        	model.addAttribute("shareComList", shareComList);
        	model.addAttribute("randomAdNonPlace", adService.selectRandomAdNonPlace());
        	
    	} 
		if(category == null && keyword != null) {
    			
    			int totalkeywordCount = sharefreeService.selectTotalSearchCount(keyword);
	    		
	    		if(nowPage == null && cntPerPage == null) {
	    			nowPage = "1";
	    			cntPerPage = "12";
	    		} else if(nowPage == null) {
	    			nowPage = "1";
	    		} else if(cntPerPage == null) {
	    			cntPerPage = "12";
	    		}
	    		
	    		page = new PageDTO(totalkeywordCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	
	    		HashMap<String, Object> map3 = new HashMap<String, Object>();
	    		map3.put("sharefreeDTO", shareDTO);
	    		map3.put("pageInfo", page);
	    		map3.put("keyword", keyword);
	    		
	        	List<ShareFreeDTO> shareSearchList = sharefreeService.selectSearchList(map3);
	        	System.out.println(shareSearchList);
	        	
	        	model.addAttribute("paging", page);
	        	model.addAttribute("category", null);
	        	model.addAttribute("keyword", keyword);
	        	model.addAttribute("shareSearchList", shareSearchList);
	        	model.addAttribute("randomAdNonPlace", adService.selectRandomAdNonPlace());
	    	}
	    	
		return "user/community/shareList";
	}
	
	/**
	 * 글 상세조회 (쿠키 포함)
	 * @param code
	 * @param response
	 * @param model
	 * @param cookie
	 * @return
	 */
	@GetMapping("shareFree/detail/board/{boardCode}")
	public String selectFreeShareDetail(@PathVariable("boardCode") int code,HttpServletResponse response, Model model, @CookieValue(name="sharefree") String cookie) {
		
	if(!(cookie.contains(String.valueOf(code)))) {
			
			cookie += code + "/";
			
			// 조회수 카운트
			sharefreeService.updateShareBoardViews(code);
			
		}
		
		response.addCookie(new Cookie("sharefree", cookie));
		
		ShareFreeDTO share = sharefreeService.selectBoardDetail(code);
		
		
		model.addAttribute("shareInfo", share);
		
		return "user/community/shareDetail";
	}

	@GetMapping("shareFree/insert/newcontent")
	public String FreeShareWrite() {
		
		
		return"user/community/shareWrite";
	}
	
	@PostMapping(value="shareFree/insert/shareImg", produces = "application/json")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = request.getSession().getServletContext().getRealPath("resources")+ "\\uploadFiles";
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		String utilPath = "resources\\uploadFiles\\"+savedFileName; // JSP에서 사용할 파일명
		
		File targetFile = new File(fileRoot +"\\"+ savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/petpal/resources/uploadFiles/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
			jsonObject.addProperty("originFileName", originalFileName);
			jsonObject.addProperty("saveName", savedFileName);
			jsonObject.addProperty("filePath", fileRoot);
			jsonObject.addProperty("utilPath", utilPath);
			
			System.out.println(jsonObject.toString());
			
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject.toString();
	}
	
	@PostMapping("shareFree/insert/newBoard")
	public String insertNewBoard(HttpServletRequest request, Model model,RedirectAttributes rttr,HttpSession session, HttpServletResponse response, @ModelAttribute ShareFreeDTO shareDTO,@ModelAttribute PictureDTO picture) {
		
		shareDTO.setUserCode(((UserInfoDTO)session.getAttribute("loginUser")).getCode());
		picture.setUserCode(((UserInfoDTO)session.getAttribute("loginUser")).getCode());
		
		System.out.println("shareDTO:" +shareDTO);
		System.out.println("pictureDTO: "+picture);
		
		
		// 이미지 insert -> 이미지 없을때 insert 안해줌
		if(picture.getPictureName().equals("")) {
			
			rttr.addFlashAttribute("message", "최소 한 개 이상의 이미지가 필요합니다.");
			return "redirect:/user/shareFree/insert/newBoard";
			
		} else {
			int totalResult = sharefreeService.insertNewBoth(shareDTO,picture);
			
			if(totalResult > 0) {
				System.out.println("이미지 & 게시글 작성 성공");
			} else {
				System.out.println("이미지 작성 실패");
			}
			
		}
		
		return "redirect:/user/shareFree/list";
		
	}
	
	@GetMapping("sharefree/update/status/{boardCode}")
	public String putMissingStatus(@PathVariable("boardCode") int code, HttpServletRequest request) {
		System.out.println("board in update status: "+code);
		
		
		int result = sharefreeService.putMissingStatus(code);
		
		System.out.println("controller in update status: " + result);
		
		return "redirect:/user/shareFree/detail/board/"+code;
	}
	
	@PostMapping("sharefree/insert/message")
	public String insertMissingMessage(Model model, HttpServletRequest request, HttpSession session, MessageTableDTO messageDTO) {
		
		String boardCode = request.getParameter("boardcode");
		int senderCode = ((UserInfoDTO)session.getAttribute("loginUser")).getCode();
		int receiverCode = Integer.parseInt(request.getParameter("receivecode"));
		String senderNickname = ((UserInfoDTO)session.getAttribute("loginUser")).getNikname();
		String receiverNickname = request.getParameter("receiveUserNick");
		String messageContent = request.getParameter("messageContent");
		
		messageDTO.setMessageContent(messageContent);
		messageDTO.setReceiveUserNick(receiverNickname);
		messageDTO.setSendUserNick(senderNickname);
		messageDTO.setUserCode(senderCode);
		messageDTO.setUserCode1(receiverCode);
		
		int messageResult = sharefreeService.insertMessage(messageDTO);
		
		return "redirect:/user/shareFree/detail/board/"+boardCode;
	}
	
	@PostMapping("sharefree/insert/report")
	public String insertReport(Model model, HttpServletRequest request, HttpSession session, FreeBoardReportDTO boardreportDTO) {
		
		String reportContent = request.getParameter("reportContent");
		int contentCode = Integer.parseInt(request.getParameter("contentCode"));
	
		String boardTitle = request.getParameter("boardTitle");
		
		int boardreportResult = 0;
		
		int userCode = ((UserInfoDTO)session.getAttribute("loginUser")).getCode();
	
		boardreportDTO.setUserCode(userCode);
		boardreportDTO.setReportContent(reportContent);
		boardreportDTO.setReportTitle(boardTitle);
		boardreportDTO.setBoardCode(contentCode);
		
		boardreportResult = sharefreeService.insertBoardReport(boardreportDTO);
	
		return "redirect:/user/shareFree/detail/board/"+contentCode;
	}
	
	@GetMapping("sharefree/modify/{boardCode}")
	public String updateShareFreeInfo(@PathVariable("boardCode") int code, Model model) {
		
		ShareFreeDTO share = sharefreeService.selectBoardDetail(code);
		
		model.addAttribute("shareDetail", share);
		
		return "user/community/shareRevised";
	}
	
	@PostMapping("shareFree/updateBoard/{boardCode}")
	public String updateShareFreeInfo(@PathVariable("boardCode") int code, RedirectAttributes rttr,Model model, @ModelAttribute ShareFreeDTO shareDTO,@ModelAttribute PictureDTO picture) {
		 
		shareDTO.setBoardCode(code);
		picture.setBoardCode(code);
		 
		if(picture.getPictureName().equals("")) {
			
			rttr.addFlashAttribute("message", "최소 한 개 이상의 이미지가 필요합니다.");
			return "redirect:/user/sharefree/modify/"+code;
			
		} else {
			int totalResult = sharefreeService.updateBoth(shareDTO,picture);
			
			if(totalResult > 0) {
				System.out.println("이미지 & 게시글 작성 성공");
			} else {
				System.out.println("이미지 작성 실패");
			}
			
		}
		return "redirect:/user/shareFree/list";
	}
	
}

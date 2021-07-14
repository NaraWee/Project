package com.nobanryeo.petpal.user.ad.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.nobanryeo.petpal.user.ad.service.ShareInfoService;
import com.nobanryeo.petpal.user.ad.service.UserAdService;
import com.nobanryeo.petpal.user.dto.FreeBoardDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.FriendlyPlaceDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.ShareInfoDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

/**
 * @author WEENARA
 * 정보공유 게시판, 프렌들리플레이스게시판 Controller
 */
@Controller
@RequestMapping("/user/*")
public class ShareInfoController {

	private final ShareInfoService shareInfoService;
	private final UserAdService adService;
    
    @Autowired
    public ShareInfoController(ShareInfoService shareInfoService, UserAdService adService) {
       
        this.shareInfoService = shareInfoService;
        this.adService = adService;
    }
    
    /**
     * 정보공유게시판 리스트 조회
     */
    @GetMapping("select/shareInfo/list")
    public String selectShareInfoList(Model model, HttpServletResponse response, HttpServletRequest request, PageDTO page
    		, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
    	
    	Cookie[] cookies = request.getCookies();
    	
    	for(Cookie cookie: cookies) {
    		
    		if(!(cookie.getName().equals("shareInfo"))) {		// 정보공유게시판
    			
    			cookie = new Cookie("shareInfo",null); 			// sharInfo라는 이름의 쿠키 생성
    			cookie.setComment("shareInfo 게시글 조회 확인");		// 해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);						// 사용자에게 해당 쿠키를 추가
    			
    		}
    		
    		if(!(cookie.getName().equals("AdCookie"))) {		// 광고
    			
    			cookie = new Cookie("AdCookie",null); 			// sharInfoAd라는 이름의 쿠키 생성
    			cookie.setComment("AdCookie 게시글 조회 확인");		// 해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);						// 사용자에게 해당 쿠키를 추가
    			
    		}
    	}
       
    	// 페이징처리
    	int total = shareInfoService.selectShareInfoCount();
    	
    	if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "10";
		}
    	
    	page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
    	
    	model.addAttribute("paging", page);
    	
        model.addAttribute("shareInfoList", shareInfoService.selectShareInfoList(page));
        model.addAttribute("randomAdNonPlace", adService.selectRandomAdNonPlace());
    	
    	return "user/main/shareInfo";
    }
	
    /**
     * 정보공유게시판 상세내용 조회
     */
    @GetMapping("select/shareInfo/detail")
    public String selectShareInfoDetail(@CookieValue(name = "shareInfo") String cookie, HttpServletResponse response, Model model, @RequestParam int boardCode) {
    	
    	if(!(cookie.contains(String.valueOf(boardCode)))) {
			
			cookie += boardCode + "/";
			
			// 조회수 카운트
			shareInfoService.updateShareInfoViews(boardCode);
			
		}
    	
    	response.addCookie(new Cookie("shareInfo", cookie));
    	
    	// 상세 내용 조회      
        model.addAttribute("shareInfoDetail", shareInfoService.selectShareInfoDetail(boardCode));
        // 댓글 내용 조회
        model.addAttribute("shareInfoReply", shareInfoService.selectShareInfoReply(boardCode));
    	
    	return "user/main/shareInfoDetail";
    }
    
    /**
     * 정보공유게시판 댓글 작성
     */
    @PostMapping("insert/shareInfo/reply")
    public String insertShareInfoReply(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, @ModelAttribute FreeBoardReplyDTO reply) {
    	
    	reply.setBoardCode(boardCode);
    	reply.setUserCode(loginUser.getCode());
    	
    	if(shareInfoService.insertShareInfoReply(reply) > 0 ) {
    		System.out.println("댓글 작성 성공");
    	} else {
    		System.out.println("댓글 작성 실패");
    	}
    	
    	return "redirect:/user/select/shareInfo/detail?boardCode="+boardCode;
    }
    
    /**
     * 쪽지 보내기
     */
    @PostMapping("insert/shareInfo/message")
    public String insertShareInfoMessage(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, @ModelAttribute MessageTableDTO message, RedirectAttributes rttr) {
    	
    	message.setUserCode(loginUser.getCode());
    	System.out.println(message);
    	
    	if(message.getUserCode() == message.getUserCode1()) {
    		rttr.addFlashAttribute("message", "본인에게는 쪽지를 보낼 수 없습니다.");
    		return "redirect:/user/select/shareInfo/detail?boardCode="+boardCode;
    	}
    	
    	if(shareInfoService.insertShareInfoMessage(message) > 0) {
    		System.out.println("쪽지보내기 성공");
    	} else {
    		System.out.println("쪽지보내기 실패");
    	}
    	
    	rttr.addFlashAttribute("message", "쪽지 전송에 성공하였습니다. 보낸 쪽지는 마이페이지에서 확인 가능합니다.");
    	
    	return "redirect:/user/select/shareInfo/detail?boardCode="+boardCode;
    }
    
    /**
     * 정보공유게시판 게시글 신고
     */
    @PostMapping("insert/shareInfo/report")
    public String insertShareInfoReport(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, @ModelAttribute FreeBoardReportDTO report) {
    	
    	report.setUserCode(loginUser.getCode());
    	report.setBoardCode(boardCode);
    	
    	if(shareInfoService.insertShareInfoReport(report) > 0) {
    		System.out.println("게시글 신고 성공");
    	} else {
    		System.out.println("게시글 신고 실패");
    	}
    	
    	return "redirect:/user/select/shareInfo/detail?boardCode="+boardCode;
    }
    
    /**
     * 정보공유게시판 댓글 신고
     */
    @PostMapping("insert/shareInfo/reportReply")
    public String insertShareInfoReportReply(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, @ModelAttribute FreeBoardReplyDTO replyReport, @RequestParam String inputReplyCode, @RequestParam String inputuserCode1) {
    	
    	replyReport.setUserCode(loginUser.getCode());
    	replyReport.setReplyCode(Integer.parseInt(inputReplyCode));
    	replyReport.setUserCode1(Integer.parseInt(inputuserCode1));
    	System.out.println(replyReport);
    	
    	if(shareInfoService.insertShareInfoReportReply(replyReport) > 0) {
    		System.out.println("댓글신고 성공");
    	} else {
    		System.out.println("댓글신고 실패");
    	}
    	
    	return "redirect:/user/select/shareInfo/detail?boardCode="+boardCode;
    }
    
    /**
     * 정보공유 게시글 작성 페이지로 이동
     */
    @GetMapping("select/shareInfo")
    public String selectWriteShareInfo(Model model, @SessionAttribute UserInfoDTO loginUser) {
    	
    	model.addAttribute("writeUser", shareInfoService.writeShareInfo(loginUser.getCode()));
    	
    	return "user/main/shareInfoWrite";
    }
    
    /**
	 * 정보공유 게시글 작성 이미지 업로드
	 */
	@PostMapping(value="insert/shareInfoImg", produces ="application/json")
	@ResponseBody
	public String insertShareInfoFile(Model model, @SessionAttribute UserInfoDTO loginUser, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		  
		String fileRoot = request.getSession().getServletContext().getRealPath("resources");	// 저장될 파일 경로
		String filePath = fileRoot + "\\uploadFiles";
		String pictureName = multipartFile.getOriginalFilename(); //오리지날 파일명 String
		String extension = pictureName.substring(pictureName.lastIndexOf(".")); //파일 확장자
		
		String pictureNewName = UUID.randomUUID().toString().replace("-", "") + extension; //저장될 파일 명
		
		File pictureURL = new File(filePath + "\\" + pictureNewName);
		
		try { 
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, pictureURL); //파일 저장
			jsonObject.addProperty("url", "/petpal/resources/uploadFiles/" + pictureNewName);
			jsonObject.addProperty("responseCode", "success");
			
			jsonObject.addProperty("pictureName", pictureName);
			jsonObject.addProperty("pictureURL", filePath);
			jsonObject.addProperty("pictureNewName", pictureNewName);
			jsonObject.addProperty("pictureUtilPath", "resources\\uploadFiles\\" + pictureNewName);
			
		
		} catch (IOException e) { 
			FileUtils.deleteQuietly(pictureURL); //저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject.toString();
	}
	
	/**
	 * 정보공유게시판 게시글 작성
	 */
	@PostMapping("insert/write/shareInfo")
	public String insertWriteShareInfo(@ModelAttribute ShareInfoDTO shareInfo, @ModelAttribute PictureDTO picture, @SessionAttribute UserInfoDTO loginUser, RedirectAttributes rttr) {
		
		shareInfo.setUserCode(loginUser.getCode());
		
		if(shareInfo.getPictureName().equals("")) { // 이미지없이 게시글 작성시
			rttr.addFlashAttribute("message", "최소 한 개 이상의 이미지가 필요합니다.");
			return "redirect:/user/select/shareInfo";

		} else { // 이미지가 있는 게시글 작성시
			if(shareInfoService.inserWriteShreInfo(shareInfo) > 1) {
				System.out.println("게시글 작성 성공");
			}
		}
		rttr.addFlashAttribute("message", "글 작성 신청이 완료되었습니다. 검토에는 1~2일 소요 될 수 있습니다.");
		
		return "redirect:/user/select/shareInfo/list";
	}
	
	/**
	 * 정보공유 게시판 게시글 수정페이지로 이동
	 */
	@GetMapping("select/shareInfo/modify")
	public String selectShareInfoModify(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, Model model) {
		
		model.addAttribute("modifyInfo", shareInfoService.selectShareInfoDetail(boardCode));
		
		return "user/main/shareInfoModify";
	}
	
	/**
	 * 정보공유 게시판 게시글 수정
	 */
	@PostMapping("update/modify/shareInfo")
	public String updateModifyShareInfo(@ModelAttribute ShareInfoDTO shareInfo, RedirectAttributes rttr) {
		
		if(shareInfo.getPictureName().equals("")) { // 이미지없이 게시글 작성시
			rttr.addFlashAttribute("message", "최소 한 개 이상의 이미지가 필요합니다.");
			return "redirect:/user/select/shareInfo/modify";

		} else { // 이미지가 있는 게시글 작성시
			if(shareInfoService.updateModifyShareInfo(shareInfo) > 1) {
				System.out.println("게시글 수정 성공");
			} else {
				System.out.println("게시글 수정 실패");
			}
		}
		
		rttr.addFlashAttribute("message", "글 수정 신청이 완료되었습니다. 검토에는 1~2일 소요 될 수 있습니다.");
		
		return "redirect:/user/select/shareInfo/list";
	}
	
	
	
	
	
	
	
	
	/**
     * 프렌들리 플레이스 게시판 리스트 조회
     */
    @GetMapping("select/sharePlace/list")
    public String selectSharePlaceList(Model model, HttpServletResponse response, HttpServletRequest request
    		, @ModelAttribute FriendlyPlaceDTO sharePlace
    		, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
    	
    	Cookie[] cookies = request.getCookies();
    	
    	for(Cookie cookie: cookies) {
    		
    		if(!(cookie.getName().equals("sharePlace"))) {
    			
    			cookie = new Cookie("sharePlace",null); 		//sharInfo라는 이름의 쿠키 생성
    			cookie.setComment("sharePlace 게시글 조회 확인");		//해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);						//사용자에게 해당 쿠키를 추가
    			
    		}
    		
    		if(!(cookie.getName().equals("AdCookie"))) {		// 광고
    			
    			cookie = new Cookie("AdCookie",null); 			// AdCookie라는 이름의 쿠키 생성
    			cookie.setComment("AdCookie 게시글 조회 확인");		// 해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);						// 사용자에게 해당 쿠키를 추가
    			
    		}
    	}
    	
    	// 페이징처리
    	int total = shareInfoService.selectSharePlaceCount();
    	
    	if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "10";
		}
    	
    	String keyWord = "";
    	
    	if(sharePlace.getKeyWord() == null) { // keyWord 검색했을 때
    		sharePlace.setKeyWord(keyWord);
    	} else { // keyWord 검색 안했을 때
    		keyWord = sharePlace.getKeyWord();
    	}
    	
    	sharePlace.setTotal(total);
    	sharePlace.setNowPage(Integer.parseInt(nowPage));
    	sharePlace.setCntPerPage(Integer.parseInt(cntPerPage));
    	
    	sharePlace = new FriendlyPlaceDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
    	
    	sharePlace.setKeyWord(keyWord);
    	
    	model.addAttribute("paging", sharePlace);
        model.addAttribute("sharePlaceList", shareInfoService.selectSharePlaceList(sharePlace));
        model.addAttribute("randomAdPlace", adService.selectRandomAdPlace());
    	
    	return "user/main/sharePlace";
    }
    
    /**
     * 프렌들리 플레이스 게시판 상세내용 조회
     */
    @GetMapping("select/sharePlace/detail")
	public String selectSharePlaceDetail(@CookieValue(name = "sharePlace") String cookie, HttpServletResponse response,
			Model model , @RequestParam int boardCode) {
    	
    	if(!(cookie.contains(String.valueOf(boardCode)))) {
			
			cookie += boardCode + "/";
			
			// 조회수 카운트
			shareInfoService.updateSharePlaceViews(boardCode);
			
		}
    	
    	response.addCookie(new Cookie("sharePlace", cookie));
    	
    	// 상세 내용 조회      
        model.addAttribute("sharePlaceDetail", shareInfoService.selectSharePlaceDetail(boardCode));
        // 댓글 내용 조회
        model.addAttribute("sharePlaceReply", shareInfoService.selectSharePlaceReply(boardCode));
    	
    	return "user/main/sharePlaceDetail";
    }
    
    /**
     * 프렌들리 플레이스 게시판 댓글 작성
     */
    @PostMapping("insert/sharePlace/reply")
    public String insertSharePlaceReply(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, @ModelAttribute FreeBoardReplyDTO reply) {
    	
    	reply.setBoardCode(boardCode);
    	reply.setUserCode(loginUser.getCode());
    	
    	if(shareInfoService.insertSharePlaceReply(reply) > 0 ) {
    		System.out.println("댓글 작성 성공");
    	} else {
    		System.out.println("댓글 작성 실패");
    	}
    	
    	return "redirect:/user/select/sharePlace/detail?boardCode="+boardCode;
    }
    
    /**
     * 쪽지보내기
     */
    @PostMapping("insert/sharePlace/message")
    public String insertSharePlaceMessage(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, @ModelAttribute MessageTableDTO message, RedirectAttributes rttr) {
    	
    	message.setUserCode(loginUser.getCode());
    	System.out.println(message);
    	
    	if(message.getUserCode() == message.getUserCode1()) {
    		rttr.addFlashAttribute("message", "본인에게는 쪽지를 보낼 수 없습니다.");
    		return "redirect:/user/select/sharePlace/detail?boardCode="+boardCode;
    	}
    	
    	if(shareInfoService.insertShareInfoMessage(message) > 0) {
    		System.out.println("쪽지보내기 성공");
    	} else {
    		System.out.println("쪽지보내기 실패");
    	}
    	
    	rttr.addFlashAttribute("message", "쪽지 전송에 성공하였습니다. 보낸 쪽지는 마이페이지에서 확인 가능합니다.");
    	
    	return "redirect:/user/select/sharePlace/detail?boardCode="+boardCode;
    }
    
    /**
     * 프렌들리 플레이스 게시판 게시글 신고
     */
    @PostMapping("insert/sharePlace/report")
    public String insertSharePlaceReport(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, @ModelAttribute FreeBoardReportDTO report) {
    	
    	report.setUserCode(loginUser.getCode());
    	report.setBoardCode(boardCode);
    	
    	if(shareInfoService.insertSharePlaceReport(report) > 0) {
    		System.out.println("게시글 신고 성공");
    	} else {
    		System.out.println("게시글 신고 실패");
    	}
    	
    	return "redirect:/user/select/sharePlace/detail?boardCode="+boardCode;
    }
    
    /**
     * 프렌들리 플레이스 게시판 댓글 신고
     */
    @PostMapping("insert/sharePlace/reportReply")
    public String insertSharePlaceReportReply(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, @ModelAttribute FreeBoardReplyDTO replyReport, @RequestParam String inputReplyCode, @RequestParam String inputuserCode1) {
    	
    	replyReport.setUserCode(loginUser.getCode());
    	replyReport.setReplyCode(Integer.parseInt(inputReplyCode));
    	replyReport.setUserCode1(Integer.parseInt(inputuserCode1));
    	System.out.println(replyReport);
    	
    	if(shareInfoService.insertShareInfoReportReply(replyReport) > 0) {
    		System.out.println("댓글신고 성공");
    	} else {
    		System.out.println("댓글신고 실패");
    	}
    	
    	return "redirect:/user/select/sharePlace/detail?boardCode="+boardCode;
    }
	
    /**
     * 프렌들리 플레이스 게시글 작성페이지로 이동
     */
    @GetMapping("select/write/sharePlace")
    public String selectWruteSharePlace(Model model, @SessionAttribute UserInfoDTO loginUser) {
    	
    	return "user/main/sharePlaceWrite";
    }
    
    /**
	 * 프렌들리 플레이스 게시글 작성 이미지 업로드
	 */
	@PostMapping(value="insert/sharePlaceImg", produces ="application/json")
	@ResponseBody
	public String insertSharePlaceFile(Model model, @SessionAttribute UserInfoDTO loginUser, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		  
		String fileRoot = request.getSession().getServletContext().getRealPath("resources");	// 저장될 파일 경로
		String filePath = fileRoot + "\\uploadFiles";
		String pictureName = multipartFile.getOriginalFilename(); //오리지날 파일명 String
		String extension = pictureName.substring(pictureName.lastIndexOf(".")); //파일 확장자
		
		String pictureNewName = UUID.randomUUID().toString().replace("-", "") + extension; //저장될 파일 명
		
		File pictureURL = new File(filePath + "\\" + pictureNewName);
		
		try { 
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, pictureURL); //파일 저장
			jsonObject.addProperty("url", "/petpal/resources/uploadFiles/" + pictureNewName);
			jsonObject.addProperty("responseCode", "success");
			
			jsonObject.addProperty("pictureName", pictureName);
			jsonObject.addProperty("pictureURL", filePath);
			jsonObject.addProperty("pictureNewName", pictureNewName);
			jsonObject.addProperty("pictureUtilPath", "resources\\uploadFiles\\" + pictureNewName);
			
		
		} catch (IOException e) { 
			FileUtils.deleteQuietly(pictureURL); //저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject.toString();
	}
	
	/**
	 * 프렌들리 플레이스 게시글 작성
	 */
	@PostMapping("insert/write/sharePlace")
	public String insertWriteSharePlace(@ModelAttribute FriendlyPlaceDTO sharePlace, @SessionAttribute UserInfoDTO loginUser, RedirectAttributes rttr) {
		
		sharePlace.setUserCode(loginUser.getCode());
		
		if(sharePlace.getPictureName().equals("")) { // 이미지없이 게시글 작성시
			
			rttr.addFlashAttribute("message", "최소 한 개 이상의 이미지가 필요합니다.");
			return "redirect:/user/select/write/sharePlace";
			
		} else { // 이미지가 있는 게시글 작성시
			
			if(shareInfoService.insertWriteShrePlace(sharePlace) > 1) {
				System.out.println("게시글 작성 성공");
			}
			
		}
		
		rttr.addFlashAttribute("message", "글 작성 신청이 완료되었습니다. 검토에는 1~2일 소요 될 수 있습니다.");
		
		return "redirect:/user/select/sharePlace/list";
	}
	
	/**
	 * 프렌들리플레이스 게시글 수정 페이지로 이동
	 */
	@GetMapping("select/sharePlace/modify")
	public String selectSharePlaceModify(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, Model model) {
		
		model.addAttribute("modifyInfo", shareInfoService.selectSharePlaceDetail(boardCode));
		
		return "user/main/sharePlaceModify";
	}
	
	/**
	 * 프렌들리플레이스 게시글 수정
	 */
	@PostMapping("update/modify/sharePlace")
	public String updateModifySharePlace(@ModelAttribute FriendlyPlaceDTO sharePlace, RedirectAttributes rttr) {
		
		if(sharePlace.getPictureName().equals("")) { // 이미지없이 게시글 작성시
			rttr.addFlashAttribute("message", "최소 한 개 이상의 이미지가 필요합니다.");
			return "redirect:/user/select/sharePlace/modify";

		} else { // 이미지가 있는 게시글 작성시
			if(shareInfoService.updateModifySharePlace(sharePlace) > 1) {
				System.out.println("게시글 수정 성공");
			} else {
				System.out.println("게시글 수정 실패");
			}
		}
		
		rttr.addFlashAttribute("message", "글 수정 신청이 완료되었습니다. 검토에는 1~2일 소요 될 수 있습니다.");
		
		return "redirect:/user/select/sharePlace/list";
	}
	
}

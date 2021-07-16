package com.nobanryeo.petpal.user.ad.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.nobanryeo.petpal.user.ad.service.FreeBoardService;
import com.nobanryeo.petpal.user.ad.service.UserAdService;
import com.nobanryeo.petpal.user.dto.AdDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

/**
 * @author WEENARA
 * 자유게시판 Controller
 */
@Controller
@RequestMapping("/user/*")
public class FreeBoardController {

    private final FreeBoardService freeBoardService;
    private final UserAdService adService;
    
    @Autowired
    public FreeBoardController(FreeBoardService freeBoardService, UserAdService adService) {
       
        this.freeBoardService = freeBoardService;
        this.adService = adService;
    }
    
    /**
     * 자유게시판 전체 게시글 조회
     */
    @GetMapping("select/freeboard/list")
    public String selectFreeBoardList(Model model, HttpServletResponse response, HttpServletRequest request, PageDTO page
    		, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
    	
    	Cookie[] cookies = request.getCookies();
    	
    	for(Cookie cookie: cookies) {
    		
    		if(!(cookie.getName().equals("freeboard"))) {		// 자유게시판 게시글
    			
    			cookie = new Cookie("freeboard",null); 			// freeboard라는 이름의 쿠키 생성
    			cookie.setComment("freeboard 게시글 조회 확인");		// 해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);						// 사용자에게 해당 쿠키를 추가
    			
    		}
    		
    		if(!(cookie.getName().equals("AdCookie"))) {		// 광고
    			
    			cookie = new Cookie("AdCookie",null); 			// AdCookie라는 이름의 쿠키 생성
    			cookie.setComment("AdCookie 게시글 조회 확인");		// 해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);						// 사용자에게 해당 쿠키를 추가
    			
    		}
    	}
    	
    	// 페이징처리
    	int total = freeBoardService.selectFreeBoardCount();
    	
    	if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "8";
		}
    	
    	page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
    	
    	model.addAttribute("paging", page);
        model.addAttribute("freeBoardList", freeBoardService.selectFreeBoardList(page));
        model.addAttribute("randomAdNonPlace", adService.selectRandomAdNonPlace());
       
        return "user/community/freeBoardList";
    }
    
    /**
     * 자유게시판 상세 내용 조회
     * 게시글 내용, 사진, 댓글
     */
    @GetMapping("select/freeboard/detail")
    public String selectFreeBoardDetail(@CookieValue(name = "freeboard") String cookie, HttpServletResponse response, Model model, @RequestParam int boardCode) {
       
		if(!(cookie.contains(String.valueOf(boardCode)))) {
			
			cookie += boardCode + "/";
			
			// 조회수 카운트
			freeBoardService.updateFreeBoardViews(boardCode);
			
		}
		
		response.addCookie(new Cookie("freeboard", cookie));
    	
        // 상세 내용 조회      
        model.addAttribute("freeBoardDetail", freeBoardService.selectFreeBoardDetail(boardCode));
        // 게시글 사진 조회
        model.addAttribute("freeBoardImg", freeBoardService.selectFreeBoardImg(boardCode));
        // 댓글 내용 조회
        model.addAttribute("freeBoardReply", freeBoardService.selectFreeBoardReply(boardCode));
        
        return "user/community/freeBoardDetail";
    }
    
    /**
     * 자유게시판 댓글 작성
     */
    @PostMapping("insert/freeboard/reply")
    public String insertFreeBoardReply(@ModelAttribute FreeBoardReplyDTO reply, Model model, @RequestParam int code, @SessionAttribute UserInfoDTO loginUser) {
       
        reply.setBoardCode(code);
        reply.setUserCode(loginUser.getCode());
        System.out.println(reply);
        
        if(freeBoardService.insertFreeBoardReply(reply) > 0) {
           System.out.println("댓글 등록 성공");
        } else {
           System.out.println("댓글 등록 실패");
        }
              
        return "redirect:/user/select/freeboard/detail?boardCode="+code;
    }
    
    /**
     * 쪽지 작성
     */
    @PostMapping("insert/freeboard/message")
    public String insertFreeBoardMessage(@ModelAttribute MessageTableDTO message, Model model, @RequestParam int code, @RequestParam String receiveUserNick, @SessionAttribute UserInfoDTO loginUser, RedirectAttributes rttr) {
       
 	    message.setReceiveUserNick(receiveUserNick);
        message.setUserCode(loginUser.getCode());

        if(message.getUserCode() == message.getUserCode1()) {
    		rttr.addFlashAttribute("message", "본인에게는 쪽지를 보낼 수 없습니다.");
    		return "redirect:/user/select/freeboard/detail?boardCode="+code;
    	}
        
        if(freeBoardService.insertFreeBoardMessage(message) > 0) {
           System.out.println("쪽지 전송 성공");
        } else {
           System.out.println("쪽지 전송 실패");
        }
        
        rttr.addFlashAttribute("message", "쪽지 전송에 성공하였습니다. 보낸 쪽지는 마이페이지에서 확인 가능합니다.");
        
        return "redirect:/user/select/freeboard/detail?boardCode="+code;
    }
    
    /**
     * 자유게시판 신고 작성
     */
    @PostMapping("insert/freeboard/report")
    public String insertFreeBoardReport(@ModelAttribute FreeBoardReportDTO report, Model model, @RequestParam int code, @SessionAttribute UserInfoDTO loginUser) {
       
        report.setUserCode(loginUser.getCode());
        report.setBoardCode(code);
        
        System.out.println(report);
        
        if(freeBoardService.insertFreeBoardReport(report) > 0) {
           System.out.println("신고 성공");
        } else {
           System.out.println("신고 실패");
        }
        
        return "redirect:/user/select/freeboard/detail?boardCode="+code;
    }
   
    /**
     * 자유게시판 댓글 신고 작성
     */
    @PostMapping("insert/freeboard/reportReply")
    public String insertFreeBoardReportReply(@ModelAttribute FreeBoardReplyDTO replyReport, Model model, @RequestParam int code, @RequestParam String inputReplyCode, @RequestParam String inputuserCode1, @SessionAttribute UserInfoDTO loginUser) {
       
 	   replyReport.setUserCode(loginUser.getCode());
 	   replyReport.setReplyCode(Integer.parseInt(inputReplyCode));
 	   replyReport.setBoardCode(code);
 	   replyReport.setUserCode1(Integer.parseInt(inputuserCode1));
       
       System.out.println(replyReport);
       
       if(freeBoardService.insertFreeBoardReplyReport(replyReport) > 0) {
          System.out.println("신고 성공");
       } else {
          System.out.println("신고 실패");
       }
       
       return "redirect:/user/select/freeboard/detail?boardCode="+code;
    }
    
    /**
     * 자유게시판 글작성 페이지 이동
  	*/
    @GetMapping("insert/freeboard")
    public String writeFreeBoard(Model model, @SessionAttribute UserInfoDTO loginUser) {
 	   
 	   model.addAttribute("writeUser", freeBoardService.writeFreeBoard(loginUser.getCode()));
 	   
 	   return "/user/community/freeBoardWrite";
    }
	
	/**
	 * 자유게시판 게시글 작성 이미지 업로드
	 */
	@PostMapping(value="insert/freeboardImg", produces ="application/json")
	@ResponseBody
	public String insertFreeBoardFile(Model model, @SessionAttribute UserInfoDTO loginUser, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
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
	 * 자유게시판 게시글 작성
	 */
	@PostMapping("insert/write/freeboard")
	public String insertWriteFreeBoard(Model model, @ModelAttribute FreeBoardDTO freeBoard, @ModelAttribute PictureDTO picture, @SessionAttribute UserInfoDTO loginUser) {
		
		freeBoard.setUserCode(loginUser.getCode());
		picture.setUserCode(loginUser.getCode());
		
		System.out.println(freeBoard);
		System.out.println(picture);
		
		// 게시글 insert
		if(freeBoardService.insertWriteFreeBoard(freeBoard) > 0) {
			System.out.println("게시글 작성 성공");
		
			// 이미지 insert -> 이미지 없을때 insert 안해줌
			if(picture.getPictureName().equals("")) {
				
			} else {
				
				if(freeBoardService.insertFreeBoardImg(picture) > 0) {
					System.out.println("이미지 작성 성공");
				} else {
					System.out.println("이미지 작성 실패");
				}
				
			}
			
		} else {
			System.out.println("게시글 작성 실패");
		}
		
		return "redirect:/user/select/freeboard/list";
		
	}
	
	/**
	 * 자유게시판 게시글 수정 페이지로 이동
	 */
	@GetMapping("select/freeboard/modify")
	public String selectFreeBoardModify(@SessionAttribute UserInfoDTO loginUser, @RequestParam int boardCode, Model model) {
		
		model.addAttribute("modifyInfo", freeBoardService.selectFreeBoardDetail(boardCode));
		
		return "user/community/freeBoardModify";
	}
	
	/**
	 * 자유게시판 게시글 수정
	 */
	@PostMapping("update/modify/freeboard")
	public String updateModifyFreeBoard(@ModelAttribute FreeBoardDTO freeBoard) {
		
		int boardCode = freeBoard.getBoardCode();
		
		if(freeBoardService.updateModifyFreeBoard(freeBoard) > 0) {
			System.out.println("게시글 수정 성공");
		} else {
			System.out.println("게시글 수정 실패");
		}
		
		return "redirect:/user/select/freeboard/detail?boardCode="+boardCode;
	}

}
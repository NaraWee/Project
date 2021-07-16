package com.nobanryeo.petpal.user.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.nobanryeo.petpal.user.ad.service.UserAdService;
import com.nobanryeo.petpal.user.dto.AdDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.ReviewDTO;
import com.nobanryeo.petpal.user.dto.ReviewReplyDTO;
import com.nobanryeo.petpal.user.dto.ReviewReportDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;
import com.nobanryeo.petpal.user.mypage.service.ReviewPostService;

@Controller
@RequestMapping("/user/*")
public class ReviewPostController {
	
	private final ReviewPostService reviewService;
	private final UserAdService adService;
	
	@Autowired
	public ReviewPostController(ReviewPostService reviewService, UserAdService adService) {
		this.reviewService = reviewService;
		this.adService = adService;
	}
	
	/**
	 * 리뷰 리스트
	 * @param model
	 * @param reviewDTO
	 * @param page
	 * @param nowPage
	 * @param cntPerPage
	 * @return
	 */
	@GetMapping("review")
	public String review(Model model, ReviewDTO reviewDTO, PageDTO page
			, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage
			, HttpServletResponse response, HttpServletRequest request) {
		
		Cookie[] cookies = request.getCookies();
    	
    	for(Cookie cookie: cookies) {
    		
    		if(!(cookie.getName().equals("reviewboard"))) {
    			
    			cookie = new Cookie("reviewboard",null); 			//reviewboard라는 이름의 쿠키 생성
    			cookie.setComment("reviewboard 게시글 조회 확인");		//해당 쿠키가 어떤 용도인지 커멘트
    			response.addCookie(cookie);						//사용자에게 해당 쿠키를 추가
    			
    		}
    		if(!(cookie.getName().equals("AdCookie"))) {      // 광고
                
                cookie = new Cookie("AdCookie",null);       // AdCookie라는 이름의 쿠키 생성
                cookie.setComment("AdCookie 게시글 조회 확인");   // 해당 쿠키가 어떤 용도인지 커멘트
                response.addCookie(cookie);                  // 사용자에게 해당 쿠키를 추가
                
             }
    	}
		
		int total = reviewService.selectReviewPostCount();
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		
		page = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		
		List<ReviewDTO> reviewList = reviewService.selectReviewPostList(page);
		
		System.out.println(reviewList);
		
		model.addAttribute("paging", page);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("randomAd", adService.selectRandomAdNonPlace());
		
		return "user/community/reviewList";
	}
	
	/**
	 * 리뷰디테일 출력
	 * @param boardCode
	 * @param model
	 * @return
	 */
	@GetMapping("review/reviewDetail")
	public String reviewDetail(@RequestParam int boardCode, Model model, @CookieValue(name = "reviewboard") String cookie
			, HttpServletResponse response) {

		
		if(!(cookie.contains(String.valueOf(boardCode)))) {
			cookie += boardCode + "/";
			//조회수업
			reviewService.updateViewsCount(boardCode);
		}
		response.addCookie(new Cookie("reviewboard", cookie));
		
		//게시"글"
		model.addAttribute("review", reviewService.selectReviewDetail(boardCode));
		//댓글
		model.addAttribute("reply", reviewService.selectReviewReply(boardCode));
		//사진
		model.addAttribute("reviewImg", reviewService.selectReviewImg(boardCode));
	
			

		return "user/community/reviewDetail";
	}
	
	
	/**
	 * 글작성 페이지 띄우기
	 * @param model
	 * @param loginUser
	 * @return
	 */
	@GetMapping("review/reviewWrite")
	public String reviewWrite(Model model, @SessionAttribute UserInfoDTO loginUser) {
		
		return "user/community/reviewDetailWrite";
	}
	
	/**
	 * 이미지가 들어온 즉시 이미지 파일을 저장
	 * @param model
	 * @param loginUser
	 * @param multipartFile
	 * @param request
	 * @return
	 */
	@PostMapping(value = "/insert/reviewboardImg", produces ="application/json")
	@ResponseBody
	public String insertReviewBoardFile(Model model, @SessionAttribute UserInfoDTO loginUser
			, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		  
		String fileRoot = request.getSession().getServletContext().getRealPath("resources"); // 저장될 파일 경로
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
	 * 게시물 작성
	 * @param model
	 * @param reviewDTO
	 * @param picture
	 * @param loginUser
	 * @return
	 */
	@PostMapping(value = "review/reviewWrite/insertBoard")
	public String insertWriteReviewBoard(Model model, @ModelAttribute ReviewDTO reviewDTO, @ModelAttribute PictureDTO picture, @SessionAttribute UserInfoDTO loginUser) {
		
		reviewDTO.setUserCode(loginUser.getCode());
		picture.setUserCode(loginUser.getCode());
		
		System.out.println(reviewDTO);
		System.out.println(picture);
		
		// 게시글 insert
		if(reviewService.insertWriteReviewBoard(reviewDTO) > 0) {
			System.out.println("게시글 작성 성공");
		} else {
			System.out.println("게시글 작성 실패");
		}
		
		// 이미지 insert. 단, 이미지 없을때 insert 안해준다
		if(picture.getPictureName().equals("")) {
			
		} else {
			
			if(reviewService.insertReviewBoardImg(picture) > 0) {
				System.out.println("이미지 넣기 성공!!!!!!!");
			} else {
				System.out.println("이미지 넣기 실패.............");
			}
			
		}
		
		return "redirect:/user/review";
		
	}
	
	 /**
	  * 쪽지 보내기
	 * @param message
	 * @param model
	 * @param code
	 * @param receiveUserNick
	 * @param loginUser
	 * @param rttr
	 * @return
	 */
	@PostMapping("review/reviewDetail/message")
	 public String insertFreeBoardMessage(@ModelAttribute MessageTableDTO message, 
			 Model model, @RequestParam int code, @RequestParam String receiveUserNick
			 , RedirectAttributes rttr, @RequestParam(defaultValue = "0", required = false) int sendUserCode) {
		
	    
	     message.setReceiveUserNick(receiveUserNick);
	     
	     if(sendUserCode == 0) {
	    	 rttr.addFlashAttribute("message", "쪽지 보내기는 펫팔의 회원만 가능합니다. 회원가입/로그인을 먼저 해주세요!");
	    	 return "redirect:/user/login";
	     } else {
	    	 message.setUserCode(sendUserCode);
	     }
	     
	     if(reviewService.insertReviewBoardMessage(message) > 0) {
	        System.out.println("쪽지 전송 성공!!");
	     } else {
	        System.out.println("쪽지 전송 실패...");
	     }
	     
	     rttr.addFlashAttribute("message", "쪽지 전송에 성공하였습니다. 보낸 쪽지는 마이페이지에서 확인 가능합니다.");
	     
	     return "redirect:/user/review/reviewDetail?boardCode="+code;
	 }
	
	
	/**
	 * 게시물 신고
	 * @param report
	 * @param model
	 * @param code
	 * @param sendUserCode
	 * @return
	 */
	@PostMapping("review/reviewDetail/boardReport")
	public String insertReviewBoardReport(@ModelAttribute ReviewReportDTO reportDTO, Model model, @RequestParam int code
			, @RequestParam(defaultValue = "0", required = false) int user, RedirectAttributes rttr) {
		
		reportDTO.setBoardCode(code);
		
		if(user == 0) {
			rttr.addFlashAttribute("message", "게시물 신고는 펫팔의 회원만 가능합니다. 회원가입/로그인을 먼저 해주세요!");
			return "redirect:/user/login";
		} else {
			reportDTO.setUserCode(user);
		}
		
        if(reviewService.insertReviewBoardReport(reportDTO) > 0) {
        	rttr.addFlashAttribute("message", "신고가 정상적으로 접수됐습니다. 신고에 대한 처리는 1~2일 소요될 수 있으며, 신고 내역에서 확인 가능합니다.");
        	return "redirect:/user/review/reviewDetail?boardCode="+code;
        } else {
        	rttr.addFlashAttribute("message", "신고가 접수되지 않았습니다. 지속적인 실패는 고객센터에 문의 바랍니다.");
        	return "redirect:/user/review/reviewDetail?boardCode="+code;
           
        }
        
    }
	
	/**
	 * 댓글남기기
	 * @param replyDTO
	 * @param model
	 * @param user
	 * @param rttr
	 * @return
	 */
	@PostMapping("review/reviewDetail/insertReply")
    public String insertReviewBoardReply(@ModelAttribute ReviewReplyDTO replyDTO, Model model
    		, @RequestParam(defaultValue = "0", required = false) int user
    		, RedirectAttributes rttr) {
       
        System.out.println(replyDTO);
        
        if(user == 0) {
        	rttr.addFlashAttribute("message", "댓글 남기기는 펫팔의 회원만 가능합니다. 회원가입/로그인을 먼저 해주세요!");
			return "redirect:/user/login";
        } else {
        	replyDTO.setUserCode(user);
        	System.out.println(replyDTO);
        }
        
        if(reviewService.insertReviewBoardReply(replyDTO) > 0) {
           System.out.println("댓글 등록 성공");
        } else {
           System.out.println("댓글 등록 실패");
        }
              
        return "redirect:/user/review/reviewDetail?boardCode="+replyDTO.getBoardCode();
    }
	
	/**
	 * 댓글 신고
	 * @param replyDTO
	 * @param model
	 * @param user
	 * @param rttr
	 * @return
	 */
	@PostMapping("review/reviewDetail/reviewReplyReport")
	public String insertReviewReplyReport(@ModelAttribute ReviewReplyDTO replyDTO, Model model
			, @RequestParam(defaultValue = "0", required = false) int user, RedirectAttributes rttr) {
		
		System.out.println(replyDTO);
		
		if(user == 0) {
			rttr.addFlashAttribute("message", "댓글 신고는 펫팔의 회원만 가능합니다. 회원가입/로그인을 먼저 해주세요!");
			return "redirect:/user/login";
		} else {
			replyDTO.setUserCode(user);
        	System.out.println(replyDTO);
		}
		
		if(reviewService.insertReviewReplyReport(replyDTO) > 0) {
	          System.out.println("신고 성공");
	          rttr.addFlashAttribute("message", "신고가 정상적으로 접수됐습니다. 신고에 대한 처리는 1~2일 소요될 수 있으며, 신고 내역에서 확인 가능합니다.");
	          return "redirect:/user/review/reviewDetail?boardCode="+replyDTO.getBoardCode();
	       } else {
	    	   rttr.addFlashAttribute("message", "신고가 접수되지 않았습니다. 지속적인 실패는 고객센터에 문의 바랍니다.");
	    	   return "redirect:/user/review/reviewDetail?boardCode="+replyDTO.getBoardCode();
	       }
		
	}
	
	/**
	 * 게시물 수정페이지 연결
	 * @param reviewDTO
	 * @param model
	 * @param picture
	 * @param boardCode
	 * @param rttr
	 * @return
	 */
	@GetMapping("review/writeUpdate")
	public String updateReviewWrite(@ModelAttribute ReviewDTO reviewDTO, Model model, @ModelAttribute PictureDTO picture
			, @RequestParam(value = "boardCode", defaultValue = "0")int boardCode
			, @RequestParam(required = false) String baordContent
			, RedirectAttributes rttr) {

		
		if(boardCode == 0) {
			rttr.addFlashAttribute("message", "잘못된 경로로 접근하셨습니다!");
			return "redirect:/user/review";
		}
		
		model.addAttribute("review", reviewService.selectReviewDetail(boardCode));
		
		return "user/community/reviewModify";
	}
	
	/**
	 * 리뷰 수정
	 * @param reviewDTO
	 * @return
	 */
	@PostMapping("review/writeUpdate/updateReview")
	public String updateReviewBoard(@ModelAttribute ReviewDTO reviewDTO) {
		
		int boardCode = reviewDTO.getBoardCode();
		
		if(reviewService.updateReviewBoard(reviewDTO) > 0) {
			System.out.println("게시글 수정 성공");
		} else {
			System.out.println("게시글 수정 실패");
		}
		
		return "redirect:/user/review/reviewDetail?boardCode="+boardCode;
	}
	

}





















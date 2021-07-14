package com.nobanryeo.petpal.user.ad.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

/**
 * @author WEENARA
 * 사용자 광고 Controller
 */
@Controller
@RequestMapping("/user/*")
public class UserAdController {

	private final UserAdService adService;
		
	@Autowired
	public UserAdController(UserAdService adService) {
			
		this.adService = adService;
	}
	
	/**
	 * 광고 신청 내역 조회
	 */
	@GetMapping("select/ad/list")
	public String selectAdList(Model model, @SessionAttribute UserInfoDTO loginUser
			, @RequestParam(value = "type", defaultValue =  "A") String type
    		, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		
		AdDTO adDTO = new AdDTO();
		adDTO.setUserCode(loginUser.getCode());
		
		if(type.equals("A")) {
			
			// 페이징처리
	    	int total = adService.selectAdListCount(adDTO);
	    	
	    	if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}

	    	adDTO.setTotal(total);
	    	adDTO.setNowPage(Integer.parseInt(nowPage));
	    	adDTO.setCntPerPage(Integer.parseInt(cntPerPage));
	    	
	    	adDTO = new AdDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	    	adDTO.setUserCode(loginUser.getCode());
	    	
	    	model.addAttribute("paging", adDTO);
			model.addAttribute("adList", adService.selectAdList(adDTO));
			
			
			model.addAttribute("adList2", adService.selectAdList(adDTO));
			model.addAttribute("type", "A");
			model.addAttribute("num", 0);
			
		} else if(type.equals("B")) {
			
			// 페이징처리
			int total = adService.selectAdListCount(adDTO);
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "10";
			}
			
			adDTO.setTotal(total);
			adDTO.setNowPage(Integer.parseInt(nowPage));
			adDTO.setCntPerPage(Integer.parseInt(cntPerPage));
			
			adDTO = new AdDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			adDTO.setUserCode(loginUser.getCode());
			
			model.addAttribute("paging", adDTO);
			model.addAttribute("adList", adService.selectAdList(adDTO));
			
			
			model.addAttribute("adList2", adService.selectAdList(adDTO));
			// 광고 클릭수 조회
			model.addAttribute("adPaymentList", adService.selectAdPaymentList(adDTO));
			model.addAttribute("type", "B");
			model.addAttribute("num", 1);
		}
		
		
		return "user/mypage/adList";
	}
	
	/**
	 * 광고 2차결제 정보 수정
	 */
	@PostMapping("update/ad/morePay")
	public String updateAdMorePay(Model model, @ModelAttribute AdDTO adDTO, @SessionAttribute UserInfoDTO loginUser) {
		
		adDTO.setUserCode(loginUser.getCode());
		
		if(adService.updateAdMorePay(adDTO) > 0) {
			System.out.println("2차결제 완료");
		} else {
			System.out.println("2차결제 실패");
		}
		
		return "redirect:/user/select/ad/list";
	}
	
	/**
	 * 광고 신청 상세 내용 조회(광고 기본 정보)
	 */
	@GetMapping("select/adApply/detail")
	public String selectAdApplyDetail(Model model, @RequestParam int adCode, @SessionAttribute UserInfoDTO loginUser) {
		
		AdDTO adDTO = new AdDTO();
		adDTO.setUserCode(loginUser.getCode());
		adDTO.setAdCode(adCode);
		
		model.addAttribute("adApplyDetail", adService.selectAdApplyDetail(adDTO));
		
		return "user/mypage/adApplyDetail";
	}
	
	/**
	 * 광고 신청 상세 내용 조회(상세 내용)
	 */
	@GetMapping("select/adApply/detail2")
	public String selectAdApplyDetail2(Model model, @RequestParam int adCode, @SessionAttribute UserInfoDTO loginUser) {
		
		AdDTO adDTO = new AdDTO();
		adDTO.setUserCode(loginUser.getCode());
		adDTO.setAdCode(adCode);
		
		model.addAttribute("adApplyDetail", adService.selectAdApplyDetail(adDTO));
		
		return "user/mypage/adApplyDetail2";
	}
	
	/**
	 * 광고문의 페이지로 이동
	 */
	@RequestMapping("write/adQnA")
	public String writeAdQnA(Model model, @SessionAttribute UserInfoDTO loginUser) {
		
		model.addAttribute("writeAdQnA", loginUser.getNikname());
		
		return "user/mypage/adQna";
	}
	
	/**
	 * 광고 문의 작성 이미지 업로드
	 */
	@PostMapping(value="insert/adQnAImg", produces ="application/json")
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
	 * 광고문의 작성
	 */
	@PostMapping("insert/adQnA")
	public String insertAdQnA(@ModelAttribute AdQnADTO adQnA, @SessionAttribute UserInfoDTO loginUser, RedirectAttributes rttr) {
		
		adQnA.setUserCode(loginUser.getCode());
		
		if(adService.insertAdQnA(adQnA) > 0) {
			System.out.println("광고 문의 작성 성공");
			rttr.addFlashAttribute("message", "문의 처리 예상 기간은 문의하고 난 후, 3일 이내입니다. 문의내역은 마이페이지에서 조회가 가능합니다!");
		} else {
			System.out.println("광고 문의 작성 실패");
		}
		
		return "redirect:/";
	}
	
	/**
	 * 광고신청 첫페이지
	 */
	@RequestMapping("select/adsubmit")
	public String AdSubmit1(@SessionAttribute UserInfoDTO loginUser) {
		
		return "user/banner/adSubmit1";	
	}
	
	/**
	 * 광고신청 두번째 페이지
	 */
	@RequestMapping("select/adsubmit2")
	public String AdSubmit2(@SessionAttribute UserInfoDTO loginUser) {
		
		return "user/banner/adSubmit2";	
	}
	
	/**
	 * 광고신청 두번째 페이지 기본정보 넣기
	 */
	@RequestMapping("insert/adsubmit2")
	public String insertAdSubmit2(@ModelAttribute AdDTO adDTO, Model model, @SessionAttribute UserInfoDTO loginUser) {
		
		adDTO.setUserCode(loginUser.getCode());
		
		// adTypeCode 넣어주기
		if(adDTO.getAdTypeName().equals("그 외") && adDTO.getAdWeek() == 1) {
			adDTO.setAdTypeCode(1);
		} else if(adDTO.getAdTypeName().equals("그 외") && adDTO.getAdWeek() == 2) {
			adDTO.setAdTypeCode(3);
		} else if(adDTO.getAdTypeName().equals("장소") && adDTO.getAdWeek() == 1) {
			adDTO.setAdTypeCode(2);
		} else if(adDTO.getAdTypeName().equals("장소") && adDTO.getAdWeek() == 2) {			
			adDTO.setAdTypeCode(4);
		}

		model.addAttribute("insertAdSubmit2", adDTO);
		
		return "user/banner/adSubmit3";
	}
	
	/**
	 * 광고신청 세번째 페이지 광고 이미지 업로드
	 */
	@PostMapping(value="insert/imgTest", produces ="application/json")
	@ResponseBody
	public String insertAdSubmitFile(@ModelAttribute AdDTO adDTO, Model model, @SessionAttribute UserInfoDTO loginUser, @RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		  
		String fileRoot = request.getSession().getServletContext().getRealPath("resources");	// 저장될 파일 경로
		String filePath = fileRoot + "\\uploadFiles";
		String pictureName = multipartFile.getOriginalFilename(); //오리지날 파일명 String
		String extension = pictureName.substring(pictureName.lastIndexOf("."));
		//파일 확장자
		
		String pictureNewName = UUID.randomUUID().toString().replace("-", "") + extension; //저장될 파일 명
		
		File pictureUrl = new File(filePath + "\\" + pictureNewName);
		
		try { 
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, pictureUrl); //파일 저장
			jsonObject.addProperty("url", "/petpal/resources/uploadFiles/" + pictureNewName);
			jsonObject.addProperty("responseCode", "success");
			
			jsonObject.addProperty("pictureName", pictureName);
			jsonObject.addProperty("pictureUrl", filePath);
			jsonObject.addProperty("pictureNewName", pictureNewName);
			jsonObject.addProperty("pictureUtilPath", "resources\\uploadFiles\\" + pictureNewName);
			
		
		} catch (IOException e) { 
			FileUtils.deleteQuietly(pictureUrl); //저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject.toString();
	}
	
	/**
	 * 광고신청 세번째 페이지 광고 내용 insert
	 */
	@PostMapping("insert/adsubmit3")
	public String insertAdSubmit3(@ModelAttribute AdDTO adDTO, Model model, @SessionAttribute UserInfoDTO loginUser, RedirectAttributes rttr) {
		
		adDTO.setUserCode(loginUser.getCode());
		
		if(adDTO.getPictureName().equals("")) {	// 이미지가 존재하지 않을 떄
			
			rttr.addFlashAttribute("message", "광고신청시 최소 한 개 이상의 이미지가 필요합니다.");
			return "redirect:/user/select/adsubmit";
			
		} else { // 이미지가 존재할 떄
			
			if(adService.insertAdSubmit(adDTO) > 0) {
				System.out.println("광고신청1 성공");
			} else {
				System.out.println("광고신청1 실패");
			}
			if(adService.insertAdSubmit2(adDTO) > 0) {
				System.out.println("광고신청2 성공");
			} else {
				System.out.println("광고신청2 실패");
			}
			
		}
		
		return "redirect:/user/select/ad/list";
	}
	
	/**
	 * 광고 1차 선결제 (카카오페이)
	 */
	@PostMapping("update/first/adPayment")
	@ResponseBody
	public String updateFirstAdPayment(@ModelAttribute AdDTO adDTO, @SessionAttribute UserInfoDTO loginUser) {
		
		adDTO.setUserCode(loginUser.getCode());
		
		if(adService.updateFirstAdPayment(adDTO) > 0) {
			System.out.println("결제 정보 수정 성공");
		} else {
			System.out.println("결제 정보 수정 실패");			
		}
		
		return "redirect:/user/select/ad/list";
	}
	
	/**
	 * 광고 취소
	 * @throws ParseException 
	 */
	@PostMapping("update/cancel/ad")
	public String updateCancelAd(HttpServletRequest request, @ModelAttribute AdDTO adDTO, @SessionAttribute UserInfoDTO loginUser, RedirectAttributes rttr) throws ParseException {
		
		// 포맷 맞추기
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = dateFormat.parse(request.getParameter("payDate1st"));
		java.sql.Date payDate1st = new java.sql.Date(utilDate.getTime());
		
		adDTO.setUserCode(loginUser.getCode());
		adDTO.setPayDate1st(payDate1st);
	      
		if(adService.updateCancelAd(adDTO) > 0) {
			System.out.println("광고 취소 성공");
		} else {
			System.out.println("광고 취소 실패");			
		}
		
		rttr.addFlashAttribute("message", "광고 취소가 완료되었습니다. 광고 중이었던 광고는 추가결제금액이 발생할 수 있습니다.");
		
		return "redirect:/user/select/ad/list";
	}
	
	/**
	 * 광고 상세내용 보기(클릭 수 중복제거 및 카운트)
	 */
	@GetMapping("select/ad/detail")
	public String selectAdDetail(@CookieValue(name = "AdCookie", defaultValue = "/") String cookie, HttpServletResponse response, HttpServletRequest request, @ModelAttribute AdDTO adDTO, @RequestParam int adCode, Model model, HttpSession session) {
		
		// 광고 클릭 횟수 추가하기
		if(session.getAttribute("loginUser") == null) { // 로그인 안했을 때
			
			// 비로그인 회원은 쿠키로 광고 클릭 중복제어
			if(!(cookie.contains(String.valueOf(adCode)))) {
				cookie += adCode + "/";
				// 조회수 카운트
				adService.insertAdClickNoUser(adDTO);
			}
			response.addCookie(new Cookie("AdCookie", cookie));
			
		} else { 										// 로그인 했을 떄
			
			UserInfoDTO loginUser = new UserInfoDTO();
			loginUser = (UserInfoDTO) session.getAttribute("loginUser");
			
			adDTO.setUserCode(loginUser.getCode());
			if(adService.selectAdClick(adDTO) <= 0) {	// 해당 유저가 클릭 이력이 없을 떄
				adService.insertAdClick(adDTO);
			}
		}
		
		model.addAttribute("adDetail", adService.selectAdDetail(adCode));
		
		return "user/community/adDetail";
	}
	
}

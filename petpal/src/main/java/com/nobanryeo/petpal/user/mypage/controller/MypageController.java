package com.nobanryeo.petpal.user.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;
import com.nobanryeo.petpal.user.mypage.service.UserService;

@Controller
@RequestMapping("/user/mypage/*")
public class MypageController {
   
   private final UserService userService;
   private final BCryptPasswordEncoder encoder;
   
   @Autowired 
   public MypageController(UserService userService, BCryptPasswordEncoder encoder) { 
      this.userService = userService; 
      this.encoder = encoder;
   }

   @GetMapping(value= {"mypage", "/"})
   public String mypageLoad() {
      return "user/mypage/mypage";
   }
   
   @GetMapping("account")
   public String accountPage() {
      return "user/mypage/accountManagement";
   }
   
   
   @GetMapping("adList")
   public String adList() {
      return "user/mypage/adList";
   }
   
   @PostMapping("updateUserInfo")
   public String updateUserInfo(@ModelAttribute UserInfoDTO userInfo, RedirectAttributes rttr, HttpServletRequest request) {
      System.out.println("수정 될 유저 정보 : " + userInfo);
      System.out.println("암호화 전 비밀번호 : " + userInfo.getPwd());
      
      //비밀번호 암호화 작업
      userInfo.setPwd(encoder.encode(userInfo.getPwd()));
      System.out.println("비밀번호 암호화 : " + userInfo.getPwd());
      
      
      
      boolean updateUserInfo = userService.updateUserInfo(userInfo);
      System.out.println("유저정보 업데이트 결과 : " + updateUserInfo);
      
      if(updateUserInfo == true) {
         
         UserInfoDTO loginUser = userService.selectNewUserInfo(userInfo);
         System.out.println("변경 된 유저 정보 : " + loginUser);
         rttr.addFlashAttribute("message", "정보 수정에 성공했습니다.");
         
         HttpSession session = request.getSession();
         session.setAttribute("loginUser", loginUser);
         
      } else {
         rttr.addFlashAttribute("message", "정보 수정에 실패했습니다.");
      }
      
      return "redirect:/user/mypage/account";
   }
   
   /**
    * 닉네임 중복체크 컨트롤러
    * @param userInfo 수정하려는 닉네임
    * @return
    */
   @PostMapping(value = "updateNickChk", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String updateNickChk(@ModelAttribute UserInfoDTO userInfo) {
      System.out.println("중복확인 하는 닉네임 : "  + userInfo.getNikname());
      
      boolean notOverNick = userService.checkNick(userInfo);
      System.out.println("notOverNick : " + notOverNick);
      
      String result = "";
      
      if(notOverNick == true) {
         result = "success";
      } else {
         result = "fail";
      }
      
      Gson gson = new GsonBuilder().create();
      
      return gson.toJson(result);
   }
   
   /**
    * 이메일 중복체크 컨트롤러
    * @param userInfo
    * @return
    */
   @PostMapping(value = "updateEmailChk", produces = "application/json; charset=UTF-8")
   @ResponseBody
   public String updateEmailChk(@ModelAttribute UserInfoDTO userInfo) {
      
      boolean notOverEmail = userService.checkEmail(userInfo);
      System.out.println("notOverEmail : " + notOverEmail);
      
      String result = "";
      if(notOverEmail == true) {
         result = "success";
      } else {
         result = "fail";
      }
      
      Gson gson = new GsonBuilder().create();
      
      return gson.toJson(result);
      
   }
   
   /**
    * 닉네임 변경
    * @param userInfo
    * @param rttr
    * @param request
    * @return
    */
   @PostMapping("updateNick")
   public String updateNick(@ModelAttribute UserInfoDTO userInfo, RedirectAttributes rttr, HttpServletRequest request) {
      System.out.println("변경을 시도하는 아이디 : " + userInfo.getId());
      System.out.println("변경할 닉네임 : " + userInfo.getNikname());
      
      int result = userService.updateNick(userInfo);
      UserInfoDTO loginUser = userService.selectNewUserInfo(userInfo);
      
      if(result > 0) {
         rttr.addFlashAttribute("message", "닉네임 변경에 성공했습니다.");
         
         HttpSession session = request.getSession();
         session.setAttribute("loginUser", loginUser);
      } else {
         rttr.addFlashAttribute("message", "닉네임 변경에 실패했습니다.");
      }
      
      return "redirect:/user/mypage/account";
   }
   
   /**
    * 이메일변경
    * @param userInfo
    * @param rttr
    * @param request
    * @return
    */
   @PostMapping("updateEmail")
   public String updateEmail(@ModelAttribute UserInfoDTO userInfo, RedirectAttributes rttr, HttpServletRequest request) {
      System.out.println("변경을 시도하는 아이디 : " + userInfo.getId());
      System.out.println("변경할 이메일 : " + userInfo.getEmail());
      
      int result = userService.updateEmail(userInfo);
      UserInfoDTO loginUser = userService.selectNewUserInfo(userInfo);
      
      if(result > 0) {
         rttr.addFlashAttribute("message", "이메일 변경에 성공했습니다.");
         
         HttpSession session = request.getSession();
         session.setAttribute("loginUser", loginUser);
      } else {
         rttr.addFlashAttribute("message", "이메일 변경에 실패했습니다.");
      }
      
      return "redirect:/user/mypage/account";
   }
   
   @PostMapping("withdrawUser")
   public String withdrawUser(@ModelAttribute UserInfoDTO userInfo, RedirectAttributes rttr, HttpSession session) {
      
      System.out.println("탈퇴를 위해 입력 된 비밀번호 : " + userInfo.getPwd());
      System.out.println("탈퇴하려는 유저코드 : " + userInfo.getCode());
      System.out.println("탈퇴하려는 아이디 : " + userInfo.getId());
      
      String result = userService.withdrawUser(userInfo);
      
      if(result == "pwdFail") {
         rttr.addFlashAttribute("message", "비밀번호가 맞지 않습니다.");
         return "redirect:/mypage/account";
      } else if(result == "fail") {
         rttr.addFlashAttribute("message", "탈퇴에 실패했습니다.");
         return "redirect:/mypage/account";
      } else {
         rttr.addFlashAttribute("message", "펫팔을 떠나신다니 아쉬워요... 언젠가 다시 만날 날을 기다립니다! 사용 된 정보로의 재가입은 탈퇴날부터 3개월 이후에 가능합니다!");
         session.invalidate();
         return "redirect:/";
      }
      
   }
   
}






















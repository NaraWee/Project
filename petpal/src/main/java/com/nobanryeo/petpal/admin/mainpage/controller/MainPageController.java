package com.nobanryeo.petpal.admin.mainpage.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nobanryeo.petpal.admin.mainpage.service.MainPageService;

@Controller
@RequestMapping("/admin/*")
public class MainPageController {
	
	private MainPageService mainPageService;

	@Autowired
	public MainPageController(MainPageService mainPageService) {
		this.mainPageService = mainPageService;
	}
	
	// 관리자 메인페이지
	@RequestMapping("adminMainPage")
	public ModelAndView adApproveListReturning() {
		
		return new ModelAndView("admin/main/manager_main");
	}
	
	@RequestMapping("adminMainPage/chart")
	@ResponseBody
	public String chart() {
		return mainPageService.getChartData().toJSONString();
	}
	
	@RequestMapping("adminMainPage/chart2")
	@ResponseBody
	public String chart2() {
		return mainPageService.getChartData2().toJSONString();
	}
	
	@GetMapping("logout")
	public ModelAndView userLogout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		mv.setViewName("redirect:/");
		return mv;
	}
	
	
}

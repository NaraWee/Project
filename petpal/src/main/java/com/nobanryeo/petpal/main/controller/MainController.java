package com.nobanryeo.petpal.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class MainController {
	
	@GetMapping(value={"/","main"})
	public String main() {
		
//		return "admin/main/manager_main";


		return "user/main/mainpage";


	}
	
	
}

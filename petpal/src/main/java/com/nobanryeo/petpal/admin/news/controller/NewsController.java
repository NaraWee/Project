package com.nobanryeo.petpal.admin.news.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")  
public class NewsController {
	   @RequestMapping("newsLetterList")
	    public String newsLetterList() {
	       
	       return "admin/main/newsletterList";
	    }
}

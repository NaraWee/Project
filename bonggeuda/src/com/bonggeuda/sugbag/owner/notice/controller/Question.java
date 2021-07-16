package com.bonggeuda.sugbag.owner.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.RoomDTO;
import com.bonggeuda.sugbag.owner.notice.service.QuestionService;
import com.bonggeuda.sugbag.owner.regist.service.RoomService;

/**
 * Servlet implementation class Question
 */
@WebServlet("/owner/question")
public class Question extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("작성할거야");
		
		/*1:1 문의로 이동*/
		String path="";
		path = "/WEB-INF/views/owner/notice/questionWrite.jsp";
		request.getRequestDispatcher(path).forward(request, response);	
	}

}

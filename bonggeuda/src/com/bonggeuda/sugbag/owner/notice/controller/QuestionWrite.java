package com.bonggeuda.sugbag.owner.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.owner.notice.service.QuestionService;

/**
 * Servlet implementation class QuestionWrite
 */
@WebServlet("/owner/question/write")
public class QuestionWrite extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//로그인 값
		HttpSession session = request.getSession();
		int ownerNo = (Integer)session.getAttribute("ownerNo");
		
		System.out.println("작성했어");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		/*전달받은 값을 넣어줄 객체 선언*/
		AdminQnADTO QuestionWrite = new AdminQnADTO();
		
		QuestionWrite.setAdminQnATitle(title);
		QuestionWrite.setAdminQnAContent(content);
		
		/*값을 전달하기 위한 비지니스 로직 호출*/
		QuestionService questionService = new QuestionService();
		
		/*결과값 반환*/
		int insetQuestion = questionService.InsertQuestion(QuestionWrite, ownerNo); //값을 int형으로 반환받아야 함
		
		/*1:1 문의로 이동*/
		String path="";
		path = "/WEB-INF/views/owner/notice/success.jsp";
		request.getRequestDispatcher(path).forward(request, response);	
	}

}

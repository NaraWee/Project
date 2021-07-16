package com.bonggeuda.sugbag.owner.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.model.dto.QnADTO;
import com.bonggeuda.sugbag.owner.notice.service.QuestionService;

/**
 * Servlet implementation class Question
 */
@WebServlet("/owner/question/content")
public class QuestionContent extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인 값
	    HttpSession session = request.getSession();
	    int ownerNo = (Integer)session.getAttribute("ownerNo");
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		System.out.println(qnaNo);
		
		QuestionService contentService = new QuestionService();

		/*결과값 반환*/
		AdminQnADTO selectContent = contentService.selectContent(qnaNo,ownerNo);
		AdminQnADTO selectAnswer = contentService.selectAnswer(qnaNo,ownerNo);
		
		request.setAttribute("selectContent", selectContent); //jsp에 값 반환
		request.setAttribute("selectAnswer", selectAnswer); 
		
		/*1:1 문의로 이동*/
		String path="";
		path = "/WEB-INF/views/owner/notice/questionContent.jsp";
		request.getRequestDispatcher(path).forward(request, response);	
	}

}

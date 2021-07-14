package com.bonggeuda.sugbag.book.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.OwnerQnADTO;
import com.bonggeuda.sugbag.service.BookService;

/**
 * Servlet implementation class AccomoQuestionServlet
 */
@WebServlet("/book/question")
public class AccomoQuestionServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        OwnerQnADTO qna = new OwnerQnADTO();
        
        qna.setAccomoNo(Integer.parseInt(request.getParameter("accomoNo")));
        qna.setUserNo(Integer.parseInt(request.getParameter("userNo")));
        qna.setTitle(request.getParameter("title"));
        qna.setContent(request.getParameter("content"));
        qna.setWriteDate(new Date(System.currentTimeMillis()));
        
        BookService svc = new BookService();
        
        int result = svc.insertOwnerQnA(qna);
        
        String path = "";
        if(result>0) {
        	path= "/userqnalist/select";
        } else {
        }
        response.sendRedirect(request.getContextPath() + path);
	}
}

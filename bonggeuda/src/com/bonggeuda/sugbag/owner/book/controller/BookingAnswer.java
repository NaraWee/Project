package com.bonggeuda.sugbag.owner.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bonggeuda.sugbag.model.dto.AdminQnADTO;
import com.bonggeuda.sugbag.model.dto.OwnerInfoDTO;
import com.bonggeuda.sugbag.owner.book.service.BookingQnAService;


/**
 * Servlet implementation class BookingAnswer
 */
@WebServlet("/owner/book/answer")
public class BookingAnswer extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		String content = request.getParameter("content");
		
		/*전달받은 값을 넣어줄 객체 선언*/
		AdminQnADTO qnaDTO = new AdminQnADTO();
		
		//로그인 값
		HttpSession session = request.getSession();
		int ownerNo = (Integer)session.getAttribute("ownerNo");
		
		qnaDTO.setAdminQnANo(qnaNo);
		qnaDTO.setAdminQnAContent(content);
		
		/*값을 전달하기 위한 비지니스 로직 호출*/
		BookingQnAService qnaService = new BookingQnAService();
		
		/*결과값 반환*/
		int updateYn = qnaService.updateYn(qnaNo);
		int insetAnswer = qnaService.InsertAnswer(qnaDTO); //값을 int형으로 반환받아야 함
		
		/*목록으로로 이동*/
		String path="";
		path = "/WEB-INF/views/owner/bookingList/success.jsp";
		request.getRequestDispatcher(path).forward(request, response);	
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		BookingQnAService qnaService = new BookingQnAService();

		/*결과값 반환*/
		AdminQnADTO selectContent = qnaService.selectContent(qnaNo);
		AdminQnADTO selectAnswer = qnaService.selectAnswer(qnaNo);
		
		request.setAttribute("selectContent", selectContent); //jsp에 값 반환
		request.setAttribute("selectAnswer", selectAnswer); 
		
		String path="";
		path = "/WEB-INF/views/owner/bookingList/bookingAnswer.jsp";
		request.getRequestDispatcher(path).forward(request, response);	
	}

}

package com.bonggeuda.sugbag.book.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.AccomoInfoDTO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.RoomDTO;
import com.bonggeuda.sugbag.service.BookService;

/**
 * Servlet implementation class RoomSelectServlet
 */
@WebServlet("/accomoSelect/room")
public class RoomSelectServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int accomoNo = Integer.parseInt(request.getParameter("no"));
		//숙소정보, 사진조회
		BookService booksvc = new BookService();
		int categoryType = 3;
		AccomoInfoDTO accomo = booksvc.selectAccomoInfo(accomoNo, categoryType);
		//객실정보 조회
		categoryType = 4;
		List<RoomDTO> roomList = booksvc.selectRoomList(accomoNo,categoryType);
		String path ="";
		if(accomo != null && roomList!=null) {
//			path = "/WEB-INF/views/guest/accomoInfo/book.jsp";
			path = "review";
			request.setAttribute("accomo", accomo);
			request.setAttribute("roomList", roomList);
			request.getRequestDispatcher(path).forward(request, response);
		} else {
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}

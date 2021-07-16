package com.bonggeuda.sugbag.owner.modify.controllor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.RmAccomoInfoDTO;
import com.bonggeuda.sugbag.owner.modify.service.ModifyAccomoService;

/**
 * Servlet implementation class ModifyAccomo
 */
@WebServlet("/owner/accomoModify")
public class ModifyAccomo extends HttpServlet {

	/**
	 * 등록승인된 아이의 숙소정보 조회해서 
	 *  값 조회해서 roomModification1 jsp 로 이동해주는 메소드
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ModifyAccomoService modifyService = new ModifyAccomoService();
		

		int accomoNo = Integer.parseInt(request.getParameter("accomoNo"));
		RmAccomoInfoDTO rmAccomoInfo = new RmAccomoInfoDTO();
		
		
	      /* 숙소 수정중 인지 카운트 세서 보내주기*/
	     int isRemo = modifyService.selectrmCount(accomoNo);
	     
	     String path = "";
	     
	     if(isRemo > 0) {
	    	 path = "/WEB-INF/views/owner/roomManagement/thisAccomoRM.jsp";
	    	 request.getAttribute(path);
	    	 request.getRequestDispatcher(path).forward(request, response);
	    	 
	     }else {
	    	 
	 		rmAccomoInfo = modifyService.selectAccomoInfo(accomoNo);
					
			request.setAttribute("rmAccomoInfo", rmAccomoInfo);
			
			path = "/WEB-INF/views/owner/roomModify/roomModification.jsp";
			request.getAttribute(path);
			request.getRequestDispatcher(path).forward(request, response);
	    	 
	   
	    	 
	     }
		
		
		
		
		

		
		

	}

}

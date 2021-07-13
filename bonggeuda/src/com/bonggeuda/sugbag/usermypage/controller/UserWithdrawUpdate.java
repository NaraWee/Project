package com.bonggeuda.sugbag.usermypage.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.WithdrawReasonDTO;
import com.bonggeuda.sugbag.service.UserMypageService;

/**
 * Servlet implementation class UserWithdrawUpdate
 */
@WebServlet("/userwithdraw/update")
public class UserWithdrawUpdate extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((MemberDTO)request.getSession().getAttribute("member")).getUserNo();
		
		request.setCharacterEncoding("UTF-8");
		
		UserMypageService mypageService = new UserMypageService();
		MemberDTO userWithdraw = new MemberDTO();
		WithdrawReasonDTO userWithdrawReason = new WithdrawReasonDTO();
		
		java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		userWithdraw.setWithDrawDate(date);
		userWithdraw.setUserNo(userNo);
		userWithdrawReason.setMemberNo(userNo);
		if((request.getParameter("radios")).equals("기타")) {
			userWithdrawReason.setWithdrawReason(request.getParameter("radios") + " : " + request.getParameter("reason"));
		} else {
			userWithdrawReason.setWithdrawReason(request.getParameter("radios"));
		}
		
		
		int result = mypageService.userWithdraw(userWithdraw, userWithdrawReason);
		
		if(result > 1) {
			
			request.getSession().invalidate();
			
			response.sendRedirect(request.getContextPath());
			
		}
	}

}

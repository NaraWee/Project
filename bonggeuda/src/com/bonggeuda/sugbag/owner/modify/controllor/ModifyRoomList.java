package com.bonggeuda.sugbag.owner.modify.controllor;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.RoomDTO;
import com.bonggeuda.sugbag.owner.manage.service.ManagementRoomService;
import com.bonggeuda.sugbag.owner.regist.service.RoomService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Servlet implementation class ModifyRoom
 */
@WebServlet("/owner/roomList")
public class ModifyRoomList extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int roomcAcomoNo =   Integer.parseInt(request.getParameter("roomcAcomoNo"));
		
		System.out.println(roomcAcomoNo);
		
		/* 해당 숙소에 대한 숙소 목록(정보와 리스트) */
		List<RoomDTO> selectRoomList = new ArrayList<RoomDTO>();
		
		ManagementRoomService roomService = new ManagementRoomService();
		
		selectRoomList = roomService.selectRoomList(roomcAcomoNo);
		System.out.println("selectRoomList" + selectRoomList);
		
		request.setAttribute("selectRoomList", selectRoomList);
		
		
		String path="";

		path = "/WEB-INF/views/owner/roomModify/roomList.jsp";
		request.getAttribute(path);
		request.getRequestDispatcher(path).forward(request, response);
		
		
		
	
	}
	
	
}



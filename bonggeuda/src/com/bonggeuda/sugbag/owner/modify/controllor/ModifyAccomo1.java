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
import com.bonggeuda.sugbag.model.dto.RmAccomoInfoDTO;
import com.bonggeuda.sugbag.owner.modify.service.ModifyAccomoService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Servlet implementation class ModifyAccomo1
 */
@WebServlet("/owner/modifyAccomo1")
public class ModifyAccomo1 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rmAccomoNo = Integer.parseInt(request.getParameter("accomoNo"));
		
		String accomoName = request.getParameter("accomoName");
		String ceoName = request.getParameter("ceoName");
		String accomoType = request.getParameter("accomoType");
		String registNo = request.getParameter("registNo");
		String address = request.getParameter("address");
		String adrDetail = request.getParameter("adrDetail");
		String email = request.getParameter("email");
		String homepage = request.getParameter("homepage");
		
		ModifyAccomoService modifyService = new ModifyAccomoService();
		
		RmAccomoInfoDTO rmAcoomoDTO = new RmAccomoInfoDTO();
		rmAcoomoDTO = modifyService.selectAccomoInfoTwo(rmAccomoNo);
		
		rmAcoomoDTO.setRmAccomoNo(rmAccomoNo);
		rmAcoomoDTO.setAccomoName(accomoName);
		rmAcoomoDTO.setCeoName(ceoName);
		rmAcoomoDTO.setAccomoType(accomoType);
		rmAcoomoDTO.setRegistNo(registNo);
		rmAcoomoDTO.setAddress(address);
		rmAcoomoDTO.setAdrDetail(adrDetail);
		rmAcoomoDTO.setEmail(email);
		rmAcoomoDTO.setHomepage(homepage);
		
		
		// 조회해 오고 담아서 뿌려주기

		
		request.setAttribute("rmAcoomoDTO", rmAcoomoDTO);
		
		String path = "";
		
		path = "/WEB-INF/views/owner/roomModify/roomModification1.jsp";
		
		request.getAttribute(path);
		request.getRequestDispatcher(path).forward(request, response);
	}

}

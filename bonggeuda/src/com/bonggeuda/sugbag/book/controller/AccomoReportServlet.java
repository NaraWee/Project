package com.bonggeuda.sugbag.book.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.ReportDTO;
import com.bonggeuda.sugbag.service.ReportService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Servlet implementation class AccomoReportServlet
 */
@WebServlet("/book/report")
public class AccomoReportServlet extends HttpServlet {
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("no", request.getParameter("no"));
		request.getRequestDispatcher("/WEB-INF/views/guest/accomoInfo/report.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			String rootLocation = getServletContext().getRealPath("/");
			int maxFileSize = 1024 * 1024 * 10;
			String encodingType = "UTF-8";
			String fileUploadDirectory = rootLocation + "/resources/upload/original/";
			String thumbnailDirectory = rootLocation + "/resources/upload/thumbnail/";
			
			File directory = new File(fileUploadDirectory);
			File directory2 = new File(thumbnailDirectory);
			
			if(!directory.exists() || !directory2.exists()) {
				directory.mkdirs();
				directory2.mkdirs();
			}
			
			Map<String, String> parameter = new HashMap<>();
			List<Map<String,String>> fileList = new ArrayList<>();
			
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			fileItemFactory.setRepository(new File(fileUploadDirectory));
			fileItemFactory.setSizeThreshold(maxFileSize);
			
			ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
			
			List<FileItem> fileItems;
			try {
				fileItems = fileUpload.parseRequest(request);
				
				for(int i = 0; i < fileItems.size(); i++) {
					FileItem item = fileItems.get(i);
					
					if(!item.isFormField()) {
						if(item.getSize() > 0) {
							String filedName = item.getFieldName();
							String originFileName = item.getName();
							
							int dot = originFileName.lastIndexOf(".");
							String ext = originFileName.substring(dot);
							
							String randomFileName = UUID.randomUUID().toString().replace("-", "") + ext;
							
							File storeFile = new File(fileUploadDirectory + "/" + randomFileName);
							
							item.write(storeFile);
							
							Map<String, String> fileMap = new HashMap<>();
							fileMap.put("filedName", filedName);
							fileMap.put("originFileName", originFileName);
							fileMap.put("savedFileName", randomFileName);
							fileMap.put("savePath", fileUploadDirectory);
							
							fileMap.put("fileType", "BODY");
							
							Thumbnails.of(fileUploadDirectory + randomFileName)
							.size(120, 100)
							.toFile(thumbnailDirectory + "thumbnail_" + randomFileName);
							
							fileMap.put("thumbnailPath", "resources/upload/thumbnail/thumbnail_" + randomFileName);
							
							fileList.add(fileMap);
						}
					} else {
						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
						
					}
				}
				//신고내용담기
				ReportDTO report = new ReportDTO();
				report.setReportTitle(parameter.get("title"));
				report.setReportReason(parameter.get("body"));
				//신고한사람 (이용자)
				MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
				int userNo = member.getUserNo();
				report.setWriterType("guest");
				report.setMemberNo(userNo);
				//신고당한 숙소번호
				report.setReportedType("owner");
				report.setReportedNo(Integer.parseInt(parameter.get("accomoNo")));
				report.setReportDate(new Date(System.currentTimeMillis()));
				
				//첨부파일
				report.setAttachmentList(new ArrayList<AttachmentDTO>());
				List<AttachmentDTO> list = report.getAttachmentList();
				for(int i =0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					
					AttachmentDTO fileInfo = new AttachmentDTO();
					fileInfo.setOriginName(file.get("originFileName"));
					fileInfo.setSavedName(file.get("savedFileName"));
					fileInfo.setSavePath(file.get("savePath"));
					fileInfo.setFileType(file.get("fileType"));
					fileInfo.setThumbnailPath(file.get("thumbnailPath"));
					fileInfo.setCategoryNo(6);
					
					list.add(fileInfo);
				}
				
				//신고내용 insert 하기
				
				ReportService rsvc = new ReportService();
				int result = rsvc.insertReport(report);
				
				String path ="";
				if(result > 0) {
					path = "/userreportlist/select";
				} else {
					//실패경로
				}
				response.sendRedirect(request.getContextPath() + path);
			} catch (Exception e) {
				int cnt = 0;
				for(int i = 0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					
					File deleteFile = new File(fileUploadDirectory + "/" + file.get("savedFileName"));
					boolean isDeleted = deleteFile.delete();
					
					if(isDeleted) {
						cnt++;
					}
				}
				
				if(cnt == fileList.size()) {
//					System.out.println(" 실패한 사진삭제 완료");
				} else {
					e.printStackTrace();
				}
			}
		}
	}
}

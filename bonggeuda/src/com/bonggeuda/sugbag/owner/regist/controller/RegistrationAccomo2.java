package com.bonggeuda.sugbag.owner.regist.controller;

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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.MemberDTO;
import com.bonggeuda.sugbag.model.dto.ReportDTO;
import com.bonggeuda.sugbag.model.dto.RmAccomoInfoDTO;
import com.bonggeuda.sugbag.owner.modify.service.ModifyAccomoService;
import com.bonggeuda.sugbag.owner.regist.service.AccomoService;
import com.bonggeuda.sugbag.service.ReportService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Servlet implementation class RegistrationAccomo2
 */
@WebServlet("/registration2")
public class RegistrationAccomo2 extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		if(ServletFileUpload.isMultipartContent(request)) {
			
			String rootLocation = getServletContext().getRealPath("/");
			int maxFileSize = 1024 * 1024 * 10;
			String encodingType = "UTF-8";
			

			
			String fileUploadDirectory = rootLocation + "/resources/upload/";
			String thumbnailDirectory = rootLocation + "/resources/upload/thumbnail/";
			
			File directory = new File(fileUploadDirectory);
			File directory2 = new File(thumbnailDirectory);
			
	
			if(!directory.exists() || !directory2.exists()) {
				System.out.println("폴더 생성 : " + directory.mkdirs());
				System.out.println("폴더 생성 : " + directory2.mkdirs());
			}

			Map<String, String> parameter = new HashMap<>();
			
			
			
			List<Map<String, String>> fileList = new ArrayList<>();
			
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
	        fileItemFactory.setRepository(new File(fileUploadDirectory));
	        fileItemFactory.setSizeThreshold(maxFileSize);
	        
	        ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
	        
	        try {
				List<FileItem> fileItems = fileUpload.parseRequest(request);
				
				for(FileItem item : fileItems) {
					System.out.println(item);
				}
				
				for(int i = 0; i < fileItems.size(); i++) {
					FileItem item = fileItems.get(i);
					
					if(!item.isFormField()) {
						
						if(item.getSize() > 0) {
							

							String filedName = item.getFieldName();
							String originFileName = item.getName();
							
							int dot = originFileName.lastIndexOf(".");
							String ext = originFileName.substring(dot);
							
							String randomFileName = item.getName(); // UUID.randomUUID().toString().replace("-", "") + ext;
							
							File storeFile = new File(fileUploadDirectory  +"/"+ randomFileName);
							
							/*  */
							item.write(storeFile);
							
							Map<String, String> fileMap = new HashMap<>();
							fileMap.put("filedName", filedName);
							fileMap.put("originFileName", originFileName);
							fileMap.put("savedFileName", randomFileName);
							fileMap.put("savePath", fileUploadDirectory);
							
							int width = 0;
							int height = 0;
							if("thumbnailImg1".equals(filedName)) {
								fileMap.put("fileType", "BODY"); 
								
								/* 썸네일로 변환 할 사이즈를 지정한다. */
								width = 350;
								height = 200;
							}
							
							Thumbnails.of(fileUploadDirectory + randomFileName)
									.size(width, height)
									.toFile(thumbnailDirectory + "thumbnail_" + randomFileName);
							
							//fileMap.put("thumbnailPath", "resources/upload/thumbnail/thumbnail_" + randomFileName);
							fileMap.put("thumbnailPath", "resources/upload/" + randomFileName);
							
							fileList.add(fileMap);
							
						}
						
					} else {

						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
						
						
					}
				}
				/* 서비스를 요청할 수 있도록 BoardDTO에 담는다. */
				RmAccomoInfoDTO thumbnail = new RmAccomoInfoDTO();

				AccomoService accomoService = new AccomoService();
				int selectRequestNextVal = 0;
				
				/* 리퀘스트 넘의 넥스트발을 조회해서 그값을 둘다 넣어주기*/
				selectRequestNextVal = accomoService.selectRequestNextValService();
								
				
				
				AttachmentDTO tempFileInfo = new AttachmentDTO();
				for(int i = 0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					tempFileInfo = new AttachmentDTO();
					
					tempFileInfo.setOriginName(file.get("originFileName"));
					tempFileInfo.setSavedName(file.get("savedFileName"));
					tempFileInfo.setSavePath(file.get("savePath"));
					tempFileInfo.setFileType(file.get("fileType"));
					tempFileInfo.setThumbnailPath(file.get("thumbnailPath"));
					

				}
				
				System.out.println("thumbnail board : " + thumbnail);
				
				ModifyAccomoService  moAccomoService = new ModifyAccomoService();
				int result = 0;
				result = moAccomoService.insertAccomoThumbnail(tempFileInfo,selectRequestNextVal);
				

				/*다시 DTO에 한번에 담아줌*/
				AccomoDTO accomoDTO = new AccomoDTO();
				
				accomoDTO.setAccomoName(parameter.get("accomoName"));
				accomoDTO.setCeoName(parameter.get("ceoName"));
				accomoDTO.setAccomoType(parameter.get("accomoType"));
				accomoDTO.setRegistNo(parameter.get("registNo"));
				accomoDTO.setAddress(parameter.get("address"));
				accomoDTO.setAdrDetail(parameter.get("adrDetail"));
				accomoDTO.setEmail(parameter.get("email"));
				accomoDTO.setHomepage(parameter.get("homepage"));
				
				accomoDTO.setAccomoPath(parameter.get("accomoPath"));
				accomoDTO.setNear(parameter.get("near"));
				accomoDTO.setRule(parameter.get("rule"));
				accomoDTO.setParking(parameter.get("parking"));
				
				/*숙소등록3번 jsp로 값 넘기기*/
				request.setAttribute("accomoDTO", accomoDTO);
				request.setAttribute("selectRequestNextVal", selectRequestNextVal);
				
				String path="";
				
				path = "/WEB-INF/views/owner/registration/registration3.jsp";
				
				request.getRequestDispatcher(path).forward(request, response);

				
				
			} catch (Exception e) {
				//어떤 종류의 Exception이 발생 하더라도실패 시 파일을 삭제해야 한다.
				e.printStackTrace();
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
					System.out.println("업로드에실패한 모든 사진 삭제 완료!");
				} else {
					e.printStackTrace();
				}
				
			} 

		}
		

		
	}

}

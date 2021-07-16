package com.bonggeuda.sugbag.owner.report.controller;

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

import com.bonggeuda.sugbag.model.dto.AccomoDTO;
import com.bonggeuda.sugbag.model.dto.AttachmentDTO;
import com.bonggeuda.sugbag.model.dto.BookDTO;
import com.bonggeuda.sugbag.model.dto.ReportDTO;
import com.bonggeuda.sugbag.model.dto.RmAccomoInfoDTO;
import com.bonggeuda.sugbag.owner.modify.service.ModifyAccomoService;
import com.bonggeuda.sugbag.owner.regist.service.AccomoService;
import com.bonggeuda.sugbag.owner.report.service.ReportWriteService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Servlet implementation class ReportWrite
 */
@WebServlet("/owner/reportWrite")
public class ReportWrite extends HttpServlet {

	/**
	 * 작성한 신고내역 볼 수 있도록 마이페이지로 이동 겸 인서트 작업
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo")); 
		int ownerNo = Integer.parseInt(request.getParameter("ownerNo")); 
		
		/* 이정보 담아서  신고 jsp 로 넘겨주자 */
		BookDTO forReort = new BookDTO();
		forReort.setUserNo(userNo);
		forReort.setOwnerNo(ownerNo);
		
		request.setAttribute("forReort", forReort);
		
		String path = "";
		path = "/WEB-INF/views/owner/report/report.jsp";
		request.getAttribute(path);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	/**
	 * 신고 페이지로 이동 
	 */
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
						
						/* 파일 데이터인 경우 */
						if(item.getSize() > 0) {
							

							String filedName = item.getFieldName();
							String originFileName = item.getName();
							
							int dot = originFileName.lastIndexOf(".");
							String ext = originFileName.substring(dot);
							
							String randomFileName = item.getName();//UUID.randomUUID().toString().replace("-", "") + ext;
							
							/* 저장할 파일 정보를 담은 인스턴스를 생성하고 */
							File storeFile = new File(fileUploadDirectory  +"/"+ randomFileName);
							
							/* 저장한다 */
							item.write(storeFile);
							
							/* 필요한 정보를 Map에 담는다. */
							Map<String, String> fileMap = new HashMap<>();
							fileMap.put("filedName", filedName);
							fileMap.put("originFileName", originFileName);
							fileMap.put("savedFileName", randomFileName);
							fileMap.put("savePath", fileUploadDirectory);
							
							/* 제목 사진과 나머지 사진을 구분하고 썸네일도 생성한다. */
							int width = 0;
							int height = 0;
							if("thumbnailImg1".equals(filedName)) {
								fileMap.put("fileType", "BODY"); // 타이틀에서 보디로 변경
								
								/* 썸네일로 변환 할 사이즈를 지정한다. */
								width = 350;
								height = 200;
								System.out.println("보디로 왔나요?");
							}
							
							/* 썸네일로 변환 후 저장한다. */
							Thumbnails.of(fileUploadDirectory + randomFileName)
									.size(width, height)
									.toFile(thumbnailDirectory + "thumbnail_" + randomFileName);
							
							/* 나중에 웹서버에서 접근 가능한 경로 형태로 썸네일의 저장 경로도 함께 저장한다. */
							//fileMap.put("thumbnailPath", "resources/upload/thumbnail/thumbnail_" + randomFileName);
							fileMap.put("thumbnailPath", "resources/upload/" + randomFileName);
							
							fileList.add(fileMap);
							
						}
						
					} else {
						/* 폼 데이터인 경우 */
						/* 전송된 폼의 name은 getFiledName()으로 받아오고, 해당 필드의 value는 getString()으로 받아온다. 
						 * 하지만 인코딩 설정을 하더라도 전송되는 파라미터는 ISO-8859-1로 처리된다.
						 * 별도로 ISO-8859-1로 해석된 한글을 UTF-8로 변경해주어야 한다.
						 * */
//						parameter.put(item.getFieldName(), item.getString());
						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
						//parameterValue.put("facility",new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
						
					}
				}
				

				/* 서비스를 요청할 수 있도록 BoardDTO에 담는다. */
				ReportDTO thumbnail = new ReportDTO();

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
				
				ReportWriteService  reportImageInsert = new ReportWriteService();
				int refNoMax = reportImageInsert.selectRefMaxNo();
				
				
				/* 서비스 메소드를 요청한다. */
				int result = 0;
				result = reportImageInsert.insertReportThumbnail(tempFileInfo,refNoMax);
				

				String writerType = "owner";
				String reportedType = "guest";
				
				int userNo = Integer.parseInt(parameter.get("userNo")); 
				int ownerNo = Integer.parseInt(parameter.get("ownerNo")); 
				
				String reportTitle = parameter.get("reportTitle");
				String reportContent = parameter.get("reportContent");
				
				ReportWriteService reportInsertService = new ReportWriteService();
				
				
				int reportInsert = reportInsertService.reportInsertService(refNoMax,writerType,reportedType,userNo,ownerNo,reportTitle,reportContent);
				
				
				if(reportInsert > 0) {
					
					String path = "";
					path = "/WEB-INF/views/owner/report/reportSuccessPage.jsp";
					request.getAttribute(path);
					request.getRequestDispatcher(path).forward(request, response);
				}
				
				
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






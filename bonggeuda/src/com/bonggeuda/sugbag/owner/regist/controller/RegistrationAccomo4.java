package com.bonggeuda.sugbag.owner.regist.controller;

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
import com.bonggeuda.sugbag.owner.regist.service.RoomService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Servlet implementation class RegistrationAccomo4
 */
@WebServlet("/registration4")
public class RegistrationAccomo4 extends HttpServlet {

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
					//System.out.println(item);
				}
				
				/* 위에서 출력해본 모든 item들을 다 처리할 것이다. */
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
							File storeFile = new File(fileUploadDirectory + "/" + randomFileName);
							
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
								fileMap.put("fileType", "TITLE");
								
								/* 썸네일로 변환 할 사이즈를 지정한다. */
								width = 350;
								height = 200;
							} else {
								fileMap.put("fileType", "BODY");
								
								width = 120;
								height = 100;
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

						parameter.put(item.getFieldName(), new String(item.getString().getBytes("ISO-8859-1"), "UTF-8"));
						
					}
				}
				

				
				/* 서비스를 요청할 수 있도록 BoardDTO에 담는다. */
				RoomDTO thumbnail = new RoomDTO();

			//	thumbnail.setWriterMemberNo(((MemberDTO) request.getSession().getAttribute("loginMember")).getNo());// int ownerNo으로 대체
				
				thumbnail.setAttachmentList(new ArrayList<AttachmentDTO>());
				
				List<AttachmentDTO> list = thumbnail.getAttachmentList();
				for(int i = 0; i < fileList.size(); i++) {
					Map<String, String> file = fileList.get(i);
					
					AttachmentDTO tempFileInfo = new AttachmentDTO();
					tempFileInfo.setOriginName(file.get("originFileName"));
					tempFileInfo.setSavedName(file.get("savedFileName"));
					tempFileInfo.setSavePath(file.get("savePath"));
					tempFileInfo.setFileType(file.get("fileType"));
					tempFileInfo.setThumbnailPath(file.get("thumbnailPath"));
					
					list.add(tempFileInfo);
				}

				/* 성공 실패 페이지를 구분하여 연결한다. */
				String path = "";
					
					/* 값을 한번에 담아서 넘길 리스트 생성 */
					List<RoomDTO> roomList = new ArrayList<RoomDTO>();
					
					/*전달받은 값을 넣어줄 객체 선언*/
					RoomDTO roomDTO = new RoomDTO();
					
					roomDTO.setRoomName(parameter.get("roomName"));
					roomDTO.setRoomMax(Integer.parseInt(parameter.get("roomMax")));
					roomDTO.setRoomIntro(parameter.get("roomIntro"));
					roomDTO.setRoomFee(Integer.parseInt(parameter.get("roomFee")));
					roomDTO.setPeakFee(Integer.parseInt(parameter.get("peakFee")));
					
					roomList.add(roomDTO);
					
					/*객실추가 2*/
					if (!parameter.get("roomName2").isEmpty()) { //값이 입력되면 저장

						RoomDTO roomDTO2 = new RoomDTO();
						
						roomDTO2.setRoomName(parameter.get("roomName2"));
						roomDTO2.setRoomMax(Integer.parseInt(parameter.get("roomMax2")));
						roomDTO2.setRoomIntro(parameter.get("roomIntro2"));
						roomDTO2.setRoomFee(Integer.parseInt(parameter.get("roomFee2")));
						roomDTO2.setPeakFee(Integer.parseInt(parameter.get("peakFee2")));
						
						roomList.add(roomDTO2);
					}
					
					/*객실추가 3*/
					if (!parameter.get("roomName3").isEmpty()) {
						
						RoomDTO roomDTO3 = new RoomDTO();
						
						roomDTO3.setRoomName(parameter.get("roomName3"));
						roomDTO3.setRoomMax(Integer.parseInt(parameter.get("roomMax3")));
						roomDTO3.setRoomIntro(parameter.get("roomIntro3"));
						roomDTO3.setRoomFee(Integer.parseInt(parameter.get("roomFee3")));
						roomDTO3.setPeakFee(Integer.parseInt(parameter.get("peakFee3")));
						
						roomList.add(roomDTO3);
					}
					
					/*객실추가 4*/
					if (!parameter.get("roomName4").isEmpty()) {
						
						RoomDTO roomDTO4 = new RoomDTO();
						
						roomDTO4.setRoomName(parameter.get("roomName4"));
						roomDTO4.setRoomMax(Integer.parseInt(parameter.get("roomMax4")));
						roomDTO4.setRoomIntro(parameter.get("roomIntro4"));
						roomDTO4.setRoomFee(Integer.parseInt(parameter.get("roomFee4")));
						roomDTO4.setPeakFee(Integer.parseInt(parameter.get("peakFee4")));
						
						roomList.add(roomDTO4);
					}
					
					/*객실추가 5*/
					if (!parameter.get("roomName5").isEmpty()) {
						
						RoomDTO roomDTO5 = new RoomDTO();
						
						roomDTO5.setRoomName(parameter.get("roomName5"));
						roomDTO5.setRoomMax(Integer.parseInt(parameter.get("roomMax5")));
						roomDTO5.setRoomIntro(parameter.get("roomIntro5"));
						roomDTO5.setRoomFee(Integer.parseInt(parameter.get("roomFee5")));
						roomDTO5.setPeakFee(Integer.parseInt(parameter.get("peakFee5")));
						
						roomList.add(roomDTO5);
					}
					
					// 방금 인서트 된 숙소 EN_ACCOMO_NO 값 조회해 오기
					RoomService roomServaice = new RoomService();
					// 객실 인서트(사진아님) 할때 넘겨줄 값
					
					/* 사진 여기서 인서트 */
					/* 서비스 메소드를 요청한다. */
					int result = new RoomService().insertThumbnail(thumbnail,roomList);
					
					/*값을 전달하기 위한 비지니스 로직 호출*/
					RoomService roomService = new RoomService();
					
					path = "/WEB-INF/views/owner/main/main.jsp";
					
					request.getRequestDispatcher(path).forward(request, response);
					
			} catch (Exception e) {
				//어떤 종류의 Exception이 발생 하더라도실패 시 파일을 삭제해야 한다.
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

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
import com.bonggeuda.sugbag.owner.regist.service.AccomoService;

import net.coobird.thumbnailator.Thumbnails;

/**
 * Servlet implementation class ModifyAccomo2
 */
@WebServlet("/owner/modifyAccomo2")
public class ModifyAccomo2 extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			
			String rootLocation = getServletContext().getRealPath("/");
			int maxFileSize = 1024 * 1024 * 10;
			String encodingType = "UTF-8";
			

			
			String fileUploadDirectory = rootLocation + "/esources/upload/";
			String thumbnailDirectory = rootLocation + "/resources/upload/thumbnail/";
			
			File directory = new File(fileUploadDirectory);
			File directory2 = new File(thumbnailDirectory);
			
			if(!directory.exists() || !directory2.exists()) {
				System.out.println("폴더 생성 : " + directory.mkdirs());
				System.out.println("폴더 생성 : " + directory2.mkdirs());
			}

			Map<String, String> parameter = new HashMap<>();
			
			Map<String[], String[]> parameterValue = new HashMap<>();
			
			List<Map<String, String>> fileList = new ArrayList<>();
			
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
	        fileItemFactory.setRepository(new File(fileUploadDirectory));
	        fileItemFactory.setSizeThreshold(maxFileSize);
	        
	        ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
	        
	        try {
				List<FileItem> fileItems = fileUpload.parseRequest(request);
				
				for(FileItem item : fileItems) {

				}
				
				for(int i = 0; i < fileItems.size(); i++) {
					FileItem item = fileItems.get(i);
					
					if(!item.isFormField()) {
						
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
							} else {
								fileMap.put("fileType", "BODY"); // 타이틀에서 보디로 변경
								/* 썸네일로 변환 할 사이즈를 지정한다. */
								width = 350;
								height = 200;
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
							
				
				//parameter.get(key)
				
				/* 서비스를 요청할 수 있도록 BoardDTO에 담는다. */
				RmAccomoInfoDTO thumbnail = new RmAccomoInfoDTO();

				//List<AttachmentDTO> list = new ArrayList<AttachmentDTO>();
				
				/* 리퀘스트 넘의 넥스트발을 조회해서 그값을 둘다 넣어주기*/
				int selectRequestNextVal = 0;
				AccomoService accomoService = new AccomoService();

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
					
					//list.add(tempFileInfo);
				}
				
				
				
				
				/* 서비스 메소드를 요청한다. */
				ModifyAccomoService   MoAccomoService = new ModifyAccomoService();
				RmAccomoInfoDTO rmAcoomoDTO = new RmAccomoInfoDTO();

				int result = 0;
				result = MoAccomoService.insertModifyAccomoThumbnail(tempFileInfo,selectRequestNextVal);
				// 값 받기
				
				rmAcoomoDTO.setRmAccomoNo(Integer.parseInt(parameter.get("rmAccomoNo")));
				rmAcoomoDTO.setAccomoName(parameter.get("accomoName"));
				rmAcoomoDTO.setCeoName(parameter.get("ceoName"));
				rmAcoomoDTO.setAccomoType(parameter.get("accomoType"));
				rmAcoomoDTO.setRegistNo(parameter.get("registNo"));
				rmAcoomoDTO.setAddress(parameter.get("address"));
				rmAcoomoDTO.setAdrDetail(parameter.get("adrDetail"));
				rmAcoomoDTO.setEmail(parameter.get("email"));
				rmAcoomoDTO.setHomepage(parameter.get("homepage"));
				rmAcoomoDTO.setParking(parameter.get("parking"));
				rmAcoomoDTO.setNear(parameter.get("near"));
				rmAcoomoDTO.setRule(parameter.get("rule"));
				rmAcoomoDTO.setAccomoPath(parameter.get("accomoPath"));
				

				
				
				


				
				request.setAttribute("rmAcoomoDTO", rmAcoomoDTO);
				request.setAttribute("selectRequestNextVal", selectRequestNextVal);

				String path = "";
				
				path = "/WEB-INF/views/owner/roomModify/roomModification2.jsp";
				request.getAttribute(path);
			
				
				request.getRequestDispatcher(path).forward(request, response);
				
				
			} catch (Exception e) {
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

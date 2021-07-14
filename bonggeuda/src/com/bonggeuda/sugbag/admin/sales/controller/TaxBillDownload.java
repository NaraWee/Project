package com.bonggeuda.sugbag.admin.sales.controller;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;

import com.bonggeuda.sugbag.admin.service.AdminService;

/**
 * Servlet implementation class TaxBillDownload
 */
@WebServlet("/sales/taxdownload")
public class TaxBillDownload extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int requestNo = Integer.parseInt(request.getParameter("requestNo"));
		int updateResult = 0;
		int insertResult = 0;
		AdminService service = new AdminService();
		
		String binaryData = request.getParameter("imgSrc");
		FileOutputStream stream = null;
		try{
			if(binaryData == null || binaryData.trim().equals("")) {
			    throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(binaryData);
			String fileName = UUID.randomUUID().toString().replace("-", "");
			
			stream = new FileOutputStream("C:\\tjoeun\\Semi\\SemiProject\\bonggeuda\\WebContent\\resources\\taxBill\\" + fileName + ".png");
			stream.write(file);
			stream.close();
			
			response.setContentType("application/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			
			System.out.println(requestNo);
			updateResult = service.updateTaxRequest(requestNo);
			
			insertResult = service.insertTaxHistory(requestNo, fileName + ".png");
			
			if((updateResult + insertResult) == 2) {
				System.out.println("이력 추가, 요청 업데이트 완료");
			}
			out.print("taxSuccess");
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("에러 발생");
		}finally{
			if(stream != null) {
				stream.close();
			}
		}
		
	}

}

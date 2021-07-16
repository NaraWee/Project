package com.bonggeuda.sugbag.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.bonggeuda.sugbag.model.dto.CoronaDTO;

/**
 * Servlet implementation class CoronaApi
 */
@WebServlet("/corona")
public class CoronaApi extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=xilaYHcUNStD%2F2bxMMkrYQSpisQEevP%2Fq8qf81gEiXCnroOxo%2Fc6W5HsYbqNw16iOD3U9WV1%2Ffe1cFPVY1ayzg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("xilaYHcUNStD%2F2bxMMkrYQSpisQEevP%2Fq8qf81gEiXCnroOxo%2Fc6W5HsYbqNw16iOD3U9WV1%2Ffe1cFPVY1ayzg%3D%3D", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        Date today = new Date();
        Calendar day = Calendar.getInstance();
        day.add(Calendar.DATE, -1);
        SimpleDateFormat simpleToday = new SimpleDateFormat("yyyyMMdd");
        String formatToday = simpleToday.format(day.getTime());
        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(formatToday, "UTF-8")); /*검색할 생성일 범위의 시작*/
        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(formatToday, "UTF-8")); /*검색할 생성일 범위의 종료*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        /*xml Java 파싱*/
        
        //parsing 할 url
        String parsingUrl = url.toString();
//        System.out.println(parsingUrl);
        
        //페이지에 접근하기 위한 Document객체 생성
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder;
        //페이지에 접근하기 위한 Document객체 생성(1-try-catch)
		try {
			dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(parsingUrl);
			doc.getDocumentElement().normalize();
			//파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			XmlParsing getValue = new XmlParsing();
			CoronaDTO coronaInfo = new CoronaDTO();
			for(int i = 0; i < nList.getLength(); i++) {
				Node nNode = nList.item(i);
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					
					if(getValue.getTagValue("gubun",eElement).equals("제주")) {
						coronaInfo.setDate(getValue.getTagValue("stdDay", eElement));
						coronaInfo.setIncDec(getValue.getTagValue("incDec", eElement));
						coronaInfo.setDefCnt(getValue.getTagValue("defCnt", eElement));
						coronaInfo.setIsolIngCnt(getValue.getTagValue("isolIngCnt", eElement));
						coronaInfo.setIsolClearCnt(getValue.getTagValue("isolClearCnt", eElement));
					}
				}
			}
			HttpSession session = request.getSession();
			session.setAttribute("coronaInfo", coronaInfo);
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} finally {
			String path = "/WEB-INF/views/guest/main/main.jsp";
			request.getRequestDispatcher(path).forward(request, response);
		}
//      페이지에 접근하기 위한 Document객체 생성(2-throws)
//      dBuilder = dbFactory.newDocumentBuilder();
//		Document doc = dBuilder.parse(parsingUrl);
//		doc.getDocumentElement().normalize();
//		System.out.println("Root element : " + doc.getDocumentElement().getNodeName()); //최상위 태그
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

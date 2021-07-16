package com.nobanryeo.petpal.admin.mainpage.service;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.BoardTotalViewsDTO;
import com.nobanryeo.petpal.admin.mainpage.dao.AdminMainMapper;

@Service
public class MainPageServiceImpl implements MainPageService{

	// 매퍼 전역변수
	private AdminMainMapper adminMainMapper;
	
	// 생성자를 통한 DI
	@Autowired
	public MainPageServiceImpl (AdminMainMapper adminMainMapper) {
		this.adminMainMapper = adminMainMapper;
	}

	@Override
	public JSONObject getChartData() {
		
		int month1 = 0;
		List<Integer> revenues = new ArrayList<Integer>();
		
		// 5, 6, 7, 8월 월별 매출액
		for (month1 = 5; month1 <= 8; month1 ++) {
			
			int fullMonth = Integer.parseInt("20210" + month1 + "01");
			
			AdminPageInfoDTO cat = new AdminPageInfoDTO(fullMonth);
			
			// 월별 매출액
			Integer totalMonth = adminMainMapper.selectMonthRevenue(cat);
			
			if(totalMonth == null) {
				totalMonth = 0;
			}
			
			// 월별 매출액을 리스트에 넣어주기
			revenues.add(totalMonth);
			
		}
		
		
		// 리턴할 json 객체
		JSONObject data = new JSONObject();
		
		// json의 컬럼 객체
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		
		// json 배열 객체, 배열에 저장할 때엔 JSONArray() 사용
		JSONArray title = new JSONArray();
		col1.put("label", "Month");
		col1.put("type", "string");
		col2.put("label", "Revenue");
		col2.put("type", "number");
		
		
		// 테이블행에 컬럼 추가
		title.add(col1);
		title.add(col2);
		
		// json 객체에 타이틀행 추가
		data.put("cols", title); //{"cols" : [{"label" : "Month","type":"number"}, {"label" : "Revenue", "type" : "number"}]}
		
		JSONArray body = new JSONArray(); // json 배열 사용하기 위해 객체 생성
		

	    JSONObject month01 = new JSONObject();
	    JSONObject revenue01 = new JSONObject();

	    month01.put("v","5월");
	    revenue01.put("v",revenues.get(0));
	    
	    JSONObject month02 = new JSONObject();
	    JSONObject revenue02 = new JSONObject();
	 
	    month02.put("v","6월");
	    revenue02.put("v",revenues.get(1));
	    
	    JSONObject month03 = new JSONObject();
	    JSONObject revenue03 = new JSONObject();
	 
	    month03.put("v","7월");
	    revenue03.put("v",revenues.get(2));
	    
	    JSONObject month04 = new JSONObject();
	    JSONObject revenue04 = new JSONObject();
	    
	    month04.put("v","8월");
	    revenue04.put("v",revenues.get(3));
	    
	    JSONArray row1 = new JSONArray();
	    JSONArray row2 = new JSONArray();	    
	    JSONArray row3 = new JSONArray();	    
	    JSONArray row4 = new JSONArray();	    
	    
	    row1.add(month01);
	    row1.add(revenue01);
	    row2.add(month02);
	    row2.add(revenue02);
	    row3.add(month03);
	    row3.add(revenue03);
	    row4.add(month04);
	    row4.add(revenue04);

	    JSONObject cel1 = new JSONObject();
	    JSONObject cel2 = new JSONObject();
	    JSONObject cel3 = new JSONObject();
	    JSONObject cel4 = new JSONObject();
	    
	    cel1.put("c",row1); 
	    cel2.put("c",row2); 
	    cel3.put("c",row3); 
	    cel4.put("c",row4); 
	    
	    body.add(cel1);
	    body.add(cel2);
	    body.add(cel3);
	    body.add(cel4);
	    
	    data.put("rows",body);
	    
		System.out.println("data : " + data);
		
		return data;  // 이 데이터가 넘어가면  json 형식으로 넘어가서 json이 만들어짐
	}

	@Override
	public JSONObject getChartData2() {
		
		// 게시판별 조회수  db에서 가져오기
		List<BoardTotalViewsDTO> items = adminMainMapper.selectBoardTotalViews();
		
		// 리턴할 json 객체
		JSONObject data = new JSONObject();
		
		// json의 컬럼 객체
		JSONObject col1 = new JSONObject(); // 게시판
		JSONObject col2 = new JSONObject(); // 총조회수
		
		// json 배열 객체, 배열에 저장할 땐 JSONArray() 사용
		JSONArray title = new JSONArray();
		col1.put("label", "게시판");
		col1.put("type", "string");
		col2.put("label", "Total Views");
		col2.put("type", "number");
		
		// 테이블행에 컬럼 추가
		title.add(col1);
		title.add(col2);
		
		// json 객체에 타이틀행 추가
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		for (BoardTotalViewsDTO views : items) {
			
			JSONObject board = new JSONObject();
			board.put("v", views.getBoardType());
			
			System.out.println("board : " + board);
			
			JSONObject totalViews = new JSONObject();
			totalViews.put("v", views.getBoardTotalViews());
			
			JSONArray row = new JSONArray();
			row.add(board);
			row.add(totalViews);
			
			System.out.println("row : " + row);
			
			JSONObject cel1 = new JSONObject();
			cel1.put("c", row);
			body.add(cel1);
			
		}

		data.put("rows", body);
		
		System.out.println("게시판별 총 조회수 : " + data);
		
		return data;
	}
	
	
	
	
	
}

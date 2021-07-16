package com.nobanryeo.petpal.admin.mainpage.service;

import org.json.simple.JSONObject;

public interface MainPageService {
	
	public JSONObject getChartData(); // 월별 매출액
	
	public JSONObject getChartData2(); // 게시판별 조회수
	

}

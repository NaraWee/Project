package com.bonggeuda.sugbag.owner.notice.dao;

import static com.bonggeuda.sugbag.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bonggeuda.sugbag.common.config.ConfigLocation;
import com.bonggeuda.sugbag.model.dto.NoticeDTO;

public class NoticeDAO {

	private Properties prop = new Properties();

	public NoticeDAO() {

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION+"/owner/notice/notice-mapper.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<NoticeDTO> selectNotice(Connection con) {
		
		
		Statement stmt = null;
		
		ResultSet rset = null;

		/* 반환시킬 변수 지정 */
		List<NoticeDTO> selectNotice = null;
		
		/* --> selectedAll 가지고 xml감 */
		String query = prop.getProperty("selectNotice");
		

		/*디비에 들어가서 쿼리문에 따른 값 받아오기*/
		try {
			stmt = con.prepareStatement(query);
			
			rset = stmt.executeQuery(query);
			selectNotice = new ArrayList<>(); //모든 행을 다 받아서 최종 리스트를 만듬
			
			while(rset.next()) {
				
				NoticeDTO notice = new NoticeDTO();
				
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				notice.setNoticeWriteDate(rset.getDate("NOTICE_WRITE_DATE"));
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				
				selectNotice.add(notice); //한 행씩 저장됨
			}
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return selectNotice;
	}

}

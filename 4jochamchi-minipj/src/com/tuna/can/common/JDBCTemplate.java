
package com.tuna.can.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
    
	public static Connection getConnection() {  // static 메소드

	
		Connection con = null;
		
		Properties prop = new Properties();
		
		try {
			prop.load(new FileReader("config/connection-info.properties"));
			
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	// preparedStatement를 닫아주지않아도 된다 Statement 로  매개변수를 받기 떄문에 상속관계
	public static void close(Statement stmt) {
		
		try {
			if(stmt != null && !stmt.isClosed()) {
				
			stmt.close();
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection con) {
		
		try {
			if(con != null && !con.isClosed()) {
				
			con.close();
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	public static void close(ResultSet rset) {
		
		try {
			if(rset != null && rset.isClosed()) {
				
			rset.close();
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	/* 수동 Commit 이후 */
	
	public static void commit(Connection con) {
		
		try {
			
			if(con != null && !con.isClosed()) {
				con.commit();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con) {
		
		
		try {
			if(con != null && !con.isClosed()) {
				con.rollback();
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}


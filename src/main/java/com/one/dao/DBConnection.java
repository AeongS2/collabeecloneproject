package com.one.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	private static Connection conn = null; //getConnection메소드로만 접근할 수 있음
	public static Connection getConnection() {
		if(conn!=null) {//이미 접속함
			return conn;
		} else {//접속 해야하는 경우
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@192.168.1.7:1521:xe";//"jdbc:oracle:thin:@192.168.1.7:1521:xe";
			String dbid ="oraclePort";
			String dbpw="369369";
			
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, dbid, dbpw);
			}catch(Exception e) {
				e.printStackTrace();
			} 
			System.out.println("연결됨");
			return conn;
		}
	}
	
	public static void getClose(PreparedStatement pstmt, ResultSet rs) {
		try {
			pstmt.close();
			rs.close();
			System.out.println("닫힘");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void pstmtClose(PreparedStatement pstmt) {
		try {
			pstmt.close();
			System.out.println("닫힘");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

package com.ta.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection conn = null;
	public static Connection getConnection() {
		if(conn!=null) {
			return conn;
		} else {
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe"; //    @localhost:1521:xe @192.168.1.7:1521:xe
			String dbID = "oraclePort";
			String dbPW = "369369";	
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, dbID, dbPW);
			} catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
	}
}

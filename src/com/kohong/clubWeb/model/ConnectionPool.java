package com.kohong.clubWeb.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionPool {
	private static ConnectionPool cp;
	
	private ConnectionPool() throws ClassNotFoundException{
		Class.forName("oracle.jdbc.OracleDriver");
	}
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		if(cp == null){
			cp = new ConnectionPool();
		}
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String id = "hr";
		String pw = "hr";
		return DriverManager.getConnection(url, id, pw);
	}
}

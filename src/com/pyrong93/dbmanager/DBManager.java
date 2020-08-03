package com.pyrong93.dbmanager;

import java.sql.Connection;
import java.sql.DriverManager;
public class DBManager {
	private static Connection conn;
	public DBManager() {
		conn = null;
	}
	public static Connection getConn() {
		return conn;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pyrong93?useSSL=false", "pyrong93", "dlfdjsk82!");
		} catch(Exception e){
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pyrong93?useSSL=false", "root", "1234");
			} catch(Exception e2) {
				e.printStackTrace();
				e2.printStackTrace();
			}
		}
		return conn;
	}
}


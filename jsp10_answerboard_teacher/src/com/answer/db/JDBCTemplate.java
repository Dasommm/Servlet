package com.answer.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

	public static Connection getConnection() {
		// 1
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("1.driver 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("[error] : 1");
			e.printStackTrace();
		}
		
		// 2
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kh";
		String password = "kh";
		
		Connection con = null;
	
		try {
			con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
			System.out.println("2.계정 연결");
		
		} catch (SQLException e) {
			System.out.println("[error] : 2");
			e.printStackTrace();
		}
		
		return con;
	}

	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs, Statement stmt, Connection con) {
		close(rs);
		close(stmt);
		close(con);
	}
	public static void close(Statement stmt, Connection con) {
		close(stmt);
		close(con);
	}

	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}










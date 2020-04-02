package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

	public static Connection getConnection() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("[ERROR] : 1");
			e.printStackTrace();
		}
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="kh";
		String password="kh";
		
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url,user,password);
			con.setAutoCommit(false);
		} catch (SQLException e) {
			System.out.println("[ERROR] : 2");
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static void close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			System.out.println("[ERROR] : 5");
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println("[ERROR]: 5");
				e.printStackTrace();
			}
	}
	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("[ERROR] : 5");
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs, Statement stmt, Connection con) {
		
		try {
			con.close();
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			System.out.println("[ERROR] : 5");
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt, Connection con) {
		
		try {
			con.close();
			stmt.close();
		} catch (SQLException e) {
			System.out.println("[ERROR] : 5");
			e.printStackTrace();
		}
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

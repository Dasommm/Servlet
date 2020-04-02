package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dto.MyDto;

public class MyDao {

	public List<MyDto> selectList(){
		//1.driver 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("1.드라이버연결");
		} catch (ClassNotFoundException e) {
			System.out.println("[ERROR] :1"); 	//이렇게 에러를 찍어주는 것을 로그라고 한다
			e.printStackTrace();
		}	
		
		//2.계정연결
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user ="kh";
		String password ="kh";
		
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url,user,password);
			System.out.println("2.계정연결");			
		} catch (SQLException e) {
			System.out.println("[ERROR] :2"); 
			e.printStackTrace();
		}

		//3.query준비
		Statement stmt = null;
		ResultSet rs = null;
		String sql = " SELECT MYNO, MYNAME, MYTITLE, MYCONTENT,MYDATE "
				+ " FROM MYBOARD "
				+ " ORDER BY MYNO DESC ";
		List<MyDto> list = new ArrayList<MyDto>();
		
		try {
			stmt = con.createStatement();
			System.out.println("3. query준비" + sql);
			
		//4.실행 및 리턴
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MyDto dto = new MyDto();
				dto.setMyNo(rs.getInt(1));
				dto.setMyName(rs.getString("MYNAME"));
				dto.setMyTitle(rs.getString(3));
				dto.setMyContent(rs.getString(4));
				dto.setMyDate(rs.getDate(5));
				
				list.add(dto);
			}
			System.out.println("4.실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("[ERROR] :3,4"); 
			e.printStackTrace();
		}finally {

			//5.db종료
			
			try {
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println("5.db종료");
		}	
		
		return list;
	}
	
	public MyDto selectOne(int myNo) {
		
		//1.드라이버 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("1.드라이버연결");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		//2.계정연결
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user="kh";
		String password="kh";
		
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url,user,password);
			System.out.println("계정연결");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("[ERROR] :2");
		}
		
		//3.query준비
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = " SELECT MYNO, MYNAME, MYTITLE, MYCONTENT,MYDATE "
				+ " FROM MYBOARD "
				+ " WHERE MYNO = " + myNo;
		
		MyDto res = null;
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				res = 
				new MyDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			try {
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		
		return res;
	}
	
	public int insert(MyDto dto) {
		
		//1.드라이버 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("1.드라이버 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("[ERROR] :1");
			e.printStackTrace();
		}
		
		//2.계정연결
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user="kh";
		String password="kh";
		
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url,user,password);
			System.out.println("2.계정연결");
		} catch (SQLException e) {
			System.out.println("[ERROR]:2");
			e.printStackTrace();
		}
		
		//3. query준비
		PreparedStatement pstm  = null;
		int res = 0;
		
		String sql = "INSERT INTO MYBOARD "
				+ " VALUES(MYSEQ.NEXTVAL, ?, ?, ?, SYSDATE) ";	
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,  dto.getMyName());
			pstm.setString(2, dto.getMyTitle());
			pstm.setString(3, dto.getMyContent());
			System.out.println("3.query 준비 : " + sql);
			
			//4.실행 및 리턴
			res = pstm.executeUpdate();
			System.out.println("4.실행 및 리턴");			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("[ERROR] :4");
		}finally {
			
			//5.db종료
			try {
				pstm.close();
				con.close();
				System.out.println("5.db종료");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("[ERROR] :5");
			}
			
		}
		return res;
	}
	
	public int update(MyDto dto) {
		
		//1.드라이버 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		//2.계정연결
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user="kh";
		String password="kh";
		
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MYBOARD SET MYTITLE=?, MYCONTENT=? "
				+ " WHERE MYNO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyTitle());
			pstm.setString(2, dto.getMyContent());
			pstm.setInt(3, dto.getMyNo());	
			
			res = pstm.executeUpdate();
			System.out.println("4.실행 및 리턴");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{		
			
			try {
				pstm.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		
		return res;
	}
	
	public int delete(int myNo) {
		
		//1.드라이버 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//2
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user="kh";
		String password="kh";
		
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(url,user,password);
			System.out.println("2.계정연결");
		} catch (SQLException e) {
			System.out.println("[ERROR]:2");
			e.printStackTrace();
		}
		
		//3
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM MYBOARD WHERE MYNO = ? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myNo);
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstm.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		
		return res;
	}
	
	
}

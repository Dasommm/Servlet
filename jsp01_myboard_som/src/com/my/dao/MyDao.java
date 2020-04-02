package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.my.db.JDBCTemplate;
import com.my.dto.MyDto;

public class MyDao extends JDBCTemplate{

	public List<MyDto> selectList(){
				
		Connection con = getConnection();		
		Statement stmt = null;
		ResultSet rs = null;
		
		List<MyDto> list = new ArrayList<MyDto>();
		
		//쿼리준비
		String sql = " SELECT MYNO, MYNAME, MYTITLE, MYCONTENT, MYDATE "
				+ " FROM MYBOARD ORDER BY MYNO DESC ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyDto dto = new MyDto();
				dto.setMyno(rs.getInt(1));
				dto.setMyname(rs.getString(2));
				dto.setMytitle(rs.getString(3));
				dto.setMycontent(rs.getString(4));
				dto.setMydate(rs.getDate(5));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			close(con);
			
		}
		return list;
	}
	
	public MyDto selectOne(int myno) {	
		
		//1,2
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		MyDto dto = null;
		
		//3
		String sql = " SELECT MYNO, MYNAME, MYTITLE, MYCONTENT, MYDATE "
				+ " FROM MYBOARD "
				+ " WHERE MYNO = ? ";
		
		
		try {// 쿼리 준비
			pstm = con.prepareStatement(sql);
			pstm.setInt(1,myno);
			
			//실행 및 리턴
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto = new MyDto();
				dto.setMyno(rs.getInt(1));
				dto.setMyname(rs.getString(2));
				dto.setMytitle(rs.getString(3));
				dto.setMycontent(rs.getString(4));
				dto.setMydate(rs.getDate(5));
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return dto;
	}
	
	public int insert(MyDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO MYBOARD "
				+ " VALUES(MYSEQ.NEXTVAL,?,?,?,SYSDATE) ";
		//pstm = con.prepareStatement(" INSERT INTO MYBOARD VALUES(MYSEQ.NEXTVAL,?,?,?,SYSDATE) ";
		//로 써도 된다
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyname());
			pstm.setString(2, dto.getMytitle());
			pstm.setString(3, dto.getMycontent());
			
			//쿼리 실행해서 받는 결과값
			res = pstm.executeUpdate();
			
			if(res >0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("[error] : 3,4");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
			
		return res;
	}
	
	public int update(MyDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MYBOARD SET MYTITLE = ?, MYCONTENT =? "
				+ " WHERE MYNO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMytitle());
			pstm.setString(2, dto.getMycontent());
			pstm.setInt(3, dto.getMyno());
		
			res = pstm.executeUpdate();
			
			if(res >0) {
				commit(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	
	public int delete(int myno) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM MYBOARD WHERE MYNO = ?";
		
		System.out.println(myno);
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);
			
			res = pstm.executeUpdate();
			
			if(res >0) {
				con.commit();
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("[error] 3,4");
		}finally {
			close(pstm);
			close(con);
		}		
		
		return res;
	}
	
	
}

package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.db.JDBCTemplate;
import com.dto.SomDto;

public class SomDao extends JDBCTemplate{
	
	
	public List<SomDto> selectAll(){
		
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = " SELECT SNUM, SNAME, STITLE, SCONTENT, SDATE "
				+ " FROM SOMBOARD ORDER BY SNUM DESC ";
		
		List<SomDto> list = new ArrayList<SomDto>();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			SomDto dto = new SomDto();
			dto.setSnum(rs.getInt(1));
			dto.setSname(rs.getString(2));
			dto.setStitle(rs.getString(3));
			dto.setScontent(rs.getString(4));
			dto.setSdate(rs.getDate(5));
			
			list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(con);
		}
				
		return list;
		
	}

	public SomDto selectOne(int snum) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		SomDto dto = null;
		String sql = " SELECT SNUM, SNAME, STITLE, SCONTENT, SDATE "
				+ " FROM SOMBOARD "
				+ " WHERE SNUM =? ";		
		try {
			
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, snum);
				
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto = new SomDto();	//while안에 넣어두기..왜..?
				dto.setSnum(rs.getInt(1));
				dto.setSname(rs.getString(2));
				dto.setStitle(rs.getString(3));
				dto.setScontent(rs.getString(4));
				dto.setSdate(rs.getDate(5));
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
	
	public int insert(SomDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO SOMBOARD "
				+ " VALUES(SOMSEQ.NEXTVAL, ?,?,?,SYSDATE) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getSname());
			pstm.setString(2, dto.getStitle());
			pstm.setString(3, dto.getScontent());
			
			res = pstm.executeUpdate();
			
			if(res >0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	
	public int update(SomDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE SOMBOARD SET STITLE = ?, SCONTENT=? "
				+ " WHERE SNUM=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getStitle());
			pstm.setString(2, dto.getScontent());
			pstm.setInt(3, dto.getSnum());
			
			res = pstm.executeUpdate();
			
			if(res >0 ) {
				commit(con);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	
	public int delete(int snum) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM SOMBOARD WHERE SNUM =? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, snum);

			res = pstm.executeUpdate();
			
			if(res >0) {
				con.commit();;
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstm);
			close(con);
			
		}
		
		return res;
	}
	
	public int multiDelete(String[] snum) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM SOMBOARD WHERE SNUM=? ";
		
		int [] cnt = null;
		
			try {
				pstm = con.prepareStatement(sql);
			
				for(int i = 0; i <snum.length ; i++) {
					pstm.setString(1, snum[i]);	//왜 string인지?
					pstm.addBatch();
					System.out.println("delete no :"+snum[i]);
				}
				
				cnt = pstm.executeBatch();
				
				for(int i = 0; i<cnt.length;i++) {
					if(cnt[i]==-2) {
						res++;
					}
				}
			if(res == snum.length) {
				commit(con);
			}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstm);
				close(con);
			}
			
			
		return res;
	}
}















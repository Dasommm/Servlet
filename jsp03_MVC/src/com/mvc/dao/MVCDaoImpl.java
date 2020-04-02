package com.mvc.dao;

import static com.mvc.db.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import comm.mvc.dto.MVCDto;

public class MVCDaoImpl implements MVCDao {

	@Override
	public List<MVCDto> selectList() {

		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		List<MVCDto> list = new ArrayList<MVCDto>();
		
		try {
			stmt = con.createStatement();
			//pstm 으로 하면 
			//pstm = con.preparedStatement(Select_list_sql); 해도 된다
			
			rs = stmt.executeQuery(SELECT_LIST_SQL);
			
			while(rs.next()) {
				MVCDto dto = new MVCDto();
				dto.setSeq(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
				
				list.add(dto);
			}
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			close(con);
			
		}
		
		return list;
	}

	@Override
	public MVCDto selectOne(int seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		MVCDto dto = new MVCDto();
		try {
			pstm = con.prepareStatement(SELECT_ONE_SQL);
				pstm.setInt(1, seq);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto.setSeq(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
				
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

	@Override
	public int insert(MVCDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(INSERT_SQL);
			pstm.setString(1, dto.getWriter());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			System.out.println("query");
			
			res = pstm.executeUpdate();
			System.out.println("run & return");
			
			if(res >0) {
				commit(con);
			}
		
		} catch (SQLException e) {
			System.out.println("error 3,4");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
	
		return res;
	}

	@Override
	public int update(MVCDto dto) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(UPDATE_SQL);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());
			
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

	@Override
	public int delete(int seq) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(DELETE_SQL);
			pstm.setInt(1, seq);
			
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

	@Override
	public boolean multiDelete(String[] seqs) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		int[] cnt = null;	//결과값을 담을 배열
		
		try {
			pstm = con.prepareStatement(DELETE_SQL);
			
			for(int i = 0; i<seqs.length;i++) {
				pstm.setString(1, seqs[i]);
				pstm.addBatch(); //메모리에 미리 저장
				System.out.println("delete no :"+seqs[i]);
			}
			System.out.println("query");
		
			cnt = pstm.executeBatch();
			System.out.println("run & return");
			
			for(int i = 0; i<cnt.length;i++) {
				if(cnt[i]==-2) {
					res++;	//성공한 갯수를 세어줄거다
				}
				
			}
			if(res == seqs.length) {
				commit(con);
			}else {
				rollback(con);
				res = 0;				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);			
		}	
		
		return (res==seqs.length)? true : false;
		//삭제된 갯수가 글 삭제 갯수가 같으면 true, 아니면 false
		// ture는 다 삭제 됏다, false는 실패했다
	}

}

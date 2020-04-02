package com.answer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.answer.db.JDBCTemplate;
import com.answer.dto.AnswerDto;

public class AnswerDao extends JDBCTemplate{

	public List<AnswerDto> selectList(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<AnswerDto> list = new ArrayList<AnswerDto>();
		String sql = " SELECT * FROM ANSWERBOARD "
				   + " ORDER BY GROUPNO DESC, GROUPSEQ ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("3.query 준비 : " + sql);
			rs = pstm.executeQuery();
			System.out.println("4.실행 및 리턴");
			while(rs.next()) {
				AnswerDto dto = new AnswerDto();
				dto.setBoardno(rs.getInt(1));
				dto.setGroupno(rs.getInt(2));
				dto.setGroupseq(rs.getInt(3));
				dto.setTitletab(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setWriter(rs.getString(7));
				dto.setRegdate(rs.getDate(8));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("[error] : 3, 4");
			e.printStackTrace();
		} finally {
			close(rs,pstm,con);
			System.out.println("5.db 종료");
		}
		
		return list;
	}
	
	public AnswerDto selectOne(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM ANSWERBOARD "
				   + " WHERE BOARDNO = ? ";
		AnswerDto dto = null;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardno);
			System.out.println("3.query 준비 : " + sql);
			rs = pstm.executeQuery();
			System.out.println("4.실행 및 리턴");
			while(rs.next()) {
				dto = new AnswerDto();
				dto.setBoardno(rs.getInt(1));
				dto.setGroupno(rs.getInt(2));
				dto.setGroupseq(rs.getInt(3));
				dto.setTitletab(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setWriter(rs.getString(7));
				dto.setRegdate(rs.getDate(8));
			}
			
		} catch (SQLException e) {
			System.out.println("[error] : 3, 4");
			e.printStackTrace();
		} finally {
			close(rs,pstm,con);
			System.out.println("5.db 종료");
		}
		
		return dto;
	}
	
	public int insert(AnswerDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO ANSWERBOARD "
				   + " VALUES(BOARDNOSEQ.NEXTVAL,GROUPNOSEQ.NEXTVAL, "
				   + " 1,0,?,?,?,SYSDATE) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getWriter());
			System.out.println("3.query 준비 : " + sql);
		
			res = pstm.executeUpdate();
			System.out.println("4.실행 및 리턴");
			if(res > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("[error] : 3, 4");
			e.printStackTrace();
		} finally {
			close(pstm, con);
			System.out.println("5.db 종료");
		}
		
		return res;
	}

	public int update(AnswerDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " UPDATE ANSWERBOARD"
				   + " SET TITLE = ?, CONTENT = ? "
				   + " WHERE BOARDNO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getBoardno());
			System.out.println("3.query 준비 : " + sql);
		
			res = pstm.executeUpdate();
			System.out.println("4.실행 및 리턴");
			if(res > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("[error] : 3, 4");
			e.printStackTrace();
		} finally {
			close(pstm, con);
			System.out.println("5.db 종료");
		}
		
		return res;
	}
	
	public int delete(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " DELETE FROM ANSWERBOARD WHERE BOARDNO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardno);
			System.out.println("3.query 준비 : " + sql);
		
			res = pstm.executeUpdate();
			System.out.println("4.실행 및 리턴");
			if(res > 0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("[error] : 3, 4");
			e.printStackTrace();
		} finally {
			close(pstm, con);
			System.out.println("5.db 종료");
		}
		
		return res;
	}
	
}














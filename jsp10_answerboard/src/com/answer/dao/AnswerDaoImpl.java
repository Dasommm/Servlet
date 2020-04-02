package com.answer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.answer.db.JDBCTemplate;
import com.answer.dto.answerDto;

public class AnswerDaoImpl extends JDBCTemplate implements AnswerDao {

	@Override
	public List<answerDto> selectAll() {
		
		Connection con = getConnetcion();		
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<answerDto> list = new ArrayList<answerDto>();
		try {
			pstm = con.prepareStatement(SELECT_ALL_SQL);

			rs = pstm.executeQuery();
			while(rs.next()) {
				answerDto dto = new answerDto(
						rs.getInt(1),
						rs.getInt(2),
						rs.getInt(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getDate(8));
				
				list.add(dto);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}	
		
		return list;
	}

	@Override
	public answerDto selectOne(int boardno) {
		
		Connection con = getConnetcion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		answerDto dto = null;
		
		try {
			pstm = con.prepareStatement(SELECT_ONE_SQL);
			pstm.setInt(1, boardno);
		
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto = new answerDto(
						rs.getInt(1),
						rs.getInt(2),
						rs.getInt(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getDate(8));
				
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
	public int insert(answerDto dto) {
		
		Connection con = getConnetcion();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(INSERT_SQL);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getWriter());
			
			res = pstm.executeUpdate();
			
			if(res>0) {
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
	public int update(answerDto dto) {

		Connection con = getConnetcion();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(UPDATE_SQL);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getBoardno());
			
			res = pstm.executeUpdate();
			
			if(res>0) {
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
	public int delete(int boardno) {

		Connection con = getConnetcion();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(DELETE_SQL);
		pstm.setInt(1, boardno);
		
		res = pstm.executeUpdate();
		
		if(res>0) {
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
	public int replyInsertUpdate(int parentboardno) {
		   
		Connection con = getConnetcion();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(REPLY_INSERT_UPDATE_SQL);
			pstm.setInt(1, parentboardno);
			pstm.setInt(1, parentboardno);
			
			res = pstm.executeUpdate();
			
			if(res>0) {
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
	public int replyInsert(answerDto dto) {

		Connection con = getConnetcion();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(REPLY_INSERT_SQL);
			pstm.setInt(1, dto.getBoardno());
			pstm.setInt(2, dto.getBoardno());
			pstm.setInt(3, dto.getBoardno());
			pstm.setString(4, dto.getTitle());
			pstm.setString(5, dto.getContent());
			pstm.setString(6, dto.getWriter());
			
			res = pstm.executeUpdate();
			
			if(res>0) {
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

}















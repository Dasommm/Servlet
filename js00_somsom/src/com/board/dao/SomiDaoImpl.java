package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.board.db.JDBCTemplate;
import com.board.dto.SomiDto;

public class SomiDaoImpl extends JDBCTemplate implements SomiDao {

	@Override
	public List<SomiDto> selectAll() {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<SomiDto> list = new ArrayList<SomiDto>();
		
		try {
			pstm = con.prepareStatement(SELECT_ALL_SQL);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				SomiDto dto = new SomiDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));

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
	public SomiDto selectOne(int seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		SomiDto dto = null;
		
		try {
			pstm = con.prepareStatement(SELECT_ONE_SQL);
			pstm.setInt(1, seq);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto = new SomiDto(rs.getInt(1),
						rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getDate(5));
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
	public int insert(SomiDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(INSERT_SQL);
			pstm.setString(1, dto.getName());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			
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
	public int update(SomiDto dto) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(UPDATE_SQL);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());
			
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

}

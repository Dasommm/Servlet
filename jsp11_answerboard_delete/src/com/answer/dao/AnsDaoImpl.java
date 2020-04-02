package com.answer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.answer.db.JDBCTemplate;
import com.answer.dto.AnsDto;

public class AnsDaoImpl extends JDBCTemplate implements AnsDao {

	@Override
	public List<AnsDto> selectAll() {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<AnsDto> list = new ArrayList<AnsDto>();
		
		try {
			pstm = con.prepareStatement(SELECT_ALL_SQL);

			rs = pstm.executeQuery();
			while(rs.next()) {
				AnsDto dto = new AnsDto(rs.getInt(1),
										rs.getInt(2),
										rs.getInt(3),
										rs.getInt(4),
										rs.getString(5),
										rs.getString(6),
										rs.getString(7),
										rs.getDate(8),
										rs.getString(9));
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
	public AnsDto selectOne(int bdno) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		AnsDto dto = null;
		
		try {
			pstm = con.prepareStatement(SELECT_ONE_SQL);
			pstm.setInt(1, bdno);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto = new AnsDto(rs.getInt(1),
								rs.getInt(2),
								rs.getInt(3),
								rs.getInt(4),
								rs.getString(5),
								rs.getString(6),
								rs.getString(7),
								rs.getDate(8),
								rs.getString(9));
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
	public int insert(AnsDto dto) {

		Connection con = getConnection();
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
	public int update(AnsDto dto) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(UPDATE_SQL);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getBdno());
			
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
	public int delete(int bdno) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(DELETE_SQL);
			pstm.setInt(1, bdno);
			
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

	//댓글 작성시 업데이트
	@Override
	public int rpUpdate(int bdno) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(RP_UPDATE_SQL);
			pstm.setInt(1, bdno);
			pstm.setInt(2, bdno);

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
	//댓글 작성시 작성
	@Override
	public int reInsert(AnsDto dto) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(RP_INSERT_SQL);
			pstm.setInt(1, dto.getBdno());
			pstm.setInt(2, dto.getBdno());
			pstm.setInt(3, dto.getBdno());
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

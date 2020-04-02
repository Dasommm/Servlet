package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.login.db.JDBCTemplate;
import com.login.dto.MbDto;

public class MbDaoImpl extends JDBCTemplate implements MbDao {

	@Override
	public List<MbDto> selectAll() {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<MbDto> list = new ArrayList<MbDto>();
		
		try {
			pstm = con.prepareStatement(SELECT_ALL_SQL);
			
			rs = pstm.executeQuery();
			while(rs.next()){
				MbDto dto = new MbDto();
				dto.setMbno(rs.getInt(1));
				dto.setMbid(rs.getString(2));
				dto.setMbpw(rs.getString(3));
				dto.setMbname(rs.getString(4));
				dto.setMbaddr(rs.getString(5));
				dto.setMbmobile(rs.getString(6));
				dto.setMbenabled(rs.getString(7));
				dto.setMbroll(rs.getString(8));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		
		return null;
	}

	@Override
	public List<MbDto> selectEnabled() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updaterole(int mbno, String mbrole) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MbDto login(String mbid, String mbpw) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		MbDto dto = null;
		
		try {
			pstm = con.prepareStatement(LOGIN_SQL);
			pstm.setString(1, mbid);
			pstm.setString(2, mbpw);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto = new MbDto();
				dto.setMbno(rs.getInt(1));
				dto.setMbid(rs.getString(2));
				dto.setMbpw(rs.getString(3));
				dto.setMbname(rs.getString(4));
				dto.setMbaddr(rs.getString(5));
				dto.setMbmobile(rs.getString(6));
				dto.setMbemail(rs.getString(7));
				dto.setMbenabled(rs.getString(8));
				dto.setMbroll(rs.getString(9));
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstm);
			close(con);
		}
		
		
		return dto;
	}

	@Override
	public MbDto idChk(String mbid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int join(MbDto dto) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(JOIN_SQL);
			pstm.setString(1, dto.getMbid());
			pstm.setString(2, dto.getMbpw());
			pstm.setString(3, dto.getMbname());
			pstm.setString(4, dto.getMbaddr());
			pstm.setString(5, dto.getMbmobile());
			pstm.setString(6, dto.getMbemail());
			
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
	public MbDto inquire(String mbid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateInfo(MbDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteInfo(String mbid) {
		// TODO Auto-generated method stub
		return 0;
	}

}

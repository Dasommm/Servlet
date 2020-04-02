package com.cal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cal.db.JDBCTemplate;
import com.cal.dto.CalDto;

public class CalDao extends JDBCTemplate{
	
	//아이디가 같아야하고, 선택한 날짜(--년 --월 --일)의 모든 일정을 가져오기 때문에
	public List<CalDto> selectAll(String id, String yyyyMMdd){
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<CalDto> list = new ArrayList<CalDto>();
		
		String sql = " SELECT * FROM CALBOARD WHERE ID =? AND SUBSTR(MDATE,1,8) =? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, yyyyMMdd);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				CalDto dto = new CalDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setMdate(rs.getString(5));
				dto.setRegdate(rs.getDate(6));
				
				list.add(dto);
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);
			
		}		
		return list;
		
	}
	public CalDto selectOne(int seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		CalDto dto = null;
		
		String sql = " SELECT * FROM CALBOARD WHERE SEQ = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto = new CalDto(rs.getInt(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getDate(6));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);
		}
		
		return dto;
		
	}
	
	public int insert(CalDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO CALBOARD VALUES(CALBOARDSEQ.NEXTVAL,?,?,?,?,SYSDATE) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getId());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			pstm.setString(4, dto.getMdate());
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm,con);
		}
		
		return res;
	}
	
	public int update(CalDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE CALBOARD SET TITLE =?, CONTENT = ?, MDATE=? "
				+ " WHERE SEQ =? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getMdate());
			pstm.setInt(4, dto.getSeq());
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm,con);
		}
		
		
		return res;
	}
	public int delete(int seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM CALBOARD WHERE SEQ =? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm,con);
			
		}
		
		return res;
	}
	
	public List<CalDto> getCalViewList(String id, String yyyyMM){
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<CalDto> list = new ArrayList<CalDto>();
				
		String sql = " SELECT * FROM ( " + 
				"	SELECT (ROW_NUMBER() OVER(PARTITION BY SUBSTR(MDATE,1,8) ORDER BY MDATE)) RN, " + 
				"	SEQ, ID, TITLE, CONTENT, MDATE, REGDATE " + 
				"	FROM CALBOARD " + 
				"	WHERE ID= ? AND SUBSTR(MDATE,1,6)=? "+ 
				" ) " + 
				" WHERE RN BETWEEN 1 AND 3 ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, yyyyMM);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				CalDto dto = new CalDto();
				dto.setSeq(rs.getInt(2));	//2부터 시작인 이유는 1번째에 rn이 들어가기 때문이다
				dto.setId(rs.getString(3));		// 1로시작하고 싶다면 sql문에서 select *...이 아니라 select seq, id, title...으로 써줘야한다
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setMdate(rs.getString(6));
				dto.setRegdate(rs.getDate(7));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs, pstm, con);
		}
		
		return list;
	}
	
	public int getCalCount(String id,String yyyyMMdd) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;
		
		String sql = " SELECT COUNT(*) FROM CALBOARD WHERE ID =? AND SUBSTR(MDATE,1,8) =? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, yyyyMMdd);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				res = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);
		}
		
		
		return res;
		
		
	}
	

}

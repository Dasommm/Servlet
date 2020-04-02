package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import static com.login.db.JDBCTemplate.*;
import com.login.dto.MyMemberDto;

public class MyMemberDaoImpl implements MyMemberDao {

	@Override
	public List<MyMemberDto> selectList() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<MyMemberDto> list = new ArrayList<MyMemberDto>();
		
		String sql = " SELECT * FROM MYMEMBER ORDER BY MYNO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				MyMemberDto dto = new MyMemberDto();
					dto.setMyno(rs.getInt(1));
					dto.setMyid(rs.getString(2));
					dto.setMypw(rs.getString(3));
					dto.setMyname(rs.getString(4));
					dto.setMyaddr(rs.getString(5));
					dto.setMyphone(rs.getString(6));
					dto.setMyemail(rs.getString(7));
					dto.setMyenabled(rs.getString(8));
					dto.setMyrole(rs.getString(9));
				
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
	public List<MyMemberDto> selectEnabled() {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<MyMemberDto> list = new ArrayList<MyMemberDto>();
		
		String sql = " SELECT * FROM MYMEMBER WHERE MYENABLED = 'Y' "
				+ " ORDER BY MYNO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				MyMemberDto dto = new MyMemberDto();
					dto.setMyno(rs.getInt(1));
					dto.setMyid(rs.getString(2));
					dto.setMypw(rs.getString(3));
					dto.setMyname(rs.getString(4));
					dto.setMyaddr(rs.getString(5));
					dto.setMyphone(rs.getString(6));
					dto.setMyemail(rs.getString(7));
					dto.setMyenabled(rs.getString(8));
					dto.setMyrole(rs.getString(9));
				
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
	public int updateRole(int myno, String myrole) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MYMEMBER SET MYROLE= ? "
				+ " WHERE MYNO = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, myrole);
			pstm.setInt(2, myno);
			
			res = pstm.executeUpdate();

			if(res>0) {
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

	@Override
	public MyMemberDto login(String myid, String mypw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		//MyMemberDto dto = null;	// 이 경우에 id pw 없을 경우 null된다
		MyMemberDto dto = new MyMemberDto(); // 이 경우엔 객체가 무조건 생기기 때문에(안에 아무것도 없어도) 무엇을 입력하든 무조건 로그인이 된다
		
		String sql = " SELECT * FROM MYMEMBER "
				+ " WHERE MYID=? AND MYPW=? "
				+ " AND MYENABLED =? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,myid);
			pstm.setString(2, mypw);
			pstm.setString(3, "Y");
		
		rs = pstm.executeQuery();
		while(rs.next()) {
			dto.setMyno(rs.getInt(1));
			dto.setMyid(rs.getString(2));
			dto.setMypw(rs.getString(3));
			dto.setMyname(rs.getString(4));
			dto.setMyaddr(rs.getString(5));
			dto.setMyphone(rs.getString(6));
			dto.setMyemail(rs.getString(7));
			dto.setMyenabled(rs.getString(8));
			dto.setMyrole(rs.getString(9));
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public MyMemberDto idChk(String myid) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MyMemberDto dto = null;
		
		String sql = " SELECT * FROM MYMEMBER WHERE MYID = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, myid);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				dto = new MyMemberDto(rs.getInt(1),rs.getString(2),rs.getString(3),
						rs.getString(4),rs.getString(5),rs.getString(6),
						rs.getString(7),rs.getString(8),rs.getString(9)); 
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
	public int insertUser(MyMemberDto dto) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO MYMEMBER VALUES(MYMEMBERSEQ.NEXTVAL, ?, ?, ?, ?, ? ,?,'Y','USER') ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMyid());
			pstm.setString(2, dto.getMypw());
			pstm.setString(3, dto.getMyname());
			pstm.setString(4, dto.getMyaddr());
			pstm.setString(5, dto.getMyphone());
			pstm.setString(6, dto.getMyemail());
		
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
	public MyMemberDto selectUser(int myno) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		MyMemberDto dto = null;
		String sql = " SELECT * FROM MYMEMBER "
				+ " WHERE MYNO =? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);

			rs = pstm.executeQuery();
			while(rs.next()) {
				dto = new MyMemberDto();
				dto.setMyno(rs.getInt(1));
				dto.setMyid(rs.getString(2));
				dto.setMypw(rs.getString(3));
				dto.setMyname(rs.getString(4));
				dto.setMyaddr(rs.getString(5));
				dto.setMyphone(rs.getString(6));
				dto.setMyemail(rs.getString(7));
				dto.setMyenabled(rs.getString(8));
				dto.setMyrole(rs.getString(9));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstm);
			close(con);
			
		}
		
		return dto;
	}

	@Override
	public int updateUser(MyMemberDto dto) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MYMEMBER SET MYPW=?, MYNAME =?, MYADDR =?, MYPHONE =?, MYEMAIL =? "
				+ " WHERE MYNO =? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMypw());
			pstm.setString(2, dto.getMyname());
			pstm.setString(3, dto.getMyaddr());
			pstm.setString(4, dto.getMyphone());
			pstm.setString(5, dto.getMyemail());		
			pstm.setInt(6, dto.getMyno());
			
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
	public int deleteUser(int myno) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MYMEMBER SET MYENABLED ='N' "
				+ " WHERE MYNO =? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, myno);
		
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

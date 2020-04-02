package com.dao;


import static db.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.Dto;

public class DaoImpl implements Dao{

	@Override
	public List<Dto> totalcnt() {   //
		//3.쿼리준비
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<Dto>list = new ArrayList();
		
		try {
			pstm = con.prepareStatement(" SELECT * FROM MVCBOARD ");
		
			//4.쿼리실행 및 리턴
			rs = pstm.executeQuery();  //부모인터페이스에서 쿼리문 상속
			
			while(rs.next()) {
				Dto dto = new Dto(rs.getInt(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getDate(5));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("[ERROR] : 3,4");
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);	
		}
		
		return list;
	}
	public List<Dto> selectPaging(int startseq, int endseq) {   //
		//3.쿼리준비
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<Dto>list = new ArrayList();
		
		try {
			pstm = con.prepareStatement(SELECT_LIST_SQL);
			pstm.setInt(1, startseq);
			pstm.setInt(2, endseq);
			//4.쿼리실행 및 리턴
			rs = pstm.executeQuery();  //부모인터페이스에서 쿼리문 상속
			
			while(rs.next()) {
				Dto dto = new Dto(rs.getInt(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getDate(5));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("[ERROR] : 3,4");
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);	
		}
		
		return list;
	}
}

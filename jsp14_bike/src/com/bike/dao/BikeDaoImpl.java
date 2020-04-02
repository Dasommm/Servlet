package com.bike.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.bike.db.JDBCTemplate;
import com.bike.dto.BikeDto;

public class BikeDaoImpl extends JDBCTemplate implements BikeDao {

	@Override
	public int insert(List<BikeDto> bikes) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		int[]cnt = null;
		//batch 사용해볼것. multidelete 참고...		
		try {
			pstm = con.prepareStatement(INSERT_SQL);
			for(int i = 0; i < bikes.size(); i++) {
				//BikeDto dto = list.get(i);로 선언하고 아래의 set/get할때, 	pstm.setString(1, dto.getAddrGu()); 이런식으로 써도 된다

				pstm.setString(1, bikes.get(i).getAddrGu());
				pstm.setInt(2, bikes.get(i).getContentId());
				pstm.setString(3,bikes.get(i).getContentNum());
				pstm.setString(4,bikes.get(i).getNewAddr());
				pstm.setInt(5, bikes.get(i).getCradleCount());
				pstm.setDouble(6,bikes.get(i).getLongitude());
				pstm.setDouble(7,bikes.get(i).getLatitude());
				
				pstm.addBatch();
			}
			System.out.println("prep query");
			cnt = pstm.executeBatch();
			System.out.println("run & return");
			
			for(int i = 0; i<cnt.length;i++) {
				if(cnt[i]==-2) {
					res++;
				}
			}
			
			if(res == bikes.size()) {
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
	
	public int delete() {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(DELETE_SQL);
			
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

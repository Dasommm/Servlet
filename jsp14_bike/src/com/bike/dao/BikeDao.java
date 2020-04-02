package com.bike.dao;

import java.util.List;

import com.bike.dto.BikeDto;

public interface BikeDao {

	
	String INSERT_SQL = 
			" INSERT INTO BIKE_TB VALUES(?, ?, ?, ?, ?, ?, ?) ";
	String DELETE_SQL = " DELETE FROM BIKE_TB ";
	
	public int insert(List<BikeDto> bikes);
	public int delete();
}

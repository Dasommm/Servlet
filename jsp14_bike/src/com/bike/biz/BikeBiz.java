package com.bike.biz;

import java.util.List;

import com.bike.dto.BikeDto;

public interface BikeBiz {

	public int insert(List<BikeDto> bikes);
	public int delete();
	
	
}

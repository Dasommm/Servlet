package com.bike.biz;

import java.util.List;

import com.bike.dao.BikeDao;
import com.bike.dao.BikeDaoImpl;
import com.bike.dto.BikeDto;

public class BikeBizImpl implements BikeBiz {

	BikeDao dao = new BikeDaoImpl();
	
	@Override
	public int insert(List<BikeDto> bikes) {
		// TODO Auto-generated method stub
		return dao.insert(bikes);
	}

	@Override
	public int delete() {
		// TODO Auto-generated method stub
		return dao.delete();
	}

}

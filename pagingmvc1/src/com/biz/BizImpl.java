package com.biz;

import java.util.List;

import com.dao.Dao;
import com.dao.DaoImpl;
import com.dto.Dto;


public class BizImpl implements Biz{

	private Dao dao = new DaoImpl();
	@Override
	public List<Dto> selectPaging(int startseq, int endseq) {
		
		return dao.selectPaging(startseq, endseq);
	}
	@Override
	public List<Dto> totalcnt() {
	
		return dao.totalcnt();
	}

}

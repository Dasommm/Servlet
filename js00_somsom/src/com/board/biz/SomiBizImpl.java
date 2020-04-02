package com.board.biz;

import java.util.List;

import com.board.dao.SomiDao;
import com.board.dao.SomiDaoImpl;
import com.board.dto.SomiDto;

public class SomiBizImpl implements SomiBiz {
	
	SomiDao dao = new SomiDaoImpl();

	@Override
	public List<SomiDto> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public SomiDto selectOne(int seq) {
		// TODO Auto-generated method stub
		return dao.selectOne(seq);
	}

	@Override
	public int insert(SomiDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(SomiDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int seq) {
		// TODO Auto-generated method stub
		return dao.delete(seq);
	}

}

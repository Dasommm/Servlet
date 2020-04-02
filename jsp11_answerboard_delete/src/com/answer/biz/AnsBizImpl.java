package com.answer.biz;

import java.util.List;

import com.answer.dao.AnsDao;
import com.answer.dao.AnsDaoImpl;
import com.answer.dto.AnsDto;

public class AnsBizImpl implements AnsBiz {

	AnsDao dao = new AnsDaoImpl();
	
	@Override
	public List<AnsDto> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public AnsDto selectOne(int bdno) {
		// TODO Auto-generated method stub
		return dao.selectOne(bdno);
	}

	@Override
	public int insert(AnsDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(AnsDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int bdno) {
		// TODO Auto-generated method stub
		return dao.delete(bdno);
	}

	@Override
	public int reInsert(AnsDto dto) {
		int rpupdate = dao.rpUpdate(dto.getBdno());
		int rpinsert = dao.reInsert(dto);
		
		return rpupdate+rpinsert;
	}

}

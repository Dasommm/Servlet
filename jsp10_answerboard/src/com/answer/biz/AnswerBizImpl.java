package com.answer.biz;

import java.util.List;

import com.answer.dao.AnswerDao;
import com.answer.dao.AnswerDaoImpl;
import com.answer.dto.answerDto;

public class AnswerBizImpl implements AnswerBiz {
	
	AnswerDao dao = new AnswerDaoImpl();

	@Override
	public List<answerDto> selectAll() {
		return dao.selectAll();
	}

	@Override
	public answerDto selectOne(int boardno) {
		// TODO Auto-generated method stub
		return dao.selectOne(boardno);
	}

	@Override
	public int insert(answerDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(answerDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int boardno) {
		// TODO Auto-generated method stub
		return dao.delete(boardno);
	}

	@Override
	public int replyInsert(answerDto dto) {
		int rpupdate = dao.replyInsertUpdate(dto.getBoardno());
		int rpinsert = dao.replyInsert(dto);
		
		return rpupdate+rpinsert;
	}

}

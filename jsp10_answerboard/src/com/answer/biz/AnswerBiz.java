package com.answer.biz;

import java.util.List;

import com.answer.dto.answerDto;

public interface AnswerBiz {

	public List<answerDto> selectAll();
	public answerDto selectOne(int boardno);
	public int insert(answerDto dto);
	public int update(answerDto dto);
	public int delete(int boardno);
	public int replyInsert(answerDto dto);

	
}

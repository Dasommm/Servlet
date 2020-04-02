package com.board.biz;

import java.util.List;

import com.board.dto.SomiDto;

public interface SomiBiz {
	
	public List<SomiDto> selectAll();
	public SomiDto selectOne(int seq);
	public int insert(SomiDto dto);
	public int update(SomiDto dto);
	public int delete(int seq);

}

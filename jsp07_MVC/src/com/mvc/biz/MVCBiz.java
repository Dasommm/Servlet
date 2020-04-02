package com.mvc.biz;

import java.util.List;

import com.mvc.dto.MVCDto;

public interface MVCBiz {

	public List<MVCDto> selectList();
	public MVCDto selectOne(int seq);
	public int insert(MVCDto dto);
	public int update(MVCDto dto);
	public int delete(int seq);
	
}

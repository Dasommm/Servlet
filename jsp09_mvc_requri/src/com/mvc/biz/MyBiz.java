package com.mvc.biz;

import java.util.List;

import com.mvc.dto.MyDto;

public interface MyBiz {

	public List<MyDto> selectList();
	public MyDto selectOne(int seq);
	public int insert(MyDto dto);
	public int update(MyDto dto);
	public int delete(int seq);
	
}

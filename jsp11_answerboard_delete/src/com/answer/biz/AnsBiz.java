package com.answer.biz;

import java.util.List;

import com.answer.dto.AnsDto;

public interface AnsBiz {
	
	public List<AnsDto> selectAll();
	public AnsDto selectOne(int bdno);
	public int insert(AnsDto dto);
	public int update(AnsDto dto);
	public int delete(int bdno);
	public int reInsert(AnsDto dto);

}

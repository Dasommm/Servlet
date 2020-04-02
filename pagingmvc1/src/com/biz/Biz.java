package com.biz;

import java.util.List;

import com.dto.Dto;

public interface Biz {

	public List<Dto> selectPaging(int startseq, int endseq);
	public List<Dto> totalcnt();
}

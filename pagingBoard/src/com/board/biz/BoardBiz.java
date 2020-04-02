package com.board.biz;

import java.util.List;

import com.board.dto.BoardDto;
import com.board.dto.PagingDto;

public interface BoardBiz {

	public List<BoardDto> selectAll(PagingDto dto);	//한페이지에 표시될 list 가져오기
	
	public int totalPage(int totalrows);	//현재 가지고 있는 총 게시글의 수
	
}

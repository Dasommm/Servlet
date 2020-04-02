package com.board.dao;

import java.util.List;

import com.board.dto.BoardDto;

public interface BoardDao {
		
	
	public List<BoardDto> selectAll(int to, int from);	//한페이지에 표시될 list 가져오기
	
	public int totalPage();	//현재 가지고 있는 총 게시글의 수
	
	
	
	
	

}

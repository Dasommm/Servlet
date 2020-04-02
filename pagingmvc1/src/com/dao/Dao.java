package com.dao;

import java.util.List;

import com.dto.Dto;

public interface Dao {

	String SELECT_LIST_SQL = " SELECT SEQ, WRITER, TITLE, CONTENT, REGDATE "
							+ " FROM (SELECT ROWNUM AS row_num, mvcboard.* FROM MVCBOARD) "
							+ " WHERE row_num >=? AND row_num <=? ";
	
	public List<Dto> selectPaging(int startseq, int endseq);
	public List<Dto> totalcnt();
}

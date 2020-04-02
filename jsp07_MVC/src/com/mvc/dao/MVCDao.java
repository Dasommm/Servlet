package com.mvc.dao;

import java.util.List;

import com.mvc.dto.MVCDto;

public interface MVCDao {

	String SELECT_LIST_SQL =" SELECT SEQ, WRITER, TITLE, CONTENT, REGDATE FROM MVCBOARD ORDER BY SEQ DESC ";
	String SELECT_ONE_SQL =" SELECT SEQ, WRITER, TITLE, CONTENT, REGDATE FROM MVCBOARD WHERE SEQ =? ";
	String INSERT_SQL = " INSERT INTO MVCBOARD VALUES(MVCSEQ.NEXTVAL, ?, ?, ?, SYSDATE) ";
	String UPDATE_SQL =" UPDATE MVCBOARD SET TITLE = ?, CONTENT =? WHERE SEQ=? ";
	String DELETE_SQL = " DELETE FROM MVCBOARD WHERE SEQ= ? ";
	
	public List<MVCDto> selectList();
	public MVCDto selectOne(int seq);
	public int insert(MVCDto dto);
	public int update(MVCDto dto);
	public int delete(int seq);
}

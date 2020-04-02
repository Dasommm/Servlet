package com.board.dao;

import java.util.List;

import com.board.dto.SomiDto;

public interface SomiDao {

	String SELECT_ALL_SQL = " SELECT SEQ, NAME, TITLE, CONTENT, REGDATE FROM SOMIBOARD ORDER BY SEQ DESC ";
	String SELECT_ONE_SQL = " SELECT SEQ, NAME, TITLE, CONTENT, REGDATE FROM SOMIBOARD WHERE SEQ=? ";
	String INSERT_SQL = " INSERT INTO SOMIBOARD VALUES(SOMSEQ.NEXTVAL, ?, ?, ?, SYSDATE) ";
	String UPDATE_SQL = " UPDATE SOMIBOARD SET TITLE =?, CONTENT =? WHERE SEQ =? ";
	String DELETE_SQL = " DELETE FROM SOMIBOARD WHERE SEQ =? ";
	
	public List<SomiDto> selectAll();
	public SomiDto selectOne(int seq);
	public int insert(SomiDto dto);
	public int update(SomiDto dto);
	public int delete(int seq);
	
}

package com.answer.dao;

import java.util.List;

import com.answer.dto.AnsDto;

public interface AnsDao {

	String SELECT_ALL_SQL = " SELECT BDNO, GNO, GSEQ, TTAB, TITLE, CONTENT, WRITER, REGDATE, ENBDELETE FROM ANSBOARD "
			+ " ORDER BY GNO DESC, GSEQ ";
	String SELECT_ONE_SQL = " SELECT BDNO, GNO, GSEQ, TTAB, TITLE, CONTENT, WRITER, REGDATE, ENBDELETE FROM ANSBOARD "
			+ " WHERE BDNO = ? ";
	String INSERT_SQL = " INSERT INTO ANSBOARD VALUES(BDNOSEQ.NEXTVAL, GNOSEQ.NEXTVAL, 1, 0, ?, ?, ?, SYSDATE,'N' ) ";
	String UPDATE_SQL = " UPDATE ANSBOARD SET TITLE = ?, CONTENT =? WHERE BDNO = ? ";
	String DELETE_SQL = " UPDATE ANSBOARD SET ENBDELETE = 'Y' WHERE BDNO =? ";
	String RP_UPDATE_SQL = " UPDATE ANSBOARD SET GSEQ = GSEQ+1"
			+ " WHERE GNO = (SELECT GNO FROM ANSBOARD WHERE BDNO = ?) "
			+ " AND GSEQ > (SELECT GSEQ FROM ANSBOARD WHERE BDNO = ?) ";
	String RP_INSERT_SQL = " INSERT INTO ANSBOARD VALUES(BDNOSEQ.NEXTVAL, "
			+ " (SELECT GNO FROM ANSBOARD WHERE BDNO = ?), "
			+ " (SELECT GSEQ FROM ANSBOARD WHERE BDNO =?)+1, "
			+ " (SELECT TTAB FROM ANSBOARD WHERE BDNO =?)+1, "
			+ " ?,?,?,SYSDATE,'N' ) ";

	public List<AnsDto> selectAll();
	public AnsDto selectOne(int bdno);
	public int insert(AnsDto dto);
	public int update(AnsDto dto);
	public int delete(int bdno);
	public int rpUpdate(int bdno);
	public int reInsert(AnsDto dto);
	
	
}

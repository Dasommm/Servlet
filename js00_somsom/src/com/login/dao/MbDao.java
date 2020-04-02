package com.login.dao;

import java.util.List;

import com.login.dto.MbDto;

public interface MbDao {
	
	//sql
	String SELECT_ALL_SQL =" SELECT * FROM SOMLOGIN ORDER BY SEQ DESC ";
	String LOGIN_SQL = " SELECT * FROM SOMLOGIN WHERE MBID =? AND MBPW =? ";
	String JOIN_SQL = " INSERT INTO SOMLOGIN VALUES (MBSEQ.NEXTVAL, ?,?,?,?,?,?,'Y','USER') ";
	
	//관리자(admin)기능
	//1.회원 전체정보 조회(탈퇴회원 포함)
	public List<MbDto> selectAll();
	
	//2.회원 전체정보 조회(가입된 회원들만)
	public List<MbDto> selectEnabled();
	
	//3.회원 등급 조정
	public int updaterole (int mbno,String mbrole);
	
	//사용자(user)기능
	//1. login
	public MbDto login(String mbid, String mbpw);
	
	//2. 회원가임
	//2-1.중복확인
	public MbDto idChk(String mbid);
	
	//2-2.회원가입
	public int join(MbDto dto);
	
	//3.내 정보 조회
	public MbDto inquire(String mbid);
	
	//4.내 정보 수정
	public int updateInfo(MbDto dto);
	
	//5.회원 탈퇴 : enabled -> n으로 
	public int deleteInfo(String mbid);

}

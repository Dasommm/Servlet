package com.login.dao;

import java.util.List;

import com.login.dto.MyMemberDto;

public interface MyMemberDao {

	//sql이랑 실행할 기능들 뼈대 만들기
	
	
	
	//관리자(admin) 기능
	//1.회원 전체 정보(탈퇴회원 포함)
	public List<MyMemberDto> selectList();
	
	//2.회원 전체 정보(가입된 회원들만) : myenabled=y
	public List<MyMemberDto> selectEnabled();
	
	//3.회원 등급 조정
	public int updateRole(int myno, String myrole);

	
	
	//사용자(user) 기능
	//1.login
	public MyMemberDto login(String myid, String mypw);
	
	//2.회원가입
	//2-1.중복확인
	public MyMemberDto idChk(String myid);
	
	//2-2.회원가입
	public int insertUser(MyMemberDto dto);
	
	//3. 내 정보 조회
	public MyMemberDto selectUser(int myno);
	
	//4.내 정보 수정
	public int updateUser(MyMemberDto dto);
	
	//5.회원탈퇴 : update myenabled = 'n'
	public int deleteUser(int myno);
	
	
}





















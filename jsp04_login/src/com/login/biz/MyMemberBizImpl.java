package com.login.biz;

import java.util.List;

import com.login.dao.MyMemberDao;
import com.login.dao.MyMemberDaoImpl;
import com.login.dto.MyMemberDto;

public class MyMemberBizImpl implements MyMemberBiz {

	
	private MyMemberDao dao = new MyMemberDaoImpl();
	
	
	@Override
	public List<MyMemberDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public List<MyMemberDto> selectEnabled() {
		// TODO Auto-generated method stub
		return dao.selectEnabled();
	}

	@Override
	public int updateRole(int myno, String myrole) {
		// TODO Auto-generated method stub
		return dao.updateRole(myno, myrole);
	}

	@Override
	public MyMemberDto login(String myid, String mypw) {
		// TODO Auto-generated method stub
		return dao.login(myid, mypw);
	}

	@Override
	public MyMemberDto idChk(String myid) {
		// TODO Auto-generated method stub
		return dao.idChk(myid);
	}

	@Override
	public int insertUser(MyMemberDto dto) {
		// TODO Auto-generated method stub
		return dao.insertUser(dto);
	}

	@Override
	public MyMemberDto selectUser(int myno) {
		// TODO Auto-generated method stub
		return dao.selectUser(myno);
	}

	@Override
	public int updateUser(MyMemberDto dto) {
		// TODO Auto-generated method stub
		return dao.updateUser(dto);
	}

	@Override
	public int deleteUser(int myno) {
		// TODO Auto-generated method stub
		return dao.deleteUser(myno);
	}

}

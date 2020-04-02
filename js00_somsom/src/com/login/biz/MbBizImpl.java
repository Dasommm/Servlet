package com.login.biz;

import java.util.List;

import com.login.dao.MbDao;
import com.login.dao.MbDaoImpl;
import com.login.db.JDBCTemplate;
import com.login.dto.MbDto;

public class MbBizImpl extends JDBCTemplate implements MbBiz {

	MbDao dao = new MbDaoImpl();
	@Override
	public List<MbDto> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public List<MbDto> selectEnabled() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updaterole(int mbno, String mbrole) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MbDto login(String mbid, String mbpw) {

		return dao.login(mbid, mbpw);
	}

	@Override
	public MbDto idChk(String mbid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int join(MbDto dto) {
		// TODO Auto-generated method stub
		return dao.join(dto);
	}

	@Override
	public MbDto inquire(String mbid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateInfo(MbDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteInfo(String mbid) {
		// TODO Auto-generated method stub
		return 0;
	}

}

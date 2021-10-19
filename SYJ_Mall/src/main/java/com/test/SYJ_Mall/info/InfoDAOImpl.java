package com.test.SYJ_Mall.info;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDAOImpl implements InfoDAO{
	@Autowired
	private SqlSession session;

	@Override
	public List<InfoDTO> InfoSelect() {
		// TODO Auto-generated method stub
		return session.selectList("info.InfoSelect");
	}

}

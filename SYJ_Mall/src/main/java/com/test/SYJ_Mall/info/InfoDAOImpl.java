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

	@Override
	public List<InfoDTO> InfoSelect_en() {
		// TODO Auto-generated method stub
		return session.selectList("info.InfoSelect_en");
	}

	@Override
	public List<InfoDTO> InfoSelect_jp() {
		// TODO Auto-generated method stub
		return session.selectList("info.InfoSelect_jp");
	}

	@Override
	public List<InfoDTO> InfoSelect_cn() {
		// TODO Auto-generated method stub
		return session.selectList("info.InfoSelect_cn");
	}

	@Override
	public List<InfoDTO> InfoSelect_cn2() {
		// TODO Auto-generated method stub
		return session.selectList("info.InfoSelect_cn2");
	}

}

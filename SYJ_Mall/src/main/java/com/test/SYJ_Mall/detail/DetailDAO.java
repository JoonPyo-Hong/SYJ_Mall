package com.test.SYJ_Mall.detail;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class DetailDAO implements IDetailDAO{

	@Autowired
	private SqlSession session;
	@Override
	public List<DetailDTO> lisDetailSelectt() {
		return session.selectList("detail.list");
	}

}

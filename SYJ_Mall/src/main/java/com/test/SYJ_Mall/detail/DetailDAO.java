package com.test.SYJ_Mall.detail;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class DetailDAO implements IDetailDAO{

	@Autowired
	private SqlSession session;
	@Override
	public List<DetailDTO> lisDetailSelectt(Integer d_seq) {
		return session.selectList("detail.list",d_seq);
	}
	@Override
	public List<String> HeaderSelect(Integer d_seq) {
		// TODO Auto-generated method stub
		return session.selectList("detail.header" , d_seq);
	}
	@Override
	public List<FeedDTO> FeedSelect(Integer d_seq) {
		// TODO Auto-generated method stub
		return session.selectList("detail.feed" , d_seq);
	}
	@Override
	public List<FeedDTO> FeedSelect2(Integer d_seq) {
		// TODO Auto-generated method stub
		return session.selectList("detail.feed2" , d_seq);
	}
	@Override
	public Integer heart_select(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		System.out.println(map.get("m_seq"));
		System.out.println(map.get("f_seq"));
		return session.selectOne("detail.heart_select", map);
	}

}

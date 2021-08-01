package com.test.SYJ_Mall.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDAO dao;

	@Override
	public List<MainDTO> list(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.list(map);
	}

	@Override
	public List<String> img(int seq) {
		// TODO Auto-generated method stub
		return dao.img(seq);
	}

	@Override
	public Integer heart(int num) {
		// TODO Auto-generated method stubs
		return dao.heart(num);
	}

	@Override
	public Integer heart_select(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.heart_select(map);
	}

	@Override
	public void heart_update(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		dao.heart_update(map);
	}

	@Override
	public void feed_insert(Map<String, Object> map) {
		dao.feed_insert(map);

	}

	@Override
	public List<FeedDTO> feed_select(Map<String, Object> map) {
		return dao.feed_select(map);
	}

	@Override
	public Integer feed_heart(int feed_seq) {
		// TODO Auto-generated method stub
		return dao.feed_heart(feed_seq);
	}

	@Override
	public void feed_heart_update(HashMap<String, String> map) {
		dao.feed_heart_update(map);
		
	}

	@Override
	public void re_feed_insert(Map<String, Object> map) {
		dao.re_feed_insert(map);
		
	}

}

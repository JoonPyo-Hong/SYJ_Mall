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

	@Override
	public Object re_feed_select(String feed_seq) {

		return dao.re_feed_select(feed_seq);

	}

	@Override
	public void re_feed_heart_update(HashMap<String, String> map) {
		dao.re_feed_heart_update(map);

	}

	@Override
	public Integer re_feed_heart(int feed_seq) {
		return dao.re_feed_heart(feed_seq);
	}

	@Override
	public HashMap<String, Object> main_feed(Integer seq) {
		// TODO Auto-generated method stub
		return dao.main_feed(seq);
	}

	@Override
	public Object main_feed_count(Integer seq) {

		return dao.main_feed_count(seq);

	}

	@Override
	public void feed_edit(Map<String, Object> map) {
		dao.feed_edit(map);
		
	}

	@Override
	public void feed_delete(Integer feed_seq) {
		dao.feed_delete(feed_seq);
		
	}

	@Override
	public void re_feed_delete(Integer seq) {
		dao.re_feed_delete(seq);
		
	}

	@Override
	public void re_feed_update(Map<String, Object> map) {
		dao.re_feed_update(map);
		
	}

	@Override
	public List<NewMainDTO> new_list(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.new_list(map);
	}

}

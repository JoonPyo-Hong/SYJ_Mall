package com.test.SYJ_Mall.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAOImpl implements MainDAO {
	@Autowired
	private SqlSession session;

	@Override
	public List<MainDTO> list(HashMap<String, Integer> map) {
		return session.selectList("main.list", map);
	}

	@Override
	public List<String> img(int seq) {

		return session.selectList("main.img", seq);
	}

	@Override
	public Integer heart(int num) {

		return session.selectOne("main.heart", num);
	}

	@Override
	public Integer heart_select(HashMap<String, Integer> map) {

		return session.selectOne("main.heart_select", map);
	}

	@Override
	public void heart_update(HashMap<String, String> map) {

		if (map.get("gubn").equals("I")) {

			session.insert("main.heart_insert", map);
		} else if (map.get("gubn").equals("D")) {
			session.delete("main.heart_delete", map);

		}

	}

	@Override
	public void feed_insert(Map<String, Object> map) {
		session.insert("main.feed_insert", map);

	}

	@Override
	public List<FeedDTO> feed_select(Map<String, Object> map) {
		return session.selectList("main.feed_select", map);
	}

	@Override
	public Integer feed_heart(int feed_seq) {
		// TODO Auto-generated method stub
		return session.selectOne("main.feed_heart", feed_seq);
	}

	@Override
	public void feed_heart_update(HashMap<String, String> map) {
		if (map.get("gubn").equals("I")) {

			session.insert("feed_heart_insert", map);
		} else if (map.get("gubn").equals("D")) {
			session.delete("feed_heart_delete", map);

		}

	}

	@Override
	public void re_feed_insert(Map<String, Object> map) {
		session.insert("main.re_feed_insert", map);

	}

	@Override
	public Object re_feed_select(String feed_seq) {
		return session.selectList("main.re_feed_select", feed_seq);

	}

	@Override
	public void re_feed_heart_update(HashMap<String, String> map) {
		if (map.get("gubn").equals("I")) {

			session.insert("re_feed_heart_insert", map);
		} else if (map.get("gubn").equals("D")) {
			session.delete("re_feed_heart_delete", map);

		}
	}

	@Override
	public Integer re_feed_heart(int feed_seq) {
		// TODO Auto-generated method stub
		return session.selectOne("main.re_feed_heart", feed_seq);
	}

	@Override
	public HashMap<String, Object> main_feed(Integer seq) {
		// TODO Auto-generated method stub

		return session.selectOne("main.main_feed", seq);

	}

	@Override
	public Object main_feed_count(Integer seq) {

		return session.selectOne("main.main_feed_count", seq);
	}

	@Override
	public void feed_edit(Map<String, Object> map) {

		session.update("main.feed_edit", map);
	}

	@Override
	public void feed_delete(Integer feed_seq) {

		session.delete("main.feed_delete", feed_seq);

	}

	@Override
	public void re_feed_delete(Integer seq) {
		session.delete("main.re_feed_delete", seq);

	}

	@Override
	public void re_feed_update(Map<String, Object> map) {
		session.update("main.re_feed_update", map);

	}

	@Override
	public List<NewMainDTO> new_list(HashMap<String, Integer> map) {
		return session.selectList("main.new_list", map);
	}

	@Override
	public List<String> new_main_img(int seq) {
		// TODO Auto-generated method stub
		return session.selectList("main.new_main_img", seq);
	}

	@Override
	public List<Integer> new_main_sub(int seq) {
		// TODO Auto-generated method stub
		return session.selectList("main.new_main_sub", seq);
	}

	@Override
	public List<SubDTO> new_main_sub_img(int seq) {
		// TODO Auto-generated method stub
		return session.selectList("main.new_main_sub_img", seq);
	}

	@Override
	public List<Integer> new_main_list(int seq) {
		// TODO Auto-generated method stub
		return null; 
	}

	@Override
	public List<String> char_img(String name) {
		// TODO Auto-generated method stub
		return session.selectList("main.char_img", name);
	}

	@Override
	public Integer new_heart_select(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return session.selectOne("main.new_heart_select", map);
	}

	@Override
	public void new_heart_update(HashMap<String, String> map) {
		if (map.get("gubn").equals("I")) {

			session.insert("main.new_heart_insert", map);
		} else if (map.get("gubn").equals("D")) {
			session.delete("main.new_heart_delete", map);

		}

	}

	@Override
	public Integer heart_count(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("main.heart_count", num);
	}
}

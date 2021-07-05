package com.test.SYJ_Mall.main;

import java.util.HashMap;
import java.util.List;

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
		// TODO Auto-generated method stub
		return session.selectOne("main.heart", num);
	}

	@Override
	public Integer heart_select(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return session.selectOne("main.heart_select", map);
	}

	@Override
	public void heart_update(HashMap<String, String> map) {
		// TODO Auto-generated method stub
//		System.out.println("dao =" + map.get("gubn"));
		if (map.get("gubn").equals("I")) {
//			System.out.println("insert");
			session.insert("main.heart_insert", map);
		} else if (map.get("gubn").equals("D")) {
			session.delete("main.heart_delete", map);
//			System.out.println("delete");
		}

	}

}

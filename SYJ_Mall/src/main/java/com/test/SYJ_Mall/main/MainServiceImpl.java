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
	public List<MainDTO> list(int num) {
		// TODO Auto-generated method stub
		return dao.list(num);
	}

	@Override
	public List<String> img(int seq) {
		// TODO Auto-generated method stub
		return dao.img(seq);
	}

	@Override
	public Integer heart(int num) {
		// TODO Auto-generated method stub
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
}

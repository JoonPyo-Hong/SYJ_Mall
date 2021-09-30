package com.test.SYJ_Mall.pay;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayMentServiceImpl implements PayMentService{
	@Autowired
	private PayMentDAO dao;

	@Override
	public List<ProductDTO> PaySelect(String str1) {
		// TODO Auto-generated method stub
		return dao.PaySelect(str1);
	}

	@Override
	public int last_seq() {
		// TODO Auto-generated method stub
		return dao.last_seq();
	}

	@Override
	public void order(Map<String, Object> map) {
		dao.order(map);
		
	}

	@Override
	public void shpping(Map<String, Object> map) {
		dao.shpping(map);
		
	}
}

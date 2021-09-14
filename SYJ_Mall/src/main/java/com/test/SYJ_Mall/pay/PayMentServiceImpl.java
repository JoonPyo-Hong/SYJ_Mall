package com.test.SYJ_Mall.pay;

import java.util.List;

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
}

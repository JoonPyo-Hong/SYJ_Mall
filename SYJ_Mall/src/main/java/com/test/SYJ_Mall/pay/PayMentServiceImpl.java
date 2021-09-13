package com.test.SYJ_Mall.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayMentServiceImpl implements PayMentService{
	@Autowired
	private PayMentDAO dao;
}

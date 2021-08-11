package com.test.SYJ_Mall.testlayout;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService implements ITestService{
	
	@Autowired
	private ITestDAO dao;
	
}

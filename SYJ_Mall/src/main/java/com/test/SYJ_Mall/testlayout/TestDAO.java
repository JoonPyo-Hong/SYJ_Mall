package com.test.SYJ_Mall.testlayout;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO implements ITestDAO {
	
	@Autowired
	private SqlSessionTemplate template;
}

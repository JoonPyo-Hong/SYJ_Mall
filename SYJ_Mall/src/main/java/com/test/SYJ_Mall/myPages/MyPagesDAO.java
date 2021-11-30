package com.test.SYJ_Mall.myPages;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPagesDAO implements IMyPagesDAO{
	@Autowired
	private SqlSessionTemplate template;
	
}

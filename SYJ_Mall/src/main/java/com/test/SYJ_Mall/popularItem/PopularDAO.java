package com.test.SYJ_Mall.popularItem;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PopularDAO implements IPoupularDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	
}

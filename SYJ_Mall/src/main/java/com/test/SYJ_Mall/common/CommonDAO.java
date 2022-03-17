package com.test.SYJ_Mall.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 공통 기능 dao
 * @author shin
 *
 */
@Repository
public class CommonDAO implements ICommonDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	
}

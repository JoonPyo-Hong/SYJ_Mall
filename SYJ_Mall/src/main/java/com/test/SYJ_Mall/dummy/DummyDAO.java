package com.test.SYJ_Mall.dummy;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * DummyDAO 객체
 * @author shin
 *
 */
@Repository
public class DummyDAO implements IDummyDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
}

package com.test.SYJ_Mall.elasticsearch;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * elasticsearch dao
 * 
 * @author shin
 *
 */
@Repository
public class ElasticDAO implements IElasticDAO {

	@Autowired
	private SqlSessionTemplate template;
	
}

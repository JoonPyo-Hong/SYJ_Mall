package com.test.SYJ_Mall.newGoods;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * NewGoodDAO 객체
 * @author shin
 *
 */
@Repository
public class NewGoodDAO implements INewGoodDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
}

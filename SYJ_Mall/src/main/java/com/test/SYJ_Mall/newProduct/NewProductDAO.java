package com.test.SYJ_Mall.newProduct;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NewProductDAO implements INewProductDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	
}

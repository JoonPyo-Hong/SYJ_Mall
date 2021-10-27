package com.test.SYJ_Mall.charProdt;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CharProdtDAO implements ICharProdtDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	
}

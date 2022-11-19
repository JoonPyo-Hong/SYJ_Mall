package com.test.SYJ_Mall.kafka;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KafkaDAO implements IKafkaDAO {
	@Autowired
	private SqlSessionTemplate template;
	
}

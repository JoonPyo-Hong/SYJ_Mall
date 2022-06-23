package com.test.SYJ_Mall.crawling;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CrawlerDAO implements ICrawlerDAO {
	@Autowired
	private SqlSessionTemplate template;
}

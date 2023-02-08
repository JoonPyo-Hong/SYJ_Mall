package com.test.SYJ_Mall.kafkaoLogin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KakaoLoginDAO implements IKakaoLoginDAO {
	@Autowired
	private SqlSessionTemplate template;
}

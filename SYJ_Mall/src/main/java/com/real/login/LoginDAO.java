package com.real.login;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	
	
	@Autowired
	private SqlSessionTemplate template;
	
	//로그인 결과
	public int loginResult(String userIp,String id,String encpw) {
			
		Map<String, String> loginCheckMap = new HashMap<String, String>();
			
		//loginCheckMap.put("userIp", userIp);
		//loginCheckMap.put("id", id);
		//loginCheckMap.put("encpw", encpw);
			
		//int result = template.selectOne("tuning.loginVerification",loginCheckMap);
			
		return 1;
	}
	
	
}

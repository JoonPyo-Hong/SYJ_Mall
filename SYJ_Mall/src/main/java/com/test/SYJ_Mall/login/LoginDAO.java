package com.test.SYJ_Mall.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.utill.AdverDTO;

@Repository
public class LoginDAO implements ILoginDAO {
	
	
	@Autowired
	private SqlSessionTemplate template;
	
	//로그인 결과
	public List<LoginDTO> loginResult(String userIp,String id,String encpw) {
			
		Map<String, String> loginCheckMap = new HashMap<String, String>();
			
		loginCheckMap.put("userIp", userIp);
		loginCheckMap.put("id", id);
		loginCheckMap.put("encpw", encpw);
			
		List<LoginDTO> resultList = new ArrayList<LoginDTO>();
		resultList = template.selectList("SYJDB.loginVerification", loginCheckMap);
		
		
		return resultList;
	}
	
	
	//광고 넣기
	public List<AdverDTO> getAdvertiseInfo() {
		
		List<AdverDTO> dtoList = new ArrayList<AdverDTO>();//광고로 지정되어 있는 모든 리스트를 가져와주는 작업을 수행한다
		
		dtoList = template.selectList("SYJDB.advertiseShow");
		
		return dtoList;
	}

	
	//해당번호 유저 정보 가져오기
	public List<UserDTO> userInfo(int userSeq) {
		
		List<UserDTO> dtoList = new ArrayList<UserDTO>();
		
		dtoList = template.selectList("SYJDB.userInfoDetail",userSeq);
		
		return dtoList;
	}
	
	
}


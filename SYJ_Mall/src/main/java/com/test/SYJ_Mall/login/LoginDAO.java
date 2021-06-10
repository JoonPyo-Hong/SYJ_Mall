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

	
	//자동로그인 방지 인증 후 고객의 로그인정보 저장
	@Override
	public void autoLoginPassTrace(int userSeq,String ipaddress) {
		

		Map<String,String> userMap = new HashMap<String, String>();
		userMap.put("userSeq", ""+userSeq);
		userMap.put("ipaddress", ipaddress);
		
		template.update("SYJDB.autoAfterTrace",userMap);
		
	}

	
	//회원이 기입한 정보를 토대로 insert 작업 진행
	@Override
	public int signUp(SignUpDTO dto) {
		
		template.selectOne("SYJDB.qooSignUpsp", dto);
		
		return 0;
	}
	
	
}


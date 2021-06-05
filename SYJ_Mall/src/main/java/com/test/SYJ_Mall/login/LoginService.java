package com.test.SYJ_Mall.login;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.AdverDTO;
import com.common.utill.Encryption;
import com.common.utill.IpCheck;

@Service
public class LoginService implements ILoginService {
	
	@Autowired
	private LoginDAO dao;

	@Override
	public String ipCheck(HttpServletRequest request) {//접속자의 아이피를 체크함
		
		IpCheck ip = new IpCheck();
		
		return ip.getClientIP(request);
	}
	
	@Override
	public String pwEnc(String password) {//접속자의 비밀번호를 변환
		
		Encryption enc = new Encryption();
		
		return enc.returnEncVoca(password);
	}
	
	@Override
	public HashMap<String,String> adverShow() {//db 로부터 광고 데이터를 가져와서 어떤식으로 뿌릴지 로직을 짜주면된다.
		
		
		Random rnd = new Random();
		List<AdverDTO> dtoList = dao.getAdvertiseInfo();
		
		//금액에 맞춰서 내보내야 하지만 -> 이건 후에 지금은 "랜덤"으로 처리해준다.
		AdverDTO dto = dtoList.get(rnd.nextInt(dtoList.size()));
		String picName = dto.getAdpPcUrl();
		String url = dto.getAdUrl();
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("picName", picName);
		map.put("url", url);
		
		return map;
	}
	
	@Override
	public int loginResult(String userIp,String id, String pw) {//로그인 결과
		// TODO Auto-generated method stub
		return dao.loginResult(userIp,id, pw);
	}
	
	
	
	

}


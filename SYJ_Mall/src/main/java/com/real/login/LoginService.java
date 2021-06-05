package com.real.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.IpCheck;

@Service
public class LoginService implements ILoginService{
	
	@Autowired
	private LoginDAO dao;

	@Override
	public String ipCheck(HttpServletRequest request) {//접속자의 아이피를 체크함
		
		IpCheck ip = new IpCheck();
		
		return ip.getClientIP(request);
	}
	

	

}

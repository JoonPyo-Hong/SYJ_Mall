package com.real.login;

import javax.servlet.http.HttpServletRequest;

public interface ILoginService {
	
	public String ipCheck(HttpServletRequest request);//접속자의 아이피를 체크함.
	
}

package com.test.SYJ_Mall.kafkaoLogin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.IpCheck;
import com.common.utill.KakaoCookies;
import com.common.utill.KakaoError;

public interface IKakaoLoginService {
	
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param kc
	 * @param ic
	 * @param ea
	 * @return
	 */
	String getUserLoginCookieInfo(HttpServletRequest request, HttpServletResponse response, KakaoCookies kc, IpCheck ic) throws Exception;

}

package com.test.SYJ_Mall.kakaoLogin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.IpCheck;
import com.common.utill.KakaoCookies;
import com.common.utill.KakaoError;

public interface IKakaoLoginService {
	
	
	/**
	 * Inquiry of cookie information related to login maintenance
	 * 
	 * @param request
	 * @param response
	 * @param kc
	 * @param ic
	 * @param ea
	 * @return
	 */
	String getUserLoginCookieInfo(HttpServletRequest request, HttpServletResponse response, KakaoCookies kc, IpCheck ic) throws Exception;
	
	
	/**
	 * Blocks attempts to return to the login window in an unusual way.
	 * 
	 * @param request
	 * @param ic
	 * @param kc
	 * @return
	 */
	String againLoginCheck(HttpServletRequest request, IpCheck ic, KakaoCookies kc);

	
	/**
	 * Apply encryption algorithm to prevent login packet hijacking.
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	String setUserRsaInfo(HttpServletRequest request);

	
	/**
	 * Check if the capcha value for automatic login prevention is a valid value.
	 * 
	 * @param request
	 * @return
	 */
	int kakaoCapchaCheck(HttpServletRequest request);

	
	/**
	 * Login information primary verification process
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	int loginPreCheck(HttpServletRequest request, HttpServletResponse response);

}

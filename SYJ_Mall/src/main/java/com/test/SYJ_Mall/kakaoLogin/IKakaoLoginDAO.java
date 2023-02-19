package com.test.SYJ_Mall.kakaoLogin;

import javax.servlet.http.HttpServletRequest;

public interface IKakaoLoginDAO {
	

	/**
	 * Get capture secure key information
	 * 
	 * @param request
	 * @return
	 */
	String getCapchaSecureKey(HttpServletRequest request);

}

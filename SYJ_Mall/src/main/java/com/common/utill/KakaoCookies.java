package com.common.utill;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

/**
 * Class for handling kakao cookies more rationally
 * @author shin
 *
 */
public class KakaoCookies {
	
	
	/**
	 * Create Web Cookies
	 * @param response
	 * @param cookieName
	 * @param setTimeSecond
	 * @param cookieValue
	 */
	public void generateCookie(HttpServletResponse response,String cookieName,int setTimeSecond, JSONObject cookieValue) {
		
		Cookie cookie = new Cookie(cookieName,cookieValue.toJSONString());
		cookie.setMaxAge(-1);				// Cookies expire when the browser is closed.
		cookie.setMaxAge(setTimeSecond);	// Specifies the duration of the cookie.
		cookie.setPath("/");				// Set the cookie to be accessible from all paths.
		response.addCookie(cookie);
		
	}
	
}

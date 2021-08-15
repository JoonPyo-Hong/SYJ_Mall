package com.common.utill;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 쿠키객체 쉽게다루기 위한 클래스
 * @author shin
 *
 */
public class KakaoCookie {
	
	
	public void generateCookie(HttpServletResponse response,String cookieName,String cookieValue) {
		
		Cookie cookie = new Cookie(cookieName,cookieValue);
		cookie.setMaxAge(-1);//브라우저가 종료되면 쿠키를 만료시킨다.
		cookie.setPath("/");//모든 경로에서 해당 쿠키를 접근가능하도록 설정해준다.
		response.addCookie(cookie);
		
	}
	
	public void generateCookie(HttpServletResponse response,String cookieName,String cookieValue,int setTimeSecond) {
		
		Cookie cookie = new Cookie(cookieName,cookieValue);
		cookie.setMaxAge(setTimeSecond);//브라우저가 종료되면 쿠키를 만료시킨다.
		cookie.setPath("/");//모든 경로에서 해당 쿠키를 접근가능하도록 설정해준다.
		response.addCookie(cookie);
		
	}
	
	public Object getCookieInfo(HttpServletRequest request,String cookieName) {
		
		Object object = null;
		
		Cookie[] cookies = request.getCookies();
		
		for (int i = 0; i < cookies.length; i++) {
			if (cookies != null) {
				if (cookies[i].getName().equals(cookieName)) {
					object = cookies[i].getValue();
					break;
				}
			} 
		}
		
		return object;
	}

	public void deleteCookie(HttpServletRequest request,HttpServletResponse response,String cookieName) {
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			
			for (int i = 0; i < cookies.length; i++) {
				
				if (cookies[i].getName().equals(cookieName)) {
					cookies[i].setValue(null);
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
					break;
				}
			}
		}
	}
}

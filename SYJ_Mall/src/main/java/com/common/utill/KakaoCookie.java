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
	
	/**
	 * 쿠키생성
	 * @param response
	 * @param cookieName	쿠키이름
	 * @param cookieValue	쿠키값
	 */
	public void generateCookie(HttpServletResponse response,String cookieName,String cookieValue) {
		
		Cookie cookie = new Cookie(cookieName,cookieValue);
		cookie.setMaxAge(-1);//브라우저가 종료되면 쿠키를 만료시킨다.
		cookie.setPath("/");//모든 경로에서 해당 쿠키를 접근가능하도록 설정해준다.
		response.addCookie(cookie);
		
	}
	
	/**
	 * 쿠키생성 + 유지시간 설정
	 * @param response
	 * @param cookieName		쿠키이름
	 * @param cookieValue		쿠키값
	 * @param setTimeSecond		쿠키유지시간(초단위)
	 */
	public void generateCookie(HttpServletResponse response,String cookieName,String cookieValue,int setTimeSecond) {
		
		Cookie cookie = new Cookie(cookieName,cookieValue);
		cookie.setMaxAge(setTimeSecond);//지속시간을 정해준다.
		cookie.setPath("/");//모든 경로에서 해당 쿠키를 접근가능하도록 설정해준다.
		response.addCookie(cookie);
		
	}
	
	/**
	 * 쿠키정보 가져오기
	 * @param request		쿠키이름에 해당하는 값 가져오기
	 * @param cookieName	쿠키이름
	 * @return				쿠키이름에 대응하는 쿠키값
	 */
	public Object getCookieInfo(HttpServletRequest request,String cookieName) {
		
		Object object = null;
		
		try {
			Cookie[] cookies = request.getCookies();
			
			for (int i = 0; i < cookies.length; i++) {
				if (cookies != null) {
					if (cookies[i].getName().equals(cookieName)) {
						object = cookies[i].getValue();
						break;
					}
				} 
			}
		} catch(Exception e) {
			//e.printStackTrace();
			return object;
		}

		return object;
	}
	
	/**					
	 * 쿠키이름에 대한 쿠키값 수정
	 * @param request
	 * @param response
	 * @param cookieName	쿠키이름
	 * @param setCookieVal	쿠키값
	 */
	public void modifyCookie(HttpServletRequest request,HttpServletResponse response,String cookieName,String setCookieVal,int setTime) {
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
		//쿠키 객체가 존재는 하는경우
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals(cookieName)) {
					cookies[i].setValue(setCookieVal);
					cookies[i].setMaxAge(setTime);
					cookies[i].setPath("/");
					response.addCookie(cookies[i]);
					break;
				}
			}
			//쿠키 객체는 존재하지만 해당이름을 가진 쿠키객체가 존재하지 않는 경우
			generateCookie(response, cookieName, setCookieVal, setTime);

		} else {
		//쿠키 객체 자체가 존재하지 않는 경우	
			generateCookie(response, cookieName, setCookieVal, setTime);
		}
	}


	/**
	 * 쿠키이름에 해당하는 쿠키 삭제
	 * @param request
	 * @param response
	 * @param cookieName	쿠키이름
	 */
	public void deleteCookie(HttpServletRequest request,HttpServletResponse response,String cookieName) {
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			
			for (int i = 0; i < cookies.length; i++) {
				
				if (cookies[i].getName().equals(cookieName)) {
					cookies[i].setValue(null);
					cookies[i].setMaxAge(0);
					cookies[i].setPath("/");
					response.addCookie(cookies[i]);
					break;
				}
			}
		}
	}
	
//	public void modifySettingCookie(HttpServletRequest request,HttpServletResponse response,String cookieName,
//							  String token,int maxLength, String cookieValue, ) 
//	{
//		
//	}
//	
	
}

package com.common.utill;

import javax.servlet.http.HttpServletRequest;
/**
 * 아이피를 체크해주는 클래스
 * @author shin
 *
 */
public class IpCheck {
	 
	/**
	 * 접속자의 아이피를 기록
	 * @param request	request 객체
	 * @return			아이피 주소
	 */
	 public String getClientIP (HttpServletRequest request) {
		 
	     String ip = request.getHeader("X-FORWARDED-FOR"); 
	     
	     if (ip == null || ip.length() == 0) {
	         ip = request.getHeader("Proxy-Client-IP");
	     }

	     if (ip == null || ip.length() == 0) {
	         ip = request.getHeader("WL-Proxy-Client-IP");// 웹로직
	     }

	     if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	         ip = request.getHeader("HTTP_CLIENT_IP");
	     }
	     
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	         ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	     }
	     
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	         ip = request.getRemoteAddr();
	     }
	    
	    
	    return ip;

	 }
}

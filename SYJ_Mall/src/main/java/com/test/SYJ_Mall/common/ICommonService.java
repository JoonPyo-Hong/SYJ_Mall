package com.test.SYJ_Mall.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.ErrorAlarm;

/**
 * 공통기능 서비스 인터페이스
 * @author shin
 *
 */
public interface ICommonService {
	
	/**
	 * 고객이 로그인 해줬는지 아닌지 확인해주는 메서드
	 * @param request
	 * @param response
	 * @param ea
	 * @return
	 */
	int getUserLoginChecking(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea);

}

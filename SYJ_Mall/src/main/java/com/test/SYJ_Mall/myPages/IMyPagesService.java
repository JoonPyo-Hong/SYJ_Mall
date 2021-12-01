package com.test.SYJ_Mall.myPages;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IMyPagesService {
	
	/**
	 * 마이페이지 진입 페이지
	 * @param request
	 * @param response
	 * @return
	 */
	int getMyPageSelect(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 마이페이지 - 최근 본 페이지
	 * @param request
	 * @param response
	 * @return
	 */
	int getMyPageSeen(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 쿠키에 존재하는 나의 상품 클릭내역 가져오기
	 * @param request
	 * @param response
	 * @return
	 */
	String getCookieSeen(HttpServletRequest request, HttpServletResponse response);
}

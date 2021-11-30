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

}

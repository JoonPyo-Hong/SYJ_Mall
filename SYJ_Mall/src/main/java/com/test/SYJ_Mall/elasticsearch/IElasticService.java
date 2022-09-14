package com.test.SYJ_Mall.elasticsearch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.ElasticSearchConn;
import com.common.utill.ErrorAlarm;

public interface IElasticService {
	
	/**
	 * elasticsearch connect
	 * @param request
	 * @param response
	 * @param ea
	 * @param ec
	 * @return
	 */
	int getConnectElastic(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, ElasticSearchConn ec);

}

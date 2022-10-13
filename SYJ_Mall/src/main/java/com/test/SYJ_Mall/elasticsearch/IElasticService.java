package com.test.SYJ_Mall.elasticsearch;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.CommonDate;
import com.common.utill.ElasticSearchConn;
import com.common.utill.ErrorAlarm;

public interface IElasticService {
	
	/**
	 * elasticsearch connect
	 * @param request
	 * @param response
	 * @param ea
	 * @param ec
	 * @param cd
	 * @return
	 */
	int getConnectElastic(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd);
	
	/**
	 * elasticsearch tests
	 * @param request
	 * @param response
	 * @param ea
	 * @param ec
	 * @param cd
	 * @return
	 */
	int getConnectElasticTestt(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,ElasticSearchConn ec, CommonDate cd);
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param ea
	 * @param ec
	 * @param cd
	 * @return
	 */
	int getConnectElasticCreate(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,ElasticSearchConn ec, CommonDate cd);
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @param ea
	 * @param ec
	 * @param cd
	 * @return
	 */
	int getConnectElasticPost(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,ElasticSearchConn ec, CommonDate cd);

}

package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.CommonDate;
import com.common.utill.ElasticSearchConn;
import com.common.utill.ErrorAlarm;
import com.test.SYJ_Mall.elasticsearch.IElasticService;

/**
 * elasticsearch 컨트롤러
 * 
 * @author shin
 *
 */
@Controller
public class ElasticsearchController {
	
	@Autowired
	private IElasticService service;
	
	@RequestMapping(value = "/elasticsearch.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String elasticMain(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd) {
			
		int result = service.getConnectElastic(request,response,ea,ec,cd);
		
		System.out.println(result);
		
		return "";
	}
	
	
	@RequestMapping(value = "/elasticsearchTest.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String elasticMainTest(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd) {
			
		int result = service.getConnectElasticTestt(request,response,ea,ec,cd);
		
		System.out.println(result);
		
		return "";
	}
	
	
	@RequestMapping(value = "/elasticsearchCreate.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String elasticCreate(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd) {
			
		int result = service.getConnectElasticCreate(request,response,ea,ec,cd);
		
		System.out.println(result);
		
		return "";
	}
	
	@RequestMapping(value = "/elasticsearchPost.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String elasticPost(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd) {
			
		int result = service.getConnectElasticPost(request,response,ea,ec,cd);
		
		System.out.println(result);
		
		return "";
	}
	
}

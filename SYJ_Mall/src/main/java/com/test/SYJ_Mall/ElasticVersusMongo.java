package com.test.SYJ_Mall;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.elasticsearchDw.IElasticDwService;
import com.test.SYJ_Mall.sqlServerJpa.ISqlServerService;


@Controller
public class ElasticVersusMongo {
	
	
	@Autowired 
	private IElasticDwService elasticService;
	
	@Autowired 
	private ISqlServerService sqlService;
	
	
	@RequestMapping(value = "/searchTestEsSql.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String searchTestEsSql(HttpServletRequest request, HttpServletResponse response) {
		
		return "/test/searchtest";
	}
	
	
	
	@RequestMapping(value = "/sqlServerTime.action", method = { RequestMethod.GET , RequestMethod.POST})
	@ResponseBody
	public List<String> sqlServerTime(HttpServletRequest request, HttpServletResponse response) {
		
		String keyword = request.getParameter("search_keyword");
		
		System.out.println(keyword);
		
		long startTime = System.currentTimeMillis();
		
		long endTime = System.currentTimeMillis();
		
		long timeElapsed = endTime - startTime;
		
		System.out.println("Time elapsed: " + timeElapsed + " milliseconds");
		
		List<String> arrList = new ArrayList<>();
		
		arrList.add("test1");
		arrList.add("test2");
		
		return arrList;
	}	
	
	
	@RequestMapping(value = "/elasticTime.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String elasticTime(HttpServletRequest request, HttpServletResponse response) {
		
		long startTime = System.currentTimeMillis();
		
		long endTime = System.currentTimeMillis();
		
		long timeElapsed = endTime - startTime;
		
		System.out.println("Time elapsed: " + timeElapsed + " milliseconds");
		
		return "";
	}
	
	
}

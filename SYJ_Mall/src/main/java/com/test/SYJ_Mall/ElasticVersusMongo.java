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
import com.test.SYJ_Mall.mongodb.MongoDwDTO;
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
	public List<MongoDwDTO> sqlServerTime(HttpServletRequest request, HttpServletResponse response) {
		
		String keyword = request.getParameter("search_keyword");
		
		long startTime = System.currentTimeMillis();
		
		List<MongoDwDTO> searchResult = sqlService.getSearchData(keyword);
		
		//for (MongoDwDTO mdto : searchResult) System.out.println(mdto.getDispNm());
		
		long endTime = System.currentTimeMillis();
		
		long timeElapsed = endTime - startTime;
		
		System.out.println("Time elapsed: " + timeElapsed + " milliseconds");
		
		
		return searchResult;
	}	
	
	
	@RequestMapping(value = "/elasticTime.action", method = { RequestMethod.GET , RequestMethod.POST})
	@ResponseBody
	public List<String> elasticTime(HttpServletRequest request, HttpServletResponse response) {
		
		String keyword = request.getParameter("search_keyword");
		
		long startTime = System.currentTimeMillis();
		
		List<String> searchResult = elasticService.getSearchData(keyword);
		
		long endTime = System.currentTimeMillis();
		
		long timeElapsed = endTime - startTime;
		
		System.out.println("Time elapsed: " + timeElapsed + " milliseconds");
		
		return searchResult;
	}
	
	
}

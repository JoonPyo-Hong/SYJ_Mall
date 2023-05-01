package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.elasticsearchDw.IElasticDwService;

@Controller
public class ElasticDwController {
	
	@Autowired 
	private IElasticDwService service;
	
	@RequestMapping(value = "/elasticDwStart.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String elasticDwStart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//service.test();
		service.putIndex();
		
		return "";
	}
}

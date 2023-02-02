package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.ErrorAlarm;
import com.test.SYJ_Mall.testlayout.ITestService;

@Controller
public class TestController {
	
	@Autowired
	private ITestService service;
	
	@RequestMapping(value = "/testlay.action", method = { RequestMethod.GET,RequestMethod.POST })
	public String login(HttpServletRequest request, HttpServletResponse response, String site, ErrorAlarm ea) {
		
		try {
			
			int[] numbers = {1, 2, 3};
		     System.out.println(numbers[3]);
			
			
			return "/test/testshin";//에러페이지로 보내준다.
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return "/test/testshin";//에러페이지로 보내준다.
		}
		
		
		
		
	}
	
	
	@RequestMapping(value = "/testError.action", method = { RequestMethod.GET,RequestMethod.POST })
	public String testError(HttpServletRequest request, HttpServletResponse response, String site, ErrorAlarm ea) {
		
		try {
			
			int[] numbers = {1, 2, 3};
		     System.out.println(numbers[3]);
			
			
			return "/test/testshin";//에러페이지로 보내준다.
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return "/test/testshin";//에러페이지로 보내준다.
		}
		
		
		
		
	}
}

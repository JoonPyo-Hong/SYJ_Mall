package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SocketsController {
	
	@RequestMapping(value = "/sstest.action", method = { RequestMethod.GET })
	public String sstest(HttpServletRequest request, HttpServletResponse response) {
		return "/test/sockettest";
	}
}

package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.newGoods.INewGoodService;

@Controller
public class CapcharController {

	@Autowired
	private INewGoodService service;

	// 캅챠 테스트
	@RequestMapping(value = "/capcharTest.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String capcharMain(HttpServletRequest request, HttpServletResponse response) {

		//int result = service.capcharTest(request, response);

		return "/test/capchartest";
	}
	
	// 캅챠 테스트
	@RequestMapping(value = "/capcharMainAjax.action", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String capcharMainAjax(HttpServletRequest request, HttpServletResponse response) {

		//int result = service.capcharTest(request, response);
		
		//VerifyRecaptcha.setSecretKey("시크릿 코드");
	    //String gRecaptchaResponse = request.getParameter("recaptcha");
		
		System.out.println("??!!");
		
		return "??";
	}
	
	
	
}

package com.test.SYJ_Mall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.test.main.MainService;

/**
 * 메인 페이지 컨트롤러 역할
 * 
 * @author joonpyo-hong
 *
 */
@Controller
public class MainController {
	
	/*
	 * @Autowired private MainService service;
	 */
	
	// 메인화면
	@RequestMapping(value = "/main.action", method = { RequestMethod.GET })
	public String main() {
		
		return "/main/Main";
	}	
}

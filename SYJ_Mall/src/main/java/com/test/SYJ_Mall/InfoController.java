package com.test.SYJ_Mall;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * 안내 페이지 컨트롤러 역할
 * 
 * @author joonpyo-hong
 *
 */
@Controller
public class InfoController {

	// @Autowired
	// private BoardService service;
	
	@RequestMapping(value = "/info.action", method = { RequestMethod.GET })
	public String info() {

		return "/tiles/infoStart.topping";
	}

}

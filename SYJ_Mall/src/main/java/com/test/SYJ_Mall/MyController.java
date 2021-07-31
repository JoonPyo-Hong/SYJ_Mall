package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 마이페이지 관련 컨트롤러
 * @author shin
 *
 */
@Controller
public class MyController {
	
	@RequestMapping(value = "/myStart.action", method = { RequestMethod.GET })
	public String newGoodsStart(HttpServletRequest request, HttpServletResponse response, String site) {
		
		request.setAttribute("selected", "my");
		//int result = goodService.setTopProductSetting(request);
		
		return "/tiles/myStart.topping";	
	}
}

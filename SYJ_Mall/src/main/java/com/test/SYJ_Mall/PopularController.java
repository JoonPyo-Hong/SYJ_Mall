package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 인기 페이지 관련 컨트롤러
 * @author shin
 *
 */
@Controller
public class PopularController {
	
	@RequestMapping(value = "/popularStart.action", method = { RequestMethod.GET })
	public String newGoodsStart(HttpServletRequest request, HttpServletResponse response, String site) {
		
		request.setAttribute("selected", "popular");
		//int result = goodService.setTopProductSetting(request);
		
		return "/tiles/popularStart.topping";	
	}
	
}

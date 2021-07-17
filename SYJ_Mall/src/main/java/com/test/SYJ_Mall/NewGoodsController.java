package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 신규상품 페이지 관련 컨트롤러
 * @author shin
 *
 */
@Controller
public class NewGoodsController {
	
	
	// 처음에 로그인 페이지로 보내주는 곳
	@RequestMapping(value = "/newGoodsStart.action", method = { RequestMethod.GET,RequestMethod.POST })
	public String newGoodsStart(HttpServletRequest request, HttpServletResponse response, String site) {
			
		//return ;	
	}
}

package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.KakaoCookie;
import com.test.SYJ_Mall.popularItem.IPopularService;

@Controller
public class PopularItemController {
	@Autowired
	private IPopularService service;
	
	// 처음에 로그인 페이지로 보내주는 곳
	@RequestMapping(value = "/popularMain.action", method = { RequestMethod.GET,RequestMethod.POST })
	public String login(HttpServletRequest request, HttpServletResponse response) {
				
		int result = service.getPopularProductList(request);
		KakaoCookie ck = new KakaoCookie();
		ck.generateCookie(response, "lastPage", "popularMain");
		
		
		if (result == 1) {
			return "/tiles/popularItem.layout";
		} else {
			return "/testwaiting/kakaoerror";//에러 발생한 경우
		}	
	}
}

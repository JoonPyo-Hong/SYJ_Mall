package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.myPages.IMyPagesService;

/**
 * 마이페이지 컨트롤러
 * @author shin
 *
 */
@Controller
public class MyPagesController {
	@Autowired
	private IMyPagesService service;
	
	// 신규페이지 처음 메인화면
	@RequestMapping(value = "/myPageMain.action", method = { RequestMethod.GET })
	public String popularItemMain(HttpServletRequest request, HttpServletResponse response) {

		int result = service.getMyPageSelect(request,response);
		
		if (result == 1) return "/tiles/myPageRecent.layout";
		else if (result == 2) return "/tiles/myPageMyTrace.layout";
		else if (result == 3) return "/tiles/myPageMyBasket.layout";
		else if (result == 4) return "/tiles/myPageOrderHistory.layout";
		else return "/testwaiting/kakaoerror";
	}
	
}

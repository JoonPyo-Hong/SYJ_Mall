package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.newProduct.INewProductService;

@Controller
public class NewProductController {

	@Autowired
	private INewProductService service;

	// 인기페이지 처음 메인화면
	@RequestMapping(value = "/newProductMain.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String popularItemMain(HttpServletRequest request, HttpServletResponse response) {

		int result = service.getNewProductInfo(request, response);

		if (result == 1)
			return "/tiles/newProduct.layout";
		else
			return "/testwaiting/kakaoerror";
	}
}

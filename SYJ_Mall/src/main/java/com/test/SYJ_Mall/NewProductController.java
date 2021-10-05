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
	
	//인기페이지 처음 메인화면
		@RequestMapping(value = "/newProductMain.action", method = { RequestMethod.GET })
		public String popularItemMain(HttpServletRequest request, HttpServletResponse response) {
			
			//request.setAttribute("seleted", "new");//상단-> 오늘/신규/인기/마이 중에서 인기를 선택해주는 로직
			
			int result = service.getNewProductInfo(request,response);
			
			return "/tiles/newProduct.layout";
		}
}

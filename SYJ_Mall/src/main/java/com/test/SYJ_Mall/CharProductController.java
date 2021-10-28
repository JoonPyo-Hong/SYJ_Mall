package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.charProdt.ICharProdtService;

/**
 * 캐릭터별 페이지 컨트롤러
 * 
 * @author shin
 *
 */
@Controller
public class CharProductController {
	
	@Autowired
	private ICharProdtService service;
	
	//캐릭터별 페이지 안내 -> 라이언,춘식 등등
	@RequestMapping(value = "/charAtProdtStart.action", method = { RequestMethod.GET })
	public String searchStart(HttpServletRequest request, HttpServletResponse response) {
		
		int result = service.setCharProdtStart(request,response);
		
		if (result == 1) {
			return "/charProdt/charProdtMain";
		} else {
			return "/testwaiting/kakaoerror";
		}
		
	}

}

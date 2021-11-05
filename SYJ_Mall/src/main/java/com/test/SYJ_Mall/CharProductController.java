package com.test.SYJ_Mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.CommonDAO;
import com.common.utill.MasterDTO;
import com.test.SYJ_Mall.charProdt.CharProdtDTO;
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
	public String charProdtStart(HttpServletRequest request, HttpServletResponse response) {
		
		
		int result = service.setCharProdtStart(request,response);
		
		if (result == 1) {
			return "/charProdt/charProdtMain";
		} else {
			return "/testwaiting/kakaoerror";
		}
	
	}
	
	//캐릭터 상품 무한스크롤
	@RequestMapping(value = "/charAtProdtStart.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<CharProdtDTO> charProdtScroll(HttpServletRequest request, HttpServletResponse response) {
		
		return service.getCharProdtAjax(request);
	}
	
	@RequestMapping(value = "/charItemBasketSet.action", method = { RequestMethod.GET })
	@ResponseBody
	public int charItemBasketSet(HttpServletRequest request, HttpServletResponse response) {
		
		return service.charProdtBasketItem(request,response);
	
	}
	
	
	

}

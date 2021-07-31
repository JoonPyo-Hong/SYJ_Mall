package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.newGoods.INewGoodService;





/**
 * 신규상품 페이지 관련 컨트롤러
 * @author shin
 *
 */
@Controller
public class NewGoodsController {
	
	@Autowired
	private INewGoodService goodService;
	
	
	@RequestMapping(value = "/newGoodsStart.action", method = { RequestMethod.GET })
	public String newGoodsStart(HttpServletRequest request, HttpServletResponse response, String site) {
		
		request.setAttribute("selected", "new");
		int result = goodService.setTopProductSetting(request);
		
		return "/tiles/newGoodsStart.topping";	
	}
}

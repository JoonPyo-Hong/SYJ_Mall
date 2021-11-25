package com.test.SYJ_Mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.newProduct.INewProductService;
import com.test.SYJ_Mall.newProduct.NewFriendsProdDTO;
import com.test.SYJ_Mall.newProduct.RecommendThemeDTO;

@Controller
public class NewProductController {

	@Autowired
	private INewProductService service;

	// 신규페이지 처음 메인화면
	@RequestMapping(value = "/newProductMain.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String popularItemMain(HttpServletRequest request, HttpServletResponse response) {

		int result = service.getNewProductInfo(request, response);

		if (result == 1)
			return "/tiles/newProduct.layout";
		else
			return "/testwaiting/kakaoerror";
	}

	// ajax 처리 장바구니 클릭해주는 기능
	@RequestMapping(value = "/newProductBasket.action", method = { RequestMethod.GET })
	@ResponseBody
	public int newProductBascket(HttpServletRequest request, HttpServletResponse response) {
		return service.setnewProductBasket(request, response);
	}
	
	// ajax 처리 장바구니 클릭해주는 기능
	@RequestMapping(value = "/newProductAlarm.action", method = { RequestMethod.GET })
	@ResponseBody
	public int newProductAlarm(HttpServletRequest request, HttpServletResponse response) {
		return service.setnewProductAlarm(request);
	}

	// ajax 처리 - 새로나온 친구들 물품 객체 무한스크롤
	@RequestMapping(value = "/newFriendsProduct.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<NewFriendsProdDTO> newFriendsProduct(HttpServletRequest request, HttpServletResponse response) {
		return service.getNewFriendsProdts(request,response);
	}
	
	//추천 신규 테마 - 더보기 화면
	@RequestMapping(value = "/newProductMainAdd.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String newProductMainAdd(HttpServletRequest request, HttpServletResponse response) {
		
		int result = service.getNewProdcutAddInfo(request,response);
		
		if (result == 1) return "/semitiles/addProduct.layout";
		else return "/testwaiting/kakaoerror";
		
	}
	
	//추천 신규 테마 - 더보기 화면 : 무한스크롤
	@RequestMapping(value = "/newProductMainAddAjax.action", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<RecommendThemeDTO> newProductMainAddAjax(HttpServletRequest request, HttpServletResponse response) {
		
		//if (result == 1) return "/semitiles/addProduct.layout";
		//else return "/testwaiting/kakaoerror";
		return service.getnewProductMainAddAjaxInfo(request,response);
	}
	
	
}

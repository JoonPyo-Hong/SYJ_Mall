package com.test.SYJ_Mall;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.KakaoCookie;
import com.test.SYJ_Mall.popularItem.IPopularService;
import com.test.SYJ_Mall.popularItem.PopularItemDTO;

@Controller
public class PopularItemController {
	@Autowired
	private IPopularService service;
	
	//인기페이지 처음 메인화면
	@RequestMapping(value = "/popularMain.action", method = { RequestMethod.GET,RequestMethod.POST })
	public String popularItemMain(HttpServletRequest request, HttpServletResponse response) {
				
		int result = service.getPopularProductList(request,1);
		KakaoCookie ck = new KakaoCookie();
		ck.generateCookie(response, "lastPage", "popularMain");
		//request.setAttribute("lastPage", "popularMain");
		
		if (result == 1) {
			return "/tiles/popularItem.layout";
		} else {
			return "/testwaiting/kakaoerror";
		}	
	}
	
	
	//인기페이지 -> 스크롤 내렸을 경우 물품 계속 불러오기 처이
	@RequestMapping(value = "/popularItemAjax.action", method = { RequestMethod.POST })
	public void popularItemAjax(HttpServletRequest request, HttpServletResponse response) {
		
		int paging = Integer.parseInt(request.getParameter("paging"));
		//System.out.println(paging);
		
		try {
			PrintWriter out = response.getWriter();
			//List<PopularItemDTO> poDtoList = service.getPopularProductAjax(paging);
			//int result = service.getPopularProductList(request,paging);
			
			//int result = 3;
			ArrayList<PopularItemDTO> result = new ArrayList<PopularItemDTO>();
			PopularItemDTO dto = new PopularItemDTO();
			dto.setProductId(13);
			dto.setProductImg("asdasd");
			//result.add(dto);
			//result.add(2);
			
			//List<Integer> list = new ArrayList<Integer>();
			//list.add(Integer.toString(dto.getProductId()));
			
			
			//out.print(poDtoList);
			out.print(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
	
}

package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.KakaoCookie;
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
	public String myPageMain(HttpServletRequest request, HttpServletResponse response) {

		int result = service.getMyPageSelect(request,response);
		
		//test data
		//KakaoCookie kc = new KakaoCookie();
		//kc.generateCookie(response, "seenList", "13#45#44#12#", 60 * 60 * 24 * 7);
		
		//1. 최근 본 내역
		if (result == 1) {	
			
			int seenResult = service.getMyPageSeen(request,response);
			
			if (seenResult == 1) return "/tiles/myPageRecent.layout";
			else return "/testwaiting/kakaoerror";
		}
		//2. 내 활동(로그인 필요) -> 로그인 검증 한번 더 해줘야 할듯
		else if (result == 2) {
			
			int traceResult = service.getMyPageTrace(request,response);
			
			if (traceResult == 1) return "/tiles/myPageMyTrace.layout";
			else return "/testwaiting/kakaoerror";
			
		}
		//3. 장바구니
		else if (result == 3) return "/tiles/myPageMyBasket.layout";
		//4. 주문내역(로그인 필요) -> 로그인 검증 한번 더 해준다.
		else if (result == 4) return "/tiles/myPageOrderHistory.layout";
		else return "/testwaiting/kakaoerror";
	}
	
	//최근 본 내역 - 물품 삭제
	@RequestMapping(value = "/myPageProdSeenDelete.action", method = { RequestMethod.GET })
	@ResponseBody
	public int myPageProdSeenDelete(HttpServletRequest request, HttpServletResponse response) {
		
		return service.deleteMyPageProdSeen(request,response);
	}
	
	//최근 본 내역 - 모든 물품 삭제
	@RequestMapping(value = "/myPageAllProdSeenDelete.action", method = { RequestMethod.GET })
	@ResponseBody
	public int myPageAllProdSeenDelete(HttpServletRequest request, HttpServletResponse response) {
		
		return service.deleteMyPageAllProdSeen(request,response);
	}
	
	
}

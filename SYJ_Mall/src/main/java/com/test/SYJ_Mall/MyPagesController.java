package com.test.SYJ_Mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.ErrorAlarm;
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
	public String myPageMain(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc, ErrorAlarm ea) {

		int result = service.getMyPageSelect(request,response);
		
		//test data -> cookie 데이터 넣어주기
		//KakaoCookie kc = new KakaoCookie();
		//kc.generateCookie(response, "seenList", "13#45#44#12#", 60 * 60 * 24 * 7);
		
		//1. 최근 본 내역
		if (result == 1) {	
			
			int seenResult = service.getMyPageSeen(request,response,kc);
			
			if (seenResult == 1) return "/tiles/myPageRecent.layout";
			else return "/testwaiting/kakaoerror";
		}
		//2. 내 활동(로그인 필요) -> 로그인 검증 한번 더 해줘야 할듯
		else if (result == 2) {
			
			int traceResult = service.getMyPageTrace(request,response);
			
			if (traceResult == 1) return "/tiles/myPageMyTrace.layout";
			else if (traceResult == -2) return "/semitiles/loginDirect.layout";
			else return "/testwaiting/kakaoerror";
			
		}
		//3. 장바구니
		else if (result == 3) {
			
			int myBasketResult = service.getMyPageBasket(request,response);
			
			if (myBasketResult == 1) return "/tiles/myPageMyBasket.layout";
			else return "/testwaiting/kakaoerror";
			
		}
		//4. 주문내역(로그인 필요) -> 로그인 검증 한번 더 해준다.
		else if (result == 4) {
			
			int orderResult = service.getMyPageOrderList(request,response,ea);
			
			if (orderResult == 1) return "/tiles/myPageOrderHistory.layout";
			else return "/semitiles/loginDirect.layout";
		}
		else return "/testwaiting/kakaoerror";
	}
	
	//최근 본 내역 - 물품 삭제
	@RequestMapping(value = "/myPageProdSeenDelete.action", method = { RequestMethod.GET })
	@ResponseBody
	public int myPageProdSeenDelete(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc) {
		
		return service.deleteMyPageProdSeen(request,response,kc);
	}
	
	//최근 본 내역 - 모든 물품 삭제
	@RequestMapping(value = "/myPageAllProdSeenDelete.action", method = { RequestMethod.GET })
	@ResponseBody
	public int myPageAllProdSeenDelete(HttpServletRequest request, HttpServletResponse response) {
		
		return service.deleteMyPageAllProdSeen(request,response);
	}
	
	//장바구니 - 특정 물품 내역 삭제
	@RequestMapping(value = "/myPageBasketDelete.action", method = { RequestMethod.GET })
	@ResponseBody
	public int myPageBasketDelete(HttpServletRequest request, HttpServletResponse response) {
		
		return service.deleteMyPageBasket(request,response);
	}
	
	//장바구니 - 특정 물품 내역 여러개 삭제
	@RequestMapping(value = "/myPageBasketSeletedDelete.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<Integer> myPageBasketSeletedDelete(HttpServletRequest request, HttpServletResponse response) {
		
		return service.deleteMyPageBaskets(request,response);
	}
	
	@RequestMapping(value = "/geustOrderInquiry.action", method = { RequestMethod.GET })
	public String geustOrderInquiry(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("geustOrderInquiry", "true");
		
		return "/semitiles/geustOrderInquiry.layout";
		
	}
	
	//상품주문 히스토리 디테일 관련
	@RequestMapping(value = "/myPageOrderListDetail.action", method = { RequestMethod.GET })
	public String myPageOrderListDetail(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		int result = service.getProdtOrderHist(request,response,ea);
		
		if (result == 1) {
			return "/semitiles/productOrderHistoryDetail.layout";
		} else {
			return "/testwaiting/kakaoerror";
		}
	}
	
	//자신의 정보 수정
	@RequestMapping(value = "/myInfoEdited.action", method = { RequestMethod.GET })
	public String myInfoEdited(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		int result = service.getUserInfoEdited(request,response,ea);
		
		if (result == 1) {
			return "/semitiles/userInfoEdit.layout";
		} else {
			return "/testwaiting/kakaoerror";
		}
	}
	
	
	
}

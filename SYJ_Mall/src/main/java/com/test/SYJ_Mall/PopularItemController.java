package com.test.SYJ_Mall;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.KakaoCookie;
import com.test.SYJ_Mall.login.UserDTO;
import com.test.SYJ_Mall.popularItem.IPopularService;
import com.test.SYJ_Mall.popularItem.PopularItemDTO;

@Controller
public class PopularItemController {
	@Autowired
	private IPopularService service;
	
	//인기페이지 처음 메인화면
	@RequestMapping(value = "/popularMain.action", method = { RequestMethod.GET,RequestMethod.POST })
	public String popularItemMain(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO)session.getAttribute("userinfo");
			//마지막 페이지 정보 쿠키에 넘기는 작업
			KakaoCookie ck = new KakaoCookie();
			ck.generateCookie(response, "lastPage", "popularMain");
			
			int popResult = -1;
			
			if (userInfo == null) {
			//로그인 된 경우
				String basketList = service.getCookieBasket(request,response);
				popResult = service.getPopularProductList(request,1,0,basketList);
			} 
			else {
			//로그인 되지 않은 경우
				int userSeq = userInfo.getUserSeq();//유저 고유번호
				popResult = service.getPopularProductList(request,1,userSeq,"");
			}
			
			if (popResult == 1) return "/tiles/popularItem.layout";
			else throw new Exception();
			
		} catch(Exception e) {
			e.printStackTrace();
			return "/testwaiting/kakaoerror";
		}	
	}
	
	
	//인기페이지 -> 스크롤 내렸을 경우 물품 계속 불러오기 처리
	@RequestMapping(value = "/popularItemAjax.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<PopularItemDTO> popularItemAjax(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		UserDTO userInfo = (UserDTO)session.getAttribute("userinfo");
		
		int paging = Integer.parseInt(request.getParameter("paging"));
		
		try {
			
			//1. 로그인 되어있는 경우
			if (userInfo != null) {
				int userSeq = userInfo.getUserSeq();//유저 고유번호
				return service.getPopularProductAjax(paging,userSeq);
			}
			//2. 로그인 되어있지 않은 경우
			else {
				String basketList = service.getCookieBasket(request,response);//쿠키리스트
				System.out.println(basketList);
				return service.getPopularProductAjax(paging,basketList);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//인기페이지 -> 장바구니에 담기
	@RequestMapping(value = "/popularItemBasketInput.action", method = { RequestMethod.GET })
	@ResponseBody
	public int popularItemBasketInput(HttpServletRequest request, HttpServletResponse response) {
		
		int productId = Integer.parseInt(request.getParameter("productId"));//상품번호
		HttpSession session = request.getSession();
		
		
		try {
			
			UserDTO userInfo = (UserDTO)session.getAttribute("userinfo");
			
			//1. 로그인 되어 있지 않은 경우
			if (userInfo == null) {
				//System.out.println("로그인 안되어있음");
				return service.inputItemBasketNonLogin(request,response,productId);
			} 
			//2. 로그인 되어 있는경우
			else {
				int userSeq = userInfo.getUserSeq();//유저 고유번호
				int result = service.inputItemBasket(userSeq,productId);
				
				if (result == -2) {
					throw new Exception();
				}
				
				return result;
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			
			return -2;
		}
	}
	
	
	//인기페이지 -> 장바구니에  담긴것 지우기
	@RequestMapping(value = "/popularItemBasketOutput.action", method = { RequestMethod.GET })
	@ResponseBody
	public int popularItemBasketOutput(HttpServletRequest request, HttpServletResponse response) {
		
		int productId = Integer.parseInt(request.getParameter("productId"));//상품번호
		HttpSession session = request.getSession();
		
		try {
			
			UserDTO userInfo = (UserDTO)session.getAttribute("userinfo");
			
			//1. 로그인 되어 있지 않은 경우
			if (userInfo == null) {
				return service.outputItemBasketNonLogin(request,response,productId);
			} 
			//2. 로그인 되어 있는경우
			else {
				int userSeq = userInfo.getUserSeq();//유저 고유번호
				int result = service.outputItemBasket(userSeq,productId);
				
				if (result == -2) {
					return -2;
				}
				
				return result;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return -2;
		}
		
	}	

}

package com.test.SYJ_Mall.popularItem;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.KakaoCookie;

@Service
public class PopularService implements IPopularService{
	
	@Autowired
	private IPoupularDAO dao;
	
	
	//인기상품 보여주기
	@Override
	public int getPopularProductList(HttpServletRequest request, int paging, int userSeq, String basketList) {
		try {
			
			List<PopularItemDTO> popularDtoList = dao.getPopularItem(paging,userSeq,basketList);
			request.setAttribute("popularDtoList", popularDtoList);
			request.setAttribute("seleted", "popular");//상단 오늘/신규/인기/마이 중에서 인기를 선택해주는 로직
			
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	//인기상품 보여주기 -> ajax 처리 : 로그인 한 경우
	@Override
	public List<PopularItemDTO> getPopularProductAjax(int paging, int userSeq) {
		
		return dao.getPopularItem(paging,userSeq,"");
	}

	//인기상품 보여주기 -> ajax 처리 : 로그인 안한 경우
	@Override
	public List<PopularItemDTO> getPopularProductAjax(int paging, String cookieList) {
		
		return dao.getPopularItem(paging,0,"");
	}
	
	
	
	//쿠키객체 만들어주기
	@Override
	public Object generateCookie(HttpServletRequest request, HttpServletResponse response, String cookieName) {
		
		KakaoCookie ck = new KakaoCookie();
		//Object result = ck.generateCookie(response, cookieName, ,60*60*24*3);
		
		return null;
	}
	
	//회원이 선택한 상품 장바구니에 넣어주기
	@Override
	public int inputItemBasket(int userSeq, int productId) {
	
		return dao.inputItemBasket(userSeq,productId);
	}


}

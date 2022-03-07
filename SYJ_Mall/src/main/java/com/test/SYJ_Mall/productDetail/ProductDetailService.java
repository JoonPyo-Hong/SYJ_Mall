package com.test.SYJ_Mall.productDetail;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.login.UserDTO;

/**
 * 
 * @author shin
 *
 */
@Service
public class ProductDetailService implements IProductDetailService{
	
	@Autowired IProductDetailDAO dao;
	
	/*
	 
	 물품페이지 상세 -> 로그인한 경우와 로그인 하지 않은 경우를 나눠줘야함
	 
	 1. 상품에 대한 정보
	 - 이름
	 - 헤더 사진
	 - 가격
	 - 평균 별점 (몇명이 별점을 남겼는지 갯수)
	 - 해당 물품에 대한 상세 사진 및 설명 : 직접 코드로 가져올것.
	
	
	 2. 리뷰 관련
	 - 해당 리뷰에 대한 내용
	 - 해당 리뷰를 쓴 유저 아이디 또는 로그인을 안한 유저의 이름
	 - 해당 리뷰에 대한 좋아요 정보
	 - 해당 리뷰를 쓴 날짜
	 - 좋아요/ 최신순 리뷰 순서 
	
	 
	 3. 잠깐만 이 상품은 어때요
	 - 상품 이름
	 - 상품 사진
	 - 상품 가격
	 - 상품 장바구니 또는 알람 기능
	 
	 4. 최근본 상품
	 - 상품 이름
	 - 상품 사진
	 - 상품 가격
	 - 상품 장바구니 또는 알람 기능

	*/
	@Override
	public int getProductDetilMain(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf) {
		
		try {
			
			String prodtSeq = request.getParameter("prodtSeq");//제품번호
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("userinfo");//로그인 정보
			
			
			//공동
			//1. 상품에 대한 정보
			//1-1. 해당 물품의 헤드 사진
			List<String> headImgUrls = dao.getProductHeadImages(Integer.parseInt(prodtSeq));
			List<ProductDetailDTO> prodtInfo;
			
			//로그인이 안된 경우
			if (dto == null) {
				
				String basketInfo = getCookieBasket(request, response, kc);//장바구니 담은 정보
				
				//1. 상품에 대한 정보
				//1-2. 해당 물품의 상세정보
				prodtInfo = dao.getProductDetailInfo(Integer.parseInt(prodtSeq));
				
				if (prodtInfo.size() == 0) return -1;
				
				//1-2. 해당 물품이 쿠키정보에 있었는지 확인
				boolean cookieFlag = sf.findObjectInString(basketInfo,"#",prodtSeq);
				if (cookieFlag) prodtInfo.get(0).setCookieBasket("Y");
				
				
				//2. 리뷰 관련
				
				
				//3. 잠깐만 이 상품은 어때요
				
				
				//4. 최근 본 상품
			} 
			//로그인이 된경우
			else {
				//1. 상품에 대한 정보
				//List<ProductDetailDTO> prodtInfo = dao.getProductDetailInfo(prodtSeq);
				prodtInfo = dao.getProductDetailInfo(Integer.parseInt(prodtSeq));//임시로 넣어둠
				
				if (prodtInfo.size() == 0) return -1;
				//2. 리뷰 관련
				
				
				//3. 잠깐만 이 상품은 어때요
				
				
				//4. 최근 본 상품
			}
			
			
			
			request.setAttribute("headImgUrls", headImgUrls);//해당 물품의 헤드 사진
			request.setAttribute("prodtInfo", prodtInfo.get(0));//해당 물품의 상세정보
			
			
			return 1;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
	
	// 쿠키에 존재하는 장바구니 내역 가져오기
	@Override
	public String getCookieBasket(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc) {
	
		String basketList = (String) kc.getCookieInfo(request, "basketList");
	
		// 쿠키내에 장바구니 내역이 없는경우
		if (basketList == null) {
	
			kc.generateCookie(response, "basketList", "", 60 * 60 * 24 * 7);// 쿠키생성 7 일동안 유지
			String newBasketList = (String) kc.getCookieInfo(request, "basketList");
	
			return newBasketList;
	
		} else {
			// 쿠키내에 장바구니 내역이 있는경우
	
			if (basketList.length() != 0) {
				basketList = basketList.substring(0, basketList.length() - 1);
				return basketList;// 기존쿠키 넘기기
			} else {// basketList 에 지금 아무런 정보가 존재하지 않는경우
				return basketList;// 기존쿠키 넘기기
			}
		}
	}
	
	
}

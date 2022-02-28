package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.productDetail.IProductDetailService;

/**
 * 
 * @author shin
 *
 */
@Controller
public class ProductDetail {
	
	@Autowired
	private IProductDetailService service;

	
	/*
	 
	 물품페이지 상세 
	 
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
	@RequestMapping(value = "/productDetailMain.action", method = { RequestMethod.GET})
	public String productDetailMain(HttpServletRequest request, HttpServletResponse response) {
		
		String prodtSeq = request.getParameter("prodtSeq");//제품번호
		
		//1. 상품에 대한 정보
		
		
		//2. 리뷰 관련
		
		
		//3. 잠깐만 이 상품은 어때요
		
		
		//4. 최근 본 상품
		
		
		
		
		return "/semitiles/productDetail.layout";
	}

}

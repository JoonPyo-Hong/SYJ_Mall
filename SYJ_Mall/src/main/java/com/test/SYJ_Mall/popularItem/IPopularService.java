package com.test.SYJ_Mall.popularItem;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IPopularService {

	/**
	 * 인기페이지 상품 나열해줄것
	 * @param request
	 * @param paging	페이징 변수
	 * @return			1: 성공, -1: 실패
	 */
	//int getPopularProductList(HttpServletRequest request,int paging);
	
	
	/**
	 * 
	 * @param request
	 * @param paging		페이징 변수
	 * @param userSeq		로그인 한 경우 - 고객 고유 번호
	 * @param basketList	로그인 안한경우 - 쿠키에 들어있는 상품 바구니정보
	 * @return				1: 성공, -1: 실패
	 */
	int getPopularProductList(HttpServletRequest request, int paging, int userSeq, String basketList);
	
	/**
	 * 인기페이지 상품 나열하는데 ajax 처리 해줄부분 -> 무한스크롤
	 * @param paging	페이징 변수
	 * @return			PopularItemDTO 객체
	 */
	//List<PopularItemDTO> getPopularProductAjax(int paging);
	
	
	/**
	 * 인기페이지 상품 나열하는데 ajax 처리 해줄부분 -> 무한스크롤 : 로그인 한 경우
	 * @param paging	페이징 변수
	 * @param userSeq	유저고유번호
	 * @return			1: 성공, -1: 실패
	 */
	List<PopularItemDTO> getPopularProductAjax(int paging, int userSeq);
	
	
	/**
	 * 인기페이지 상품 나열하는데 ajax 처리 해줄부분 -> 무한스크롤 : 로그인 한 경우
	 * @param paging		페이징 변수
	 * @param cookieList	쿠키바구니 정보
	 * @return				1: 성공, -1: 실패
	 */
	List<PopularItemDTO> getPopularProductAjax(int paging, String cookieList);
	
	
	/**
	 * 회원이 장바구니 클릭했을 때 db에 정보 넣어주기
	 * @param userSeq		회원 고유번호
	 * @param productId		상품 아이디
	 * @return				1: 성공, -1: 실패, -2 : 에러발생 
	 */
	int inputItemBasket(int userSeq, int productId);
	
	/**
	 * 회원이 장바구니 클릭했을 때 db에 정보 넣어주기 -> 장바구니 내역 삭제
	 * @param userSeq		회원 고유번호
	 * @param productId		상품 아이디
	 * @return				1: 성공, -1: 실패, -2 : 에러발생 
	 */
	int outputItemBasket(int userSeq, int productId);
	
	
	/**
	 * 로그인 하지 않은 경우 쿠키에 있는 장바구니 내용 가져오기
	 * @param request	
	 * @param response
	 * @return	쿠키에 존재하는 장바구니 내역
	 */
	String getCookieBasket(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 로그인 하지 않은 경우 장바구니 클릭했을때 쿠키에 물품정보 넣어주기
	 * @param request
	 * @param response
	 * @param productId	물품 아이디
	 * @return			1 : 성공, -1 : 실패
	 */
	int inputItemBasketNonLogin(HttpServletRequest request, HttpServletResponse response, int productId);
	
	/**
	 * 로그인 하지 않은 경우 장바구니 클릭했을때 쿠키에 물품정보 빼주기
	 * @param request
	 * @param response
	 * @param productId	물품 아이디
	 * @return			1 : 성공, -1 : 실패
	 */
	int outputItemBasketNonLogin(HttpServletRequest request, HttpServletResponse response, int productId);



}

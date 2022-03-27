package com.test.SYJ_Mall.productDetail;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.CommonDate;
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
	public int getProductDetilMain(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, Random rnd,CommonDate cd) {
		
		try {
			
			String prodtSeq = request.getParameter("prodtSeq");//제품번호
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("userinfo");//로그인 정보
			

			kc.deleteCookie(request, response, "lastPage");
			kc.generateCookie(response, "lastPage", "productDetailMain.action?prodtSeq=" + prodtSeq);// 마지막페이지 쿠키에 저장
			
			//공동
			//1. 상품에 대한 정보
			//1-1. 해당 물품의 헤드 사진
			List<String> headImgUrls = dao.getProductHeadImages(Integer.parseInt(prodtSeq));
			List<Integer> prodtMainCategory = dao.getProductCategory();
			List<ProductDetailDTO> prodtInfo;//해당 상품 상세정보들
			List<ProductHowDTO> prodtHowInfo;//잠깐만 이 상품은 어때요 상품 객체들
			List<ProductDetailReviewDTO> prodtReviewInfo;//해당상품 리뷰정보
			
			int selectCategory = prodtMainCategory.get(rnd.nextInt(prodtMainCategory.size()));//선택된 대분류 번호
			int totalReviewCount = dao.getProductReviewCounts(Integer.parseInt(prodtSeq));//해당상품 리뷰 총 개수
			int totalReviewPage = (int)Math.ceil(totalReviewCount/4.0);
			String currentTime = cd.getPresentTime();
			
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
				
				
				//2. 리뷰 정보 -> 좋아요 순 최신순 선택 : 기본은 최신순으로
				int sortOption = 1;
				prodtReviewInfo = dao.getProductReview(prodtSeq, sortOption , 1, currentTime);
				
				//3. 잠깐만 이 상품은 어때요
				int filterSeq = rnd.nextInt(4) + 1;//필터링 번호
				prodtHowInfo = dao.getProductHowInfo(basketInfo,Integer.parseInt(prodtSeq),filterSeq,selectCategory);
				
				
				//4. 최근 본 상품
			} 
			//로그인이 된경우
			else {
				
				int userSeq = dto.getUserSeq();//회원 고유번호
				
				//1. 상품에 대한 정보
				//1-2. 해당 물품의 상세정보
				prodtInfo = dao.getProductDetailInfoLogin(userSeq,Integer.parseInt(prodtSeq));
				
				if (prodtInfo.size() == 0) return -1;
				
				//2. 리뷰 정보 -> 좋아요 순 최신순 선택 : 기본은 최신순으로 -> 로그인 시에는 바꿔줘야한다.
				int sortOption = 1;
				prodtReviewInfo = dao.getProductReview(prodtSeq, sortOption , 1, currentTime);
				
				//3. 잠깐만 이 상품은 어때요
				int filterSeq = rnd.nextInt(4) + 1;//필터링 번호
				prodtHowInfo = dao.getProductHowInfoLogin(userSeq,Integer.parseInt(prodtSeq),filterSeq, selectCategory);
				
				
				//4. 최근 본 상품
				request.setAttribute("dtoSeq", dto.getUserSeq());//해당 물품의 상세정보
			}
			
			
			
			request.setAttribute("headImgUrls", headImgUrls);//해당 물품의 헤드 사진
			request.setAttribute("prodtInfo", prodtInfo.get(0));//해당 물품의 상세정보
			request.setAttribute("prodtHowInfo", prodtHowInfo);//해당 물품의 상세정보
			request.setAttribute("prodtReviewInfo", prodtReviewInfo);// 해당물품 관련리뷰 정보
			request.setAttribute("totalReviewCount", totalReviewCount);// 해당물품 관련리뷰 전체 개수
			request.setAttribute("totalReviewPage", totalReviewPage);// 해당물품 페이징이 몇번 일어나는지 밝혀줌
			request.setAttribute("currentTime", currentTime);// 기준시간
			
			
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
	
	//리뷰 더보기 기능
	@Override
	public List<ProductDetailReviewDTO> getProdtReviewPage(HttpServletRequest request, ErrorAlarm ea) {
		try {
			
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("userinfo");//로그인 정보
			List<ProductDetailReviewDTO> prodtReviewInfo;//해당상품 리뷰정보
			
			String prodtSeq = request.getParameter("selected_prodt_seq");//상품번호
			int sortOption = Integer.parseInt(request.getParameter("sortOption"));//상품번호
			int currentPage = Integer.parseInt(request.getParameter("current_page"));//상품번호
			String currentTime = request.getParameter("review_show_day");//리뷰 관점 시간
			
			//로그인 되어 있지 않은 경우
			if (dto == null) {
				prodtReviewInfo = dao.getProductReview(prodtSeq, sortOption , currentPage, currentTime);
			}
			//로그인 되어 있는 경우
			else {
				//여기선 좀 다르게 해줘야함.
				prodtReviewInfo = dao.getProductReview(prodtSeq, sortOption , currentPage, currentTime);
			}
			
			return prodtReviewInfo;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return null;
		}
	}
	
}

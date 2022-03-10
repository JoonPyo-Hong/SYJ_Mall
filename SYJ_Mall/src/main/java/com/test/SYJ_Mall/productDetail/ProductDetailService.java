package com.test.SYJ_Mall.productDetail;

import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.CommonDAO;
import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
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
	public int getProductDetilMain(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, Random rnd) {
		
		try {
			
			String prodtSeq = request.getParameter("prodtSeq");//제품번호
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO) session.getAttribute("userinfo");//로그인 정보
			
			
			//공동
			//1. 상품에 대한 정보
			//1-1. 해당 물품의 헤드 사진
			List<String> headImgUrls = dao.getProductHeadImages(Integer.parseInt(prodtSeq));
			List<ProductDetailDTO> prodtInfo;
			List<ProductHowDTO> prodtHowInfo;
			
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
				int filterSeq = rnd.nextInt(4) + 1;//필터링 번호
				prodtHowInfo = dao.getProductHowInfo(basketInfo,Integer.parseInt(prodtSeq),filterSeq);
				
				
				//4. 최근 본 상품
			} 
			//로그인이 된경우
			else {
				//1. 상품에 대한 정보
				//List<ProductDetailDTO> prodtInfo = dao.getProductDetailInfo(prodtSeq);
				prodtInfo = dao.getProductDetailInfo(Integer.parseInt(prodtSeq));//임시로 넣어둠
				
				if (prodtInfo.size() == 0) return -1;
				//2. 리뷰 관련
				
				
				//3. 잠깐만 이 상품은 어때요 -> 임시
				int filterSeq = rnd.nextInt(4) + 1;//필터링 번호
				prodtHowInfo = dao.getProductHowInfo("",Integer.parseInt(prodtSeq),filterSeq);
				
				
				//4. 최근 본 상품
				
				request.setAttribute("dtoSeq", dto.getUserSeq());//해당 물품의 상세정보
			}
			
			
			
			request.setAttribute("headImgUrls", headImgUrls);//해당 물품의 헤드 사진
			request.setAttribute("prodtInfo", prodtInfo.get(0));//해당 물품의 상세정보
			request.setAttribute("prodtHowInfo", prodtHowInfo);//해당 물품의 상세정보
			
			
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
	
	// 장바구니 관련 서비스
	@Override
	public int getProductDetailModifyBasket(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, KakaoCookie kc, StringFormatClass sf, StringBuffer sb) {
		
		try {
			String prodtId = request.getParameter("selected_prodt_seq");
			HttpSession session = request.getSession();// 로그인 상태인지 아닌지 체크해준다.

			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");

			// 1. 로그인 되어 있지 않은 경우
			if (userInfo == null) {
				String basketList = (String) kc.getCookieInfo(request, "basketList");
				
				// 이미 장바구니에 담긴 번호인지 체크해준다.--> null check 해줘야한다.
				if (basketList == null) basketList = "";

				// 장바구니 쿠키 객체에서 해당물품번호가 있는지 찾아준다. 없으면 -1을 리턴할것
				boolean cookieFlag = sf.findObjectInString(basketList,"#",prodtId);
				sb = new StringBuffer();
				
				// 해당 물품이 없는 경우 -> 상품 쿠키 객체에 물품 아이디를 추가해준다.
				if (!cookieFlag) {
					sb.append(prodtId);
					sb.append("#");
					
					kc.modifyCookie(request, response, "basketList", sb.toString(), 60 * 60 * 24 * 7);
					
					return 1;// 장바구니 추가
				} 
				// 해당 물품이 존재하는경우 -> 장바구니에서 빼주기
				else {
					StringTokenizer stk = new StringTokenizer(basketList,"#");
					
					while(stk.hasMoreTokens()) {
						
						String prodtIds = stk.nextToken();
						
						if (!prodtIds.equals(prodtId)) {
							sb.append(prodtIds);
							sb.append("#");
						}
					}
						
					kc.modifyCookie(request, response, "basketList", sb.toString(), 60 * 60 * 24 * 7);
					
					return 2;//장바구니에서 제거
				}
				
			}
			// 2. 로그인 되어 있는 경우
			else {
				//int userSeq = userInfo.getUserSeq();// 유저 고유번호
				//cdao = new CommonDAO();
				//int result = cdao.setBasketProdt(userSeq, prodtId);
				//cdao.close();

				return 1;//임시

			}

		} catch (Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
	}
	
	
}

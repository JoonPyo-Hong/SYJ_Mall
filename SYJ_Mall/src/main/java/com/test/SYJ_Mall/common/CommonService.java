package com.test.SYJ_Mall.common;

import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.login.UserDTO;
import com.test.SYJ_Mall.prodtPay.ProdtPayDTO;

/**
 * 공통기능 서비스
 * @author shin
 *
 */
@Service
public class CommonService implements ICommonService{
	@Autowired
	private ICommonDAO dao;
	
	//고객이 로그인 해줬는지 안해줬는지 확인해주는 메소드
	@Override
	public int getUserLoginChecking(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		try {
			
			HttpSession session = request.getSession();// 로그인 상태인지 아닌지 체크해준다.

			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			//System.out.println(userInfo.getUserSeq());
			
			//if (userInfo == null) return -1;
			//else return 1;
			
			if (userInfo == null) return -1;
			else return 1;
			
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}

		
	}
	
	// 해당 물품의 장바구니 클릭시 정보 -> 장바구니 담겼는지 안담겼는지 확인해주는 용도
	@Override
	public int getProdtBasketChecking(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,KakaoCookie kc, StringFormatClass sf, StringBuffer sb) {
		try {
			String prodtId = request.getParameter("selected_prodt_seq");
			HttpSession session = request.getSession();// 로그인 상태인지 아닌지 체크해준다.

			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			
			// 1. 로그인 되어 있지 않은 경우
			if (userInfo == null) {
				String basketList = (String) kc.getCookieInfo(request, "basketList");
				//System.out.println(basketList);
				
				// 이미 장바구니에 담긴 번호인지 체크해준다.--> null check 해줘야한다.
				if (basketList == null) basketList = "";

				// 장바구니 쿠키 객체에서 해당물품번호가 있는지 찾아준다. 없으면 false을 리턴할것
				boolean cookieFlag = sf.findObjectInString(basketList,"#",prodtId);
				sb = new StringBuffer();
				
				// 해당 물품이 없는 경우 -> 상품 쿠키 객체에 물품 아이디를 추가해준다.
				if (!cookieFlag) {
					sb.append(basketList);
					sb.append(prodtId);
					sb.append("#");
					
					kc.modifyCookie(request, response, "basketList", sb.toString(), 60 * 60 * 24 * 7);
					//System.out.println(basketList);
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
					//System.out.println(basketList);
					return 2;//장바구니에서 제거
				}
				
				
				
			}
			// 2. 로그인 되어 있는 경우
			else {
				//이쪽 로직도 바꿔줘야한다.
				int userSeq = userInfo.getUserSeq();// 유저 고유번호
				return dao.setBasketProdtChecking(userSeq, Integer.parseInt(prodtId));
			}
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
	
	//알람설정 관련 메소드
	@Override
	public int getProductAlarmChecking(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		try {
			
			int productId = Integer.parseInt(request.getParameter("selected_prodt_seq"));// 상품번호
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			
			// --- 알람 서비스는 로그인이 되어야만 진행이 될수 있는 서비스이다.
			// 1. 로그인이 안되어있는 경우
			if (userInfo == null) {
				return 3;// 로그인이 되어있지 않으면 알람서비스를 이용할 수 없음. -> 로그인 유도
			}
			// 2. 로그인이 되어있는 경우
			else {
				int userSeq = userInfo.getUserSeq();
				
				return dao.setProdtAlarmChecking(userSeq, productId);
			}
			
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
	
	//해당 리뷰에 대해서 유저가 좋아요를 했는지 아닌지 확인해주고 또한 좋아요 처리에 대한 로직
	@Override
	public int setReviewCheckingInfo(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {

		try {
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			String inputInfo = request.getParameter("inputInfo");
			
			if (userInfo == null) return 0;
			
			StringTokenizer stk = new StringTokenizer(inputInfo,"#");
			
			int orderSeq = Integer.parseInt(stk.nextToken());
			int prodtId = Integer.parseInt(stk.nextToken());
			
			return dao.setReviewLikeControl(userInfo.getUserSeq(),orderSeq,prodtId);
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
	
}

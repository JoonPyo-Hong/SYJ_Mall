package com.test.SYJ_Mall.myPages;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.CommonDAO;
import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.login.UserDTO;

@Service
public class MyPagesService implements IMyPagesService {
	@Autowired
	private IMyPagesDAO dao;
	
	// 마이페이지 진입 페이지
	@Override
	public int getMyPageSelect(HttpServletRequest request, HttpServletResponse response) {
		try {

			request.setAttribute("seleted", "my");// 상단-> 오늘/신규/인기/마이 중에서 인기를 선택해주는 로직
			StringFormatClass sfc = new StringFormatClass();
			int myPageNum = 1;

			
			if (request.getParameter("myPageNum") != null) {
				if (sfc.isStringDigit(request.getParameter("myPageNum"))) {
					int num = Integer.parseInt(request.getParameter("myPageNum"));

					if (num > 4 || num < 1)
						myPageNum = 1;
					else
						myPageNum = num;
				}
			}
			
			request.setAttribute("myPageNum",myPageNum);
			
			return myPageNum;
		} catch (Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}

	}

	// 쿠키에 존재하는 나의 상품 조회내역 가져오기 : 정렬을 수행해서 가져와 준다.
	public String getCookieSeen(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc) {
		
		StringFormatClass sfc = new StringFormatClass();
		String seenList = (String) kc.getCookieInfo(request, "seenList");
		
		if (seenList == null) return null;
		
		return seenList;
		
//		// 쿠키내에  내가 조회한 상품내역이 없는경우
//		if (seenList == null) {
//
//			kc.generateCookie(response, "seenList", "", 60 * 60 * 24 * 7);// 쿠키생성 7 일동안 유지
//			String newBasketList = (String) kc.getCookieInfo(request, "seenList");
//
//			return newBasketList;
//
//		} else {
//			// 쿠키내에  내가 조회한 상품내역이 있는경우
//			if (seenList.length() != 0) {
//				seenList = seenList.substring(0, seenList.length() - 1);
//				return seenList;// 기존쿠키 넘기기
//			} else {// seenList 에 지금 아무런 정보가 존재하지 않는경우
//				return seenList;// 기존쿠키 넘기기
//			}
//		}
	}
	
	
	//마이페이지 - 최근 본 상품
	@Override
	public int getMyPageSeen(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc) {
		
		try {
			String seenList = getCookieSeen(request,response,kc);
			
			kc.deleteCookie(request, response, "lastPage");//기존에 있는 마지막 페이지를 지워준다.
			kc.generateUrlCookie(response, "myPageMain.action?myPageNum=1", 60 * 60 * 24 * 7);// 마지막페이지

			
			if (seenList == null) request.setAttribute("mpsList", null);
			else {
				//쿠키에 해당하는 조회상품목록 대상인 상품들을 가져와준다.
				List<MyPageSeenDTO> mpsList = dao.getMyPageSeenList(seenList);
				
				request.setAttribute("mpsListSize", mpsList.size());
				request.setAttribute("mpsList", mpsList);
			}
			
			return 1;
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}

	}
	
	//최근본 상품 목록에서 해당 상품 지워주기 -> 쿠키에서 제거
	@Override
	public int deleteMyPageProdSeen(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc) {
		
		try {
			
			StringFormatClass sfc = new StringFormatClass();
			String prodId = request.getParameter("prodId");
			
			//1.넘어온 숫자가 오롯이 제품숫자를 가리키는 경우
			if (sfc.isStringDigit(prodId)) {
				
				//제품에 해당하는 숫자를 쿠키내역에서 지워줘야한다.
				String seenList = getCookieSeen(request,response,kc);//쿠키내역에 해당되는 숫자더미
				StringTokenizer stk1 = new StringTokenizer(seenList,"#");
				int equalProdCount = 0;//숫자에 해당하는 제품이 있는지 체크
				
				while(stk1.hasMoreTokens()) {
					//체크
					if (stk1.nextToken().equals(prodId)) {
						equalProdCount = 1;
						break;
					}	
				}
				
				//1-1. 쿠키내에 해당 제품숫자가 존재하는 경우 -> 해당 제품을 삭제하고 쿠키를 새로 수정해서 주입
				if (equalProdCount == 1) {
					StringTokenizer stk2 = new StringTokenizer(seenList,"#");
					StringBuffer sb = new StringBuffer();
					
					while(stk2.hasMoreTokens()) {
						
						String prsToken = stk2.nextToken();
						
						if (!prsToken.equals(prodId)) {
							sb.append(prsToken);
							sb.append("#");
						}	
					}
					
					kc.modifyCookie(request, response, "seenList", sb.toString(),  60 * 60 * 24 * 7);
					
					//System.out.println(sb.toString());
					
					if (sb.toString().equals("")) return 2;
					else return 1;
					
				}
				//1-2. 쿠키내에 해당 제품숫자가 존재하지 않는 경우
				else {
					return -1;
				}
			} 
			//2.넘어온 숫자가 오롯이 제품숫자만을 가리키지 않는 경우 -> 즉 숫자형이 아닌경우
			else {
				//return -1;
				throw new Exception("try deleteMyPageProdSeen attack");
			}
			
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
	}
	
	//최근본 상품 목록에서 모든 상품 지워주기 -> 쿠키에서 제거
	@Override
	public int deleteMyPageAllProdSeen(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			KakaoCookie kc = new KakaoCookie();
			
			if (kc.getCookieInfo(request, "seenList") != null) {
				kc.modifyCookie(request, response, "seenList", "", 60 * 60 * 24 * 7);
			}
			
			return 1;
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
	}
	
	//내 활동 
	@Override
	public int getMyPageTrace(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			KakaoCookie kc = new KakaoCookie();

			kc.deleteCookie(request, response, "lastPage");//기존에 있는 마지막 페이지를 지워준다.
			kc.generateUrlCookie(response, "myPageMain.action?myPageNum=2", 60 * 60 * 24 * 7);// 마지막페이지
			
			//여기서 로그인을 했는지 한번 더 체크해준다.
			HttpSession session = request.getSession();
			UserDTO udto = (UserDTO)session.getAttribute("userinfo");
			
			
			if (udto == null) return -2;

			return 1;
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}

	}

	//장바구니
	@Override
	public int getMyPageBasket(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			KakaoCookie kc = new KakaoCookie();

			kc.deleteCookie(request, response, "lastPage");//기존에 있는 마지막 페이지를 지워준다.
			kc.generateUrlCookie(response, "myPageMain.action?myPageNum=3", 60 * 60 * 24 * 7);// 마지막페이지
			
			
			
			//request.setAttribute("myBassketSignal", "x533");//장바구니임을 확인하려는 로직 -> 푸터가 안뜨게 하기 위함
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			List<MyPageBasketDTO> mbdtoList;//마이페이지 - 장바구니 객체
			
			//1. 로그인을 안한 경우
			if (userInfo == null) {
				String basketList = (String) kc.getCookieInfo(request, "basketList");
				
				mbdtoList = dao.getMyPageBasketNoLogin(basketList);
				
			}
			//2. 로그인 한 경우
			else {
				int userSeq = userInfo.getUserSeq();
				
				mbdtoList = dao.getMyPageBasketLogin(userSeq);
			}
			
			JSONArray mbdtoJsonArr = new JSONArray();
			
			for (int i = 0; i < mbdtoList.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("prodId", mbdtoList.get(i).getProdId());
				
				if (mbdtoList.get(i).getDcYn().equals("Y")) {
					obj.put("prodPrice",Integer.parseInt(mbdtoList.get(i).getDcPrice().replace(",","")));
				} else {
					obj.put("prodPrice",Integer.parseInt(mbdtoList.get(i).getProdPrice().replace(",","")));
				}
				
				obj.put("buyCount", mbdtoList.get(i).getBuyCount());
				obj.put("checkYn", "N");
				
				mbdtoJsonArr.add(obj);
			}

			request.setAttribute("mbdtoJsonArr",mbdtoJsonArr);
			request.setAttribute("mbdtoList", mbdtoList);
			request.setAttribute("mbdtoListSize", mbdtoList.size());
			
			return 1;
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
		
		
	}
	
	//장바구니 특정 물품 삭제하기
	@Override
	public int deleteMyPageBasket(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			KakaoCookie kc = new KakaoCookie();
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			int productId = Integer.parseInt(request.getParameter("prodtId"));//진짜 번호를 넣어줘야한다.
			
			//1. 로그인이 안되어 있는 경우
			if (userInfo == null) {
				kc.modifyBasketCookie(request, response, productId);//장바구니 상품 제거 기능
				
				return 1;
			}
			//2. 로그인이 되어 있는 경우
			else {
				int userSeq = userInfo.getUserSeq();
				CommonDAO cdao = new CommonDAO();
				
				int result = cdao.setBasketProdt(userSeq,productId);
				
				if (result == 2) return 1;
				else return -1;
				
			}
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
		
		
	}
	
	//장바구니 특정 물품 여러개 삭제하기
	@Override
	public List<Integer> deleteMyPageBaskets(HttpServletRequest request, HttpServletResponse response) {

		try {
			
			KakaoCookie kc = new KakaoCookie();
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			String productIds = request.getParameter("prodtIds");
			
			//1. 로그인이 안되어 있는 경우
			if (userInfo == null) {
				
				return kc.modifyBasketCookies(request, response, productIds);				
			}
			//2. 로그인이 되어 있는 경우
			else {
				int userSeq = userInfo.getUserSeq();
				int deleteResult = dao.modifyBasketCookiesLogin(userSeq, productIds);
				
				if (deleteResult == 1) {
					StringTokenizer stk = new StringTokenizer(productIds,"#");
					List<Integer> resultList = new ArrayList<Integer>();
					
					while(stk.hasMoreTokens()) {
						resultList.add(Integer.parseInt(stk.nextToken()));
					}
					
					return resultList;
					
				} else {
					return null;
				}
					
			}
			
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return null;
		}
	}
	
	
	//마이페이지 주문내역
	@Override
	public int getMyPageOrderList(HttpServletRequest request,HttpServletResponse response, ErrorAlarm ea) {
		
		try {
			KakaoCookie kc = new KakaoCookie();

			kc.deleteCookie(request, response, "lastPage");//기존에 있는 마지막 페이지를 지워준다.
			kc.generateUrlCookie(response, "myPageMain.action?myPageNum=4", 60 * 60 * 24 * 7);// 마지막페이지
			
			
			//여기서 로그인을 했는지 한번 더 체크해준다.
			HttpSession session = request.getSession();
			UserDTO udto = (UserDTO)session.getAttribute("userinfo");
			
			
			if (udto == null) return -2;
			else {
				
				List<String> mpListDate = dao.getMyPageDtoDateList(udto.getUserSeq());//주문 물품 객체
				List<MyPageOrderDTO> mpList = dao.getMyPageDtoList(udto.getUserSeq());//주문 물품 객체
				
				request.setAttribute("mpListDate",mpListDate);
				request.setAttribute("mpList",mpList);
				
				return 1;
			}

			
			
		} catch(Exception e) {
			ea.errorDbAndMail();
			return -1;
		}

	}
	
	//주문히스토리 상세 내역
	@Override
	public int getProdtOrderHist(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		try {
			HttpSession session = request.getSession();
			UserDTO udto = (UserDTO)session.getAttribute("userinfo");
			
			if (udto == null) return -1;
			
			//1. 주문번호
			String prodtOrderSeq = request.getParameter("prodtOrderSeq");//주문번호
			int userSeq = udto.getUserSeq();
			
			//2. 주문처리 단계(단수)
			String orderStep = dao.getMyPageOrderStep(prodtOrderSeq);
			
			//MyPageOrderProdtDTO
			//3. 주문제품 (복수)
			//	- 제품 고유 번호
			//	- 제품 이름 (복수)
			//	- 제품 가격 (복수)
			//	- 제품 주문 갯수 (복수)
			List<MyPageOrderProdtDTO> prodtsDetails = dao.getMyPageOrderProdts(prodtOrderSeq,userSeq);
			
			// MyPageOrderPayDTO
			//4. 결제정보 (단수)
			//	- 결제수단 (단수)
			//	- 결제일시 (단수)
			//	- 상품가격 (단수) => 모든 제품의 가격을 더한거라고 생각하면 된다.
			//	- 배송비 (단수)
			//	- 사용 포인트 (단수)
			//	- 기프트카드 (단수)
			//	- 최종 결제금액 (단수)
			
			
			
			//MyPageOrderPayUserDTO
			//5. 배송지 정보 (단수)
			//	- 주문고객 이름
			//	- 주문고객 핸드폰 번호
			//	- 주문고객 이메일 주소
			//	- 받는분 주소
			
			
			
			request.setAttribute("orderProdtLists", prodtsDetails);//주문제품 내역에 존재하는 물품들의 정보
			
			
			return 1;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
	
	
	
	
}

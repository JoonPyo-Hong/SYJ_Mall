package com.test.SYJ_Mall.myPages;

import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

			//System.out.println("? : " + request.getParameter("myPageNum"));	
			
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

	// 쿠키에 존재하는 나의 상품 조회내역 가져오기
	@Override
	public String getCookieSeen(HttpServletRequest request, HttpServletResponse response) {

		KakaoCookie kc = new KakaoCookie();

		String seenList = (String) kc.getCookieInfo(request, "seenList");

		// 쿠키내에  내가 조회한 상품내역이 없는경우
		if (seenList == null) {

			kc.generateCookie(response, "seenList", "", 60 * 60 * 24 * 7);// 쿠키생성 7 일동안 유지
			String newBasketList = (String) kc.getCookieInfo(request, "seenList");

			return newBasketList;

		} else {
			// 쿠키내에  내가 조회한 상품내역이 있는경우

			if (seenList.length() != 0) {
				seenList = seenList.substring(0, seenList.length() - 1);
				return seenList;// 기존쿠키 넘기기
			} else {// seenList 에 지금 아무런 정보가 존재하지 않는경우
				return seenList;// 기존쿠키 넘기기
			}
		}
	}
	
	
	//마이페이지 - 최근 본 상품
	@Override
	public int getMyPageSeen(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String seenList = getCookieSeen(request,response);
		
			//System.out.println(seenList);
			
			//쿠키에 해당하는 조회상품목록 대상인 상품들을 가져와준다.
			List<MyPageSeenDTO> mpsList = dao.getMyPageSeenList(seenList);
			KakaoCookie kc = new KakaoCookie();

			kc.deleteCookie(request, response, "lastPage");//기존에 있는 마지막 페이지를 지워준다.
			kc.generateCookie(response, "lastPage", "myPageMain.action?myPageNum=1");// 마지막페이지
			
			request.setAttribute("mpsList", mpsList);
			
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
	public int deleteMyPageProdSeen(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			StringFormatClass sfc = new StringFormatClass();
			String prodId = request.getParameter("prodId");
			
			//1.넘어온 숫자가 오롯이 제품숫자를 가리키는 경우
			if (sfc.isStringDigit(prodId)) {
				
				//제품에 해당하는 숫자를 쿠키내역에서 지워줘야한다.
				String seenList = getCookieSeen(request,response);//쿠키내역에 해당되는 숫자더미
				StringTokenizer stk1 = new StringTokenizer(seenList,"#");
				int equalProdCount = 0;//숫자에 해당하는 제품이 있는지 체크
				KakaoCookie kc = new KakaoCookie();

				
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
			kc.generateCookie(response, "lastPage", "myPageMain.action?myPageNum=2");// 마지막페이지
			
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
			kc.generateCookie(response, "lastPage", "myPageMain.action?myPageNum=3");// 마지막페이지
			
			
			request.setAttribute("myBassketSignal", "x533");//장바구니임을 확인하려는 로직 -> 푸터가 안뜨게 하기 위함
			
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
				kc.modifyBasketCookie(request, response, productId);
				
				return 1;
			}
			//2. 로그인이 되어 있는 경우
			else {
				
				return -2;
			}
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
		
		
	}
}

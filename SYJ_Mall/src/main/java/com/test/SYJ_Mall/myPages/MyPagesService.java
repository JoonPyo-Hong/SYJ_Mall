package com.test.SYJ_Mall.myPages;

import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;

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
		
		
		
		
		return 0;
	}
}

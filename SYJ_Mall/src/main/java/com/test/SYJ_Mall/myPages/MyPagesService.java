package com.test.SYJ_Mall.myPages;

import java.util.List;

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
}

package com.test.SYJ_Mall.charProdt;

import java.util.Arrays;
import java.util.List;

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
public class CharProdtService implements ICharProdtService{
	
	@Autowired
	private ICharProdtDAO dao;
	private CommonDAO cdao;
	
	//캐릭터별 상품 시작.
	@Override
	public int setCharProdtStart(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");//유저객체
			String charSeq = request.getParameter("charSeq");//어떤 캐릭터인지 정해준다.
			String sortedOption = request.getParameter("sortedOption");
			StringFormatClass sfc = new StringFormatClass();
			
			//캐릭터 번호 지정
			if ((charSeq == null) || (!(sfc.isStringDigit(charSeq) && sfc.stringToDigitTerm(charSeq,1,15)))) {
				charSeq = "1";//이상한값이 넘어오면 그냥 0으로 초기화해줌
			}
			
			//정렬옵션 지정
			if ((sortedOption == null) || (!(sfc.isStringDigit(sortedOption) && sfc.stringToDigitTerm(sortedOption,1,4)))) {
				sortedOption = "1";
			}
			
			List<CharHeadTitleDTO> headDto = dao.getCharHeadData(charSeq);//상단 캐릭터이름과 사진 불러오는곳
			String charHeadName = headDto.get(0).getCharName();//캐릭터 이름
			String charHeadPicUrl = headDto.get(0).getCharImg();//캐릭터 사진
			int charHeadCount = headDto.get(0).getCharCount();//캐릭터 품목 갯수
			int pageAjaxCount = (int) Math.ceil(charHeadCount / 8.0);// 6개씩 끊어서 출력해주기 -> 페이지가 몇개 나오는지 계산
			int paging = 1;
			
			
			// 마지막 페이지 정보 쿠키에 넘기는 작업
			KakaoCookie ck = new KakaoCookie();
			ck.generateCookie(response, "lastPage", "/SYJ_Mall/charAtProdtStart.action?charSeq=" + charSeq);// 마지막페이지
			
			List<CharProdtDTO> charProdts;
			
			if (userInfo == null) {
				// 로그인 되지 않은 경우
				String basketList = (String)ck.getCookieInfo(request, "basketList");// 12#45# 이와 같은형식의 상품번호정보가 존재함
				charProdts = dao.getCharProdts(charSeq,sortedOption,paging,basketList);
				
			} else {
				// 로그인이 된 경우 -- 아래는 임시
				int userSeq = userInfo.getUserSeq();
				charProdts = dao.getCharProdtsLogin(charSeq,sortedOption,paging,userSeq);
			}
			
			request.setAttribute("charSeq", charSeq);
			request.setAttribute("charHeadName", charHeadName);
			request.setAttribute("charHeadPicUrl", charHeadPicUrl);
			request.setAttribute("charHeadCount", charHeadCount);
			request.setAttribute("sortedOption", sortedOption);
			request.setAttribute("pageAjaxCount", pageAjaxCount);
			request.setAttribute("paging", paging);
			request.setAttribute("charProdts", charProdts);
			
			return 1;
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
	}
	
	//캐릭터별 상품 무한스크롤
	@Override
	public List<CharProdtDTO> getCharProdtAjax(HttpServletRequest request) {
		
		try {
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");//유저객체
			String charSeq = request.getParameter("charSeq");//어떤 캐릭터인지 정해준다.
			String sortedOption = request.getParameter("sortedOption");
			int paging = Integer.parseInt(request.getParameter("paging"));
			
			if (userInfo == null) {
			//로그인 되지 않은 경우	
				KakaoCookie ck = new KakaoCookie();
				String basketList = (String)ck.getCookieInfo(request, "basketList");// 12#45# 이와 같은형식의 상품번호정보가 존재함
				
				return dao.getCharProdts(charSeq,sortedOption,paging,basketList);
				
			} else {
			//로그인 된 경우-->아래는 임시로 해놓음
				KakaoCookie ck = new KakaoCookie();
				String basketList = (String)ck.getCookieInfo(request, "basketList");// 12#45# 이와 같은형식의 상품번호정보가 존재함
				
				return dao.getCharProdts(charSeq,sortedOption,paging,basketList);
			}
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return null;
		}
		
		
		
	}
	//상품 장바구니 관련 로직
	@Override
	public int charProdtBasketItem(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			int prodtId = Integer.parseInt(request.getParameter("productId"));
			HttpSession session = request.getSession();// 로그인 상태인지 아닌지 체크해준다.

			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");

			// 1. 로그인 되어 있지 않은 경우
			if (userInfo == null) {
				KakaoCookie kc = new KakaoCookie();
				String basketList = (String) kc.getCookieInfo(request, "basketList");
				
				// 이미 장바구니에 담긴 번호인지 체크해준다.--> null check 해줘야한다.
				String[] basketLists;
				
				if (basketList == null) basketLists = new String[0];
				else basketLists = basketList.split("#");
				
				
				// 장바구니 쿠키 객체에서 해당물품번호가 있는지 찾아준다. 없으면 -1을 리턴할것
				int index = Arrays.asList(basketLists).indexOf(Integer.toString(prodtId));

				// 해당 물품이 없는 경우 -> 상품 쿠키 객체에 물품 아이디를 추가해준다.
				if (index == -1) {
					
					StringBuffer sb = new StringBuffer();
					
					if (basketList != null) sb.append(basketList);
					
					sb.append(Integer.toString(prodtId));
					sb.append("#");

					kc.modifyCookie(request, response, "basketList", sb.toString(), 60 * 60 * 24 * 7);
					
					return 1;// 장바구니 추가
				} else {
					// 해당 물품이 존재하는경우 -> 장바구니에서 빼주기
					StringBuffer sb = new StringBuffer();

					for (int i = 0; i < basketLists.length; i++) {
						// 빼려고하는 상품 번호는 그냥 안넣으면 된다.
						if (!basketLists[i].equals(Integer.toString(prodtId))) {
							sb.append(basketLists[i]);
							sb.append("#");
						}
					}

					kc.modifyCookie(request, response, "basketList", sb.toString(), 60 * 60 * 24 * 7);

					return 2;// 장바구니 해제
				}
			}
			// 2. 로그인 되어 있는 경우
			else {
				int userSeq = userInfo.getUserSeq();// 유저 고유번호
				cdao = new CommonDAO();
				int result = cdao.setBasketProdt(userSeq, prodtId);
				cdao.close();

				System.out.println(result);
				return result;

			}

		} catch (Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -100;
		}
	}

	
	
	
	
}

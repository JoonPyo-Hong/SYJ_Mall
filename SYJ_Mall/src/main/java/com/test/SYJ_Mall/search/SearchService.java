package com.test.SYJ_Mall.search;

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
import com.test.SYJ_Mall.login.UserDTO;

@Service
public class SearchService implements ISearchService {

	@Autowired
	ISearchDAO dao;
	private CommonDAO cdao;

	// 단어를 포함하는 상품정보 가져와주기
	@Override
	public List<SearchNameDTO> getProdLittelInfo(String inputWord) {

		return dao.getProdInfo(inputWord);
	}

	// 해당되는 물품의 정보를 가져와준다.
	@Override
	public int getSearchResultProd(HttpServletRequest request, HttpServletResponse response) {

		// 로그인이 된 경우와 되지 않은 경우로 나누어서 로직을 설계해줘야 한다.
		try {

			String inputName = request.getParameter("inputName");// 넘겨준 단어 -> 검색에 적은 단어
			String productSeq = request.getParameter("productSeq");// 넘겨준 단어 -> 검색에 적은 단어에 매치되는 상품번호(엔터를 안치고 온 경우)
			String sortedOption = request.getParameter("sortedOption");// 정렬옵션
			String sortedCharOption = request.getParameter("sortedCharOption");//캐릭터 필터링 옵션
			
			//필터링 옵션
			if (sortedOption == null) {
				request.setAttribute("sortedOption", "1");
				sortedOption = "1";	
			}
			
			//캐릭터 필터링 옵션
			if (sortedCharOption == null) {
				request.setAttribute("sortedCharOption", "0");
				sortedCharOption = "0";	
			}
			
			
			HttpSession session = request.getSession();
			UserDTO userDto = (UserDTO) session.getAttribute("userinfo");// 유저 정보 객체

			List<SearchProductDTO> searchProdto;// 검색 상품정보 객체 리스트

			int totalProdCount = dao.getSearchResultProdsCount(inputName, productSeq, sortedCharOption);// 검색한 물품의 총 갯수 출력
			int pageAjaxCount = (int) Math.ceil(totalProdCount / 6.0);// 6개씩 끊어서 출력해주기
			
			
			KakaoCookie kc = new KakaoCookie();

			if (userDto == null) {
				// 유저 정보가 없는경우 -> 로그인을 하지 않은 경우
				// 쿠키객체를 가져와서 장바구니에 담은 정보를 가져와준다.
				String basketList = (String) kc.getCookieInfo(request, "basketList");// 12#45# 이와 같은형식의 상품번호정보가 존재함

				// System.out.println("basketList : " + basketList);
				searchProdto = dao.getSearchResultProds(inputName, productSeq, 1, basketList, sortedOption,sortedCharOption);// 처음데이터를
																											// 가져오는 것이므로
																											// 1 을 넣어준다.
																											// => 6개만
																											// 가져와준다.
			} else {
				// 유저 정보가 있는 경우 -> 로그인을 한 경우
				searchProdto = dao.getSearchResultProdsLogon(userDto.getUserSeq(), inputName, productSeq, 1, sortedOption);
			}

			// 검색어로 넘긴 단어 -> 상단에 어떤단어로 검색했는지 보여주기 위함.
			// 1. 단어로만 넘긴경우
			if (productSeq == null) {

				request.setAttribute("userinputName", inputName);
				
				
				kc.deleteCookie(request, response, "lastPage");//기존에 있는 마지막 페이지를 지워준다.
				kc.generateCookie(response, "lastPage", "searchresult.action?inputName=" + inputName + "&sortedOption=" + sortedOption + "&sortedCharOption=" + sortedCharOption);// 마지막페이지
				
			} else {
				// 2. 클릭해서 넘긴 경우

				request.setAttribute("userinputName", searchProdto.get(0).getProdNm());// 넘겨준 단어 -> 검색에 적은 단어에 매치되는 상품번호(엔터를 안치고 온 경우) 화면에 표시해줄 단어
				kc.deleteCookie(request, response, "lastPage");//기존에 있는 마지막 페이지를 지워준다.
				kc.generateCookie(response, "lastPage", "searchresult.action?inputName=" + inputName);// 마지막페이지
			}


			request.setAttribute("sortedOption", sortedOption);// 상품이 총 몇개있는지 넘겨줄 것이다.
			request.setAttribute("sortedCharOption", sortedCharOption);// 상품이 총 몇개있는지 넘겨줄 것이다.
			request.setAttribute("prodtCount", totalProdCount);// 상품이 총 몇개있는지 넘겨줄 것이다.
			request.setAttribute("searchProdto", searchProdto);
			request.setAttribute("pageAjaxCount", pageAjaxCount);// 총몇번의 스크롤페이지 생성이 되는지 체크

			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	// 마지막 접속 페이지 쿠키 정보 조회
	@Override
	public Object instanceCookie(HttpServletRequest request, HttpServletResponse response, String cookieName) {

		KakaoCookie ck = new KakaoCookie();
		Object result = ck.getCookieInfo(request, cookieName);
		ck.deleteCookie(request, response, cookieName);

		return result;
	}

	// 메인페이지 보내주기
	@Override
	public void goMain(HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userinfo");
		request.setAttribute("selected", "today");

		int seq = 0;

		if (dto == null) {
			seq = 0;
		} else {
			seq = dto.getUserSeq();
		}
		request.setAttribute("seq", seq);

	}

	// 무한스크롤을 통해 가져올 물품 리스트 -> 로그인 하지 않은 경우
	@Override
	public List<SearchProductDTO> getAjaxProdInfo(String inputWord, int paging, HttpServletRequest request,
			String sortedOption,String sortedCharOption) {

		// System.out.println("??? : " + paging);
		KakaoCookie kc = new KakaoCookie();
		String basketList = (String) kc.getCookieInfo(request, "basketList");// 12#45# 이와 같은형식의 상품번호정보가 존재함

		List<SearchProductDTO> searchProdtoAjax = dao.getSearchResultProds(inputWord, null, paging, basketList,
				sortedOption,sortedCharOption);// 6n 개를 가져와준다.

		return searchProdtoAjax;
	}

	// 무한스크롤을 통해 가져올 물품 리스트 -> 로그인 한 경우
	@Override
	public List<SearchProductDTO> getAjaxProdInfoLogOn(int userSeq, String inputWord, int paging, String sortedOption) {

		return dao.getSearchResultProdsLogon(userSeq, inputWord, null, paging, sortedOption);
	}

	// 상품을 장바구니 목록에 넣어주는 경우
	@Override
	public int searchBasketItem(HttpServletRequest request, HttpServletResponse response) {

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
				
				// 이미 장바구니에 담긴 번호인지 체크해준다.
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

	// ***알림 상품 기능
	@Override
	public int searchProdtAlarm(HttpServletRequest request) {

		try {

			int productId = Integer.parseInt(request.getParameter("productId"));// 상품번호
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");

			// --- 알람 서비스는 로그인이 되어야만 진행이 될수 있는 서비스이다.

			// 1. 로그인이 안되어있는 경우
			if (userInfo == null) {

				return -2;// 로그인이 되어있지 않으면 알람서비스를 이용할 수 없음. -> 로그인 유도
			}
			// 2. 로그인이 되어있는 경우
			else {
				int userSeq = userInfo.getUserSeq();// 유저 고유번호
				cdao = new CommonDAO();
				int result = cdao.setAlarmProdt(userSeq, productId);
				cdao.close();

				return result;
			}

		} catch (Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}

	}

	// 마지막 페이지 인덱싱 작업 -> 필요없어보임.
	@Override
	public int lastPageIndexing(HttpServletRequest request, HttpServletResponse response) {

		try {

			String lastPage = (String) instanceCookie(request, response, "lastPage");

			if (lastPage == null) {
				request.setAttribute("lastPage", "/SYJ_Mall/main.action");
			} else {

				if (lastPage.indexOf(".action?") == -1) {
					request.setAttribute("lastPage", "/SYJ_Mall/" + lastPage + ".action");
				} else {
					request.setAttribute("lastPage", "/SYJ_Mall/" + lastPage);
				}
				// 마지막 페이지로 이동
			}

			return 1;

		} catch (Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
	}

}

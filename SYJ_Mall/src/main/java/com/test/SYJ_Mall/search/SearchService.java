package com.test.SYJ_Mall.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.KakaoCookie;
import com.test.SYJ_Mall.login.UserDTO;

@Service
public class SearchService implements ISearchService {

	@Autowired
	ISearchDAO dao;

	// 단어를 포함하는 상품정보 가져와주기
	@Override
	public List<SearchNameDTO> getProdLittelInfo(String inputWord) {

		return dao.getProdInfo(inputWord);
	}

	// 해당되는 물품의 정보를 가져와준다.
	@Override
	public int getSearchResultProd(HttpServletRequest request) {
		
		//로그인이 된 경우와 되지 않은 경우로 나누어서 로직을 설계해줘야 한다.
		try {
			
			String inputName = request.getParameter("inputName");// 넘겨준 단어 -> 검색에 적은 단어(엔터를 안치고 온 경우)
			String productSeq = request.getParameter("productSeq");// 넘겨준 단어 -> 검색에 적은 단어에 매치되는 상품번호(엔터를 안치고 온 경우)
			
			HttpSession session = request.getSession();
			UserDTO userDto = (UserDTO)session.getAttribute("userinfo");//유저 정보 객체
			
			List<SearchProductDTO> searchProdto;//검색 상품정보 객체 리스트
			
			int totalProdCount = dao.getSearchResultProdsCount(inputName,productSeq);//검색한 물품의 총 갯수 출력
			int pageAjaxCount = (int)Math.ceil(totalProdCount / 6.0);//6개씩 끊어서 출력해주기
			
			if (userDto == null) {
			//유저 정보가 없는경우 -> 로그인을 하지 않은 경우
				//쿠키객체를 가져와서 장바구니에 담은 정보를 가져와준다.
				KakaoCookie kc = new KakaoCookie();
				String basketList = (String)kc.getCookieInfo(request, "basketList");//12#45# 이와 같은형식의 상품번호정보가 존재함
			
				//System.out.println("basketList : " + basketList);
				searchProdto = dao.getSearchResultProds(inputName,productSeq,1,basketList);//처음데이터를 가져오는 것이므로 1 을 넣어준다. => 6개만 가져와준다.
			} 
			else {
			//유저 정보가 있는 경우 -> 로그인을 한 경우
				searchProdto = dao.getSearchResultProdsLogon(userDto.getUserSeq(),inputName,productSeq,1);
				
			}
			
			
			//검색어로 넘긴 단어 -> 상단에 어떤단어로 검색했는지 보여주기 위함.
			//1. 물품번호를 클릭해서 넘긴경우
			if (productSeq == null) {
				request.setAttribute("userinputName", inputName);
			}
			else {
			//2. 그냥 단어로 넘긴경우
				request.setAttribute("userinputName", searchProdto.get(0).getProdNm());//넘겨준 단어 -> 검색에 적은 단어에 매치되는 상품번호(엔터를 안치고 온 경우) 화면에 표시해줄 단어
			}
			
			request.setAttribute("searchProdCount", totalProdCount);//상품이 총 몇개있는지 넘겨줄 것이다.
			request.setAttribute("searchProdto", searchProdto);
			request.setAttribute("pageAjaxCount", pageAjaxCount);//총몇번의 스크롤페이지 생성이 되는지 체크
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	//마지막 접속 페이지 쿠키 정보 조회
	@Override
	public Object instanceCookie(HttpServletRequest request, HttpServletResponse response, String cookieName) {
		
		KakaoCookie ck = new KakaoCookie();
		Object result = ck.getCookieInfo(request, cookieName);
		ck.deleteCookie(request,response,cookieName);
		
		return result;
	}
	
	//메인페이지 보내주기
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
	
	//무한스크롤을 통해 가져올 물품 리스트 -> 로그인 하지 않은 경우
	@Override
	public List<SearchProductDTO> getAjaxProdInfo(String inputWord, int paging,HttpServletRequest request) {
		
		//System.out.println("??? : " + paging);
		KakaoCookie kc = new KakaoCookie();
		String basketList = (String)kc.getCookieInfo(request, "basketList");//12#45# 이와 같은형식의 상품번호정보가 존재함
		
		List<SearchProductDTO> searchProdtoAjax = dao.getSearchResultProds(inputWord,null,paging,basketList);//6n 개를 가져와준다.
		
		return searchProdtoAjax;
	}
	
	//무한스크롤을 통해 가져올 물품 리스트 -> 로그인 한 경우
	@Override
	public List<SearchProductDTO> getAjaxProdInfoLogOn(int userSeq, String inputWord, int paging) {
		
		return dao.getSearchResultProdsLogon(userSeq,inputWord,null,paging);
	}
	
	
	//프론트에서 글자 이쁘게 처리
	
}

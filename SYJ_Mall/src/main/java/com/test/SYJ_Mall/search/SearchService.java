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
		
		try {
			
			String inputName = request.getParameter("inputName");// 넘겨준 단어 -> 검색에 적은 단어(엔터를 안치고 온 경우)
			String productSeq = request.getParameter("productSeq");// 넘겨준 단어 -> 검색에 적은 단어에 매치되는 상품번호(엔터를 안치고 온 경우)
			
			System.out.println(inputName);
			System.out.println(productSeq);
			
			
			List<SearchProductDTO> searchProdto = dao.getSearchResultProds(inputName,productSeq);
			
			int prodCount = searchProdto.size();//찾으려고 하는 물품의 갯수

			for (SearchProductDTO dto : searchProdto) {
				System.out.println("=================");
				System.out.println(dto.getDiscRate());
				System.out.println(dto.getProdCnt());
				System.out.println(dto.getProdId());
				System.out.println(dto.getProdNm());
				System.out.println(dto.getProdPrice());
				System.out.println(dto.getPicUrl());
			}
			
			//검색어로 넘긴 단어
			//1. 물품번호를 클릭해서 넘긴경우
			if (productSeq == null) {
				request.setAttribute("userinputName", inputName);
			}
			else {
			//2. 그냥 단어로 넘긴경우
				request.setAttribute("userinputName", searchProdto.get(0).getProdNm());
			}
			
			System.out.println("*******************");
			System.out.println(prodCount);
			
			request.setAttribute("searchProdCount", prodCount);
			request.setAttribute("searchProdto", searchProdto);
			
			
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
	
	
}

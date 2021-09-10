package com.test.SYJ_Mall.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
			//String fullKeyword = request.getParameter("search_input_content");// 넘겨준 단어 -> fulltext(엔터를 치고 온 경우) 필요가 없음
			
			System.out.println(inputName);
			System.out.println(productSeq);
			//System.out.println(fullKeyword);
			
			List<SearchProductDTO> searchProdto = dao.getSearchResultProds(inputName,productSeq);
			
			for (SearchProductDTO dto : searchProdto) {
				System.out.println("=================");
				System.out.println(dto.getDiscRate());
				System.out.println(dto.getProdCnt());
				System.out.println(dto.getProdId());
				System.out.println(dto.getProdNm());
				System.out.println(dto.getProdPrice());
				System.out.println(dto.getPicUrl());
			}
			
			
			//request.setAttribute("searchProdto", searchProdto);
			
			
			
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}

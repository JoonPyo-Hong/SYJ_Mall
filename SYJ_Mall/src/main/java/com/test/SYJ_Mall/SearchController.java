package com.test.SYJ_Mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.search.ISearchService;
import com.test.SYJ_Mall.search.SearchNameDTO;

/**
 * 검색엔진 컨트롤러
 * @author shin
 *
 */
@Controller
public class SearchController {
	@Autowired
	private ISearchService service;
	
	//검색어 치면 해당하는 상품 보내주기
	@RequestMapping(value = "/searchword.action", method = { RequestMethod.GET})
	@ResponseBody
	public List<SearchNameDTO> searchword(HttpServletRequest request, HttpServletResponse response) {
		
		String inputWord = request.getParameter("inputWord");//넘겨준 단어

		//넘겨줄 단어를 가지고 해당단어를 포함하는 품목을 가져온다.
		try {
			List<SearchNameDTO> searchProdList = service.getProdLittelInfo(inputWord);
			
			return searchProdList;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	//검색어 결과에 나타나는 물품리스트 페이지 보여주기
	@RequestMapping(value = "/searchresult.action", method = { RequestMethod.GET})
	public String searchresult(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			System.out.println("오는겨여?");
			
			String inputName = request.getParameter("inputName");//넘겨준 단어 -> 검색에 적은 단어
			String productSeq = request.getParameter("productSeq");//넘겨준 단어 -> 검색에 적은 단어에 매치되는 상품번호
			
			//그냥 엔터로 쳐서 넘긴 경우
			if (productSeq == null) {
				
			} else {
			//직접 클릭한 경우
				
			}
			
			return "/search/searchMain";
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	
}

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
import com.test.SYJ_Mall.search.SearchProductDTO;

/**
 * 검색엔진 컨트롤러
 * 
 * @author shin
 *
 */
@Controller
public class SearchController {
	@Autowired
	private ISearchService service;

	// 검색어 치면 해당하는 상품 보내주기 -> ajax 처리
	@RequestMapping(value = "/searchword.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<SearchNameDTO> searchword(HttpServletRequest request, HttpServletResponse response) {

		String inputWord = request.getParameter("inputWord");// 넘겨준 단어

		// 넘겨줄 단어를 가지고 해당단어를 포함하는 품목을 가져온다.
		try {
			
			List<SearchNameDTO> searchProdList = service.getProdLittelInfo(inputWord);

			return searchProdList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 검색어 결과에 나타나는 물품리스트 페이지 보여주기
	@RequestMapping(value = "/searchresult.action", method = { RequestMethod.GET })
	public String searchresult(HttpServletRequest request, HttpServletResponse response) {

		// 결과 -> jsp 로 옮길지 말지 정해준다.
		int result = service.getSearchResultProd(request);

		if (result == 1) return "/search/searchMain";
		else return null;

	}
	
	
	// 검색어 결과에 나타나는 물품리스트 페이지 보여주기 -> 무한스크롤
	@RequestMapping(value = "/searchresultscroll.action", method = { RequestMethod.POST })
	@ResponseBody
	public List<SearchProductDTO> searchresultscroll(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String inputWord = request.getParameter("inputWord");// 넘겨준 단어
			int paging = Integer.parseInt(request.getParameter("paging"));//페이징 변수
			
			System.out.println("inputWord : " + inputWord);
			System.out.println("paging : " + paging);
			
			List<SearchProductDTO> prodto = service.getAjaxProdInfo(inputWord,paging);//무한스크롤을 통하여 가져올 물품들
			
			System.out.println("prodtosize : " + prodto.size());
			
			return prodto;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	//검색하고 -> 뒤로가기처리
	@RequestMapping(value = "/searchback.action", method = { RequestMethod.GET })
	public String searchback(HttpServletRequest request, HttpServletResponse response) {

		//어떤페이지를 마지막으로 방문했는지 쿠키정보를 조회해 봐야한다.
		String lastPage = (String)service.instanceCookie(request,response,"lastPage");
		
		if (lastPage == null) {
			
			service.goMain(request);
			
			return "/tiles/mainStart.topping";//메인페이지로 이동
			
		} else {
			//마지막 페이지로 이동
			return "forward:/" + lastPage + ".action";
		}
	}
	
	
	//검색하고 -> 메인페이지로 보내주기
	@RequestMapping(value = "/searchbackmain.action", method = { RequestMethod.GET })
	public String searchbackmain(HttpServletRequest request, HttpServletResponse response) {

		//어떤페이지를 마지막으로 방문했는지 쿠키정보를 조회해 봐야한다.
		Object lastPage = service.instanceCookie(request,response,"lastPage");
	
		service.goMain(request);
			
		return "/tiles/mainStart.topping";//메인페이지로 이동
		
	}

}

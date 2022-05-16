package com.test.SYJ_Mall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.KakaoCookie;
import com.common.utill.Performance;
import com.test.SYJ_Mall.login.UserDTO;
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

	// 검색어 누르는순간 처리 -> 검색어 치면 해당하는 상품 보내주기 -> ajax 처리
	@RequestMapping(value = "/searchStart.action", method = { RequestMethod.GET })
	public String searchStart(HttpServletRequest request, HttpServletResponse response) {

		int lastPageIndex = service.lastPageIndexing(request,response);
		
		if (lastPageIndex == 1) return "/search/searchStart";
		else return "/testwaiting/kakaoerror";
	}

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

	// 검색어 결과에 나타나는 물품리스트 페이지 보여주기 -> 첫번째로 가져온 경우
	@RequestMapping(value = "/searchresult.action", method = { RequestMethod.GET })
	public String searchresult(HttpServletRequest request, HttpServletResponse response) {
		//Performance pf = new Performance();
		// 결과 -> jsp 로 옮길지 말지 정해준다.
		int result = service.getSearchResultProd(request, response);
		//pf.getElapseTimeMs();
		if (result == 1)
			return "/semitiles/searchResult.layout";
		else
			return null;

	}

	// 검색어 결과에 나타나는 물품리스트 페이지 보여주기 -> 무한스크롤 즉 두번째 이상부터 가져오는 경우
	@RequestMapping(value = "/searchresultscroll.action", method = { RequestMethod.GET })
	@ResponseBody
	public List<SearchProductDTO> searchresultscroll(HttpServletRequest request, HttpServletResponse response) {

		try {
			// 로그인정보 존재하는 경우랑 존재하지 않는경우로 나누어서 정보 가져와줘야한다.
			HttpSession session = request.getSession();
			UserDTO uDto = (UserDTO) session.getAttribute("userinfo");

			String inputWord = request.getParameter("inputWord");// 넘겨준 단어
			int paging = Integer.parseInt(request.getParameter("paging"));// 페이징 변수
			String sortedOption = request.getParameter("sortedOption");// 정렬필터링 옵션
			String sortedCharOption = request.getParameter("sortedCharOption");//캐릭터 필터링 옵션
			
			//System.out.println("sortedCharOption : " + sortedCharOption);
			//System.out.println("paging : " + paging);
			//System.out.println("inputWord : " + inputWord);

			List<SearchProductDTO> prodto;// 무한스크롤을 통하여 가져올 물품들

			if (uDto == null) {
				// 로그인 하지 않은 경우
				prodto = service.getAjaxProdInfo(inputWord, paging, request, sortedOption,sortedCharOption);
			} else {
				// 로그인 한 경우
				prodto = service.getAjaxProdInfoLogOn(uDto.getUserSeq(), inputWord, paging, sortedOption);
			}


			// System.out.println("inputWord : " + inputWord);
			// System.out.println("paging : " + paging);

			return prodto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 검색하고 -> 뒤로가기처리
	@RequestMapping(value = "/searchback.action", method = { RequestMethod.GET })
	public String searchback(HttpServletRequest request, HttpServletResponse response,KakaoCookie kc) {

		// 어떤페이지를 마지막으로 방문했는지 쿠키정보를 조회해 봐야한다.
		String lastPage = (String) service.instanceCookie(request, response, kc);
		
		if (lastPage == null) {

			service.goMain(request);

			return "/tiles/mainStart.layout";// 메인페이지로 이동

		} else {
			// 마지막 페이지로 이동
			return "forward:/" + lastPage + ".action";
		}
	}

	// 검색하고 -> 메인페이지로 보내주기
	@RequestMapping(value = "/searchbackmain.action", method = { RequestMethod.GET })
	public String searchbackmain(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc) {

		// 어떤페이지를 마지막으로 방문했는지 쿠키정보를 조회해 봐야한다. --> 애를 왜 넣어주는거지?
		Object lastPage = service.instanceCookie(request, response, kc);
		
		service.goMain(request);

		return "/tiles/mainStart.layout";// 메인페이지로 이동

	}

	// ajax 처리 -> 회원상품 장바구니에 처리 관련
	@RequestMapping(value = "/searchItemBasketSet.action", method = { RequestMethod.GET })
	@ResponseBody
	public int searchItemBasketInput(HttpServletRequest request, HttpServletResponse response) {

		return service.searchBasketItem(request, response);
		
	}

	// ajax 처리 -> 상품 알람 관련
	@RequestMapping(value = "/searchItemAlarm.action", method = { RequestMethod.GET })
	@ResponseBody
	public int searchItemAlarm(HttpServletRequest request, HttpServletResponse response) {

		return service.searchProdtAlarm(request);

	}

}

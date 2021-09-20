package com.test.SYJ_Mall.search;

import java.util.Arrays;
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
	public int getSearchResultProd(HttpServletRequest request,HttpServletResponse response) {
		
		//로그인이 된 경우와 되지 않은 경우로 나누어서 로직을 설계해줘야 한다.
		try {
			
			String inputName = request.getParameter("inputName");// 넘겨준 단어 -> 검색에 적은 단어(엔터를 안치고 온 경우)
			String productSeq = request.getParameter("productSeq");// 넘겨준 단어 -> 검색에 적은 단어에 매치되는 상품번호(엔터를 안치고 온 경우)
			
			HttpSession session = request.getSession();
			UserDTO userDto = (UserDTO)session.getAttribute("userinfo");//유저 정보 객체
			
			List<SearchProductDTO> searchProdto;//검색 상품정보 객체 리스트
			
			int totalProdCount = dao.getSearchResultProdsCount(inputName,productSeq);//검색한 물품의 총 갯수 출력
			int pageAjaxCount = (int)Math.ceil(totalProdCount / 6.0);//6개씩 끊어서 출력해주기
			KakaoCookie ck = new KakaoCookie();
			
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
			//1. 단어로만 넘긴경우
			if (productSeq == null) {
				
				//마지막 방문페이지정보 쿠키에 저장
				ck.generateCookie(response, "lastPage", "searchresult.action?inputName="+inputName);
				//searchresult.action?inputName=라이언&productSeq=36
				//ck.generateCookie(response, "lastPage", "searchresult.action?inputName="+inputName+"&productSeq=");
				
				request.setAttribute("userinputName", inputName);
			}
			else {
			//2. 클릭해서 넘긴 경우
				//마지막 방문페이지정보 쿠키에 저장
				ck.generateCookie(response, "lastPage", "searchresult.action?inputName="+inputName+"&productSeq="+productSeq);
				
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

	//상품을 장바구니 목록에 넣어주는 경우
	@Override
	public int searchInputItem(HttpServletRequest request, HttpServletResponse response) {
		
		int productId = Integer.parseInt(request.getParameter("productId"));//상품번호
		HttpSession session = request.getSession();//로그인 상태인지 아닌지 체크해준다.
		
		try {
			
			UserDTO userInfo = (UserDTO)session.getAttribute("userinfo");
			
			//1. 로그인 되어 있지 않은 경우
			if (userInfo == null) {
				KakaoCookie kc = new KakaoCookie();
				String basketList = (String)kc.getCookieInfo(request, "basketList");
				
				//이미 장바구니에 담긴 번호인지 체크해준다.
				String[] basketLists = basketList.split("#");		
				
				//장바구니 쿠키 객체에서 해당물품번호가 있는지 찾아준다. 없으면 -1을 리턴할것
				int index = Arrays.asList(basketLists).indexOf(Integer.toString(productId));
				
				//해당 물품이 없는 경우 -> 상품 쿠키 객체에 물품 아이디를 추가해준다.
				if (index == -1) {
					
					StringBuffer sb = new StringBuffer();
					sb.append(basketList);
					sb.append(Integer.toString(productId));
					sb.append("#");
					
					kc.modifyCookie(request, response, "basketList", sb.toString(), 60*60*24*7);
					
					return 1;
				} else {
				//해당 물품이 존재하는경우 -> 아무일도 없던걸로 취급
					return -1;
				}
			}
			//2. 로그인 되어 있는 경우
			else {
				int userSeq = userInfo.getUserSeq();//유저 고유번호
				int result = dao.inputSearchItemBasket(userSeq,productId);
				
				if (result == -2) throw new Exception();
			}
			
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	//상품을 장바구니 목록에서 빼주는 경우
	@Override
	public int searchOutputItem(HttpServletRequest request, HttpServletResponse response) {
		
		int productId = Integer.parseInt(request.getParameter("productId"));//상품번호
		HttpSession session = request.getSession();
		
		try {
			
			UserDTO userInfo = (UserDTO)session.getAttribute("userinfo");
			
			//로그인 하지 않았을 경우
			if (userInfo == null) {
				KakaoCookie kc = new KakaoCookie();
				String basketList = (String)kc.getCookieInfo(request, "basketList");
				
				//이미 장바구니에 담긴 번호인지 체크해준다.
				String[] basketLists = basketList.split("#");	
				
				//장바구니 쿠키 객체에서 해당물품번호가 있는지 찾아준다. 없으면 -1을 리턴할것
				int index = Arrays.asList(basketLists).indexOf(Integer.toString(productId));
				
				if (index == -1) {
					//해당물품이 장바구니에 들어있는 표시가 되어있어서 클릭한건데 없다는건 -> 클라이언트측에서 공격시도로 볼 수 있음 -> 방어를 위해 return -1 을 반환
						return -1;
					} else {
						StringBuffer sb = new StringBuffer();
						
						for (int i = 0; i < basketLists.length; i++) {
							//빼려고하는 상품 번호는 그냥 안넣으면 된다.
							if (!basketLists[i].equals(Integer.toString(productId))) {
								sb.append(basketLists[i]);
								sb.append("#");
							} 
						}
						kc.modifyCookie(request, response, "basketList", sb.toString(), 60*60*24*7);
						
						return 1;
					}
				
			}
			//로그인 한 경우
			else {
				int userSeq = userInfo.getUserSeq();//유저 고유번호
				int result =  dao.outputSearchItemBasket(userSeq,productId);
				
				if (result == -2) throw new Exception();
				
				return result;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	//상품을 알람목록에 넣어주기
	@Override
	public int searchInputAlarm(HttpServletRequest request) {
		
		try {
			
			int productId = Integer.parseInt(request.getParameter("productId"));//상품번호
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO)session.getAttribute("userinfo");
			
			//--- 알람 서비스는 로그인이 되어야만 진행이 될수 있는 서비스이다.
			
			//1. 로그인이 안되어있는 경우
			if (userInfo == null) {
				
				return -2;//로그인이 되어있지 않으면 알람서비스를 이용할 수 없음. -> 로그인 유도
			}
			//2. 로그인이 되어있는 경우
			else {
				int userSeq = userInfo.getUserSeq();//유저 고유번호
				return dao.addProdtAlarm(userSeq,productId);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	//상품을 알람목에서 빼기
	@Override
	public int searchOutputAlarm(HttpServletRequest request) {
		
		try {
			
			int productId = Integer.parseInt(request.getParameter("productId"));//상품번호
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO)session.getAttribute("userinfo");
			
			//1. 로그인이 안되어있는 경우
			if (userInfo == null) {
				return -1;//로그인이 되어있지 않으면 알람서비스를 이용할 수 없음.
			}
			//2. 로그인이 되어있는 경우
			else {
				int userSeq = userInfo.getUserSeq();//유저 고유번호
				return dao.deleteProdtAlarm(userSeq,productId);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}

	}
	
	
	//프론트에서 글자 이쁘게 처리
	
}

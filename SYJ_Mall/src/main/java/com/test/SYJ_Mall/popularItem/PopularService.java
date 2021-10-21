package com.test.SYJ_Mall.popularItem;


import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.KakaoCookie;

@Service
public class PopularService implements IPopularService{
	
	@Autowired
	private IPoupularDAO dao;
	
	
	//인기상품 보여주기
	@Override
	public int getPopularProductList(HttpServletRequest request, int paging, int userSeq, String basketList) {
		try {
			
			int popularDtoListCount = (int)Math.ceil(dao.getPopularItemCount() / 18.0);
			List<PopularItemDTO> popularDtoList = dao.getPopularItem(paging,userSeq,basketList);
			request.setAttribute("popularDtoList", popularDtoList);
			request.setAttribute("seleted", "popular");//상단-> 오늘/신규/인기/마이 중에서 인기를 선택해주는 로직
			request.setAttribute("popularDtoListCount", popularDtoListCount);
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	//인기상품 보여주기 -> ajax 처리 : 로그인 한 경우
	@Override
	public List<PopularItemDTO> getPopularProductAjax(int paging, int userSeq) {
		
		return dao.getPopularItem(paging,userSeq,"");
	}

	//인기상품 보여주기 -> ajax 처리 : 로그인 안한 경우
	@Override
	public List<PopularItemDTO> getPopularProductAjax(int paging, String cookieList) {
		
		return dao.getPopularItem(paging,0,cookieList);
	}
	
	//회원이 선택한 상품 장바구니에 넣어주기
	@Override
	public int inputItemBasket(int userSeq, int productId) {
	
		return dao.inputItemBasket(userSeq,productId);
	}
	
	//회원이 선택한 상품 장바구니에서 빼주기
	@Override
	public int outputItemBasket(int userSeq, int productId) {
		
		return dao.outputItemBasket(userSeq,productId);
	}

	//쿠키에 존재하는 장바구니 내역 가져오기
	@Override
	public String getCookieBasket(HttpServletRequest request, HttpServletResponse response) {
		
		KakaoCookie kc = new KakaoCookie();
		
		String basketList = (String)kc.getCookieInfo(request, "basketList");
		
		//쿠키내에 장바구니 내역이 없는경우
		if(basketList == null) {
			
			//System.out.println("쿠키내에 basketList가 없음");
			
			kc.generateCookie(response, "basketList", "", 60*60*24*7);//쿠키생성 7 일동안 유지
			String newBasketList = (String)kc.getCookieInfo(request, "basketList");
			
			return newBasketList;
			
		} else {
		//쿠키내에 장바구니 내역이 있는경우	
			
			if (basketList.length() != 0) {
				basketList = basketList.substring(0,basketList.length()-1);
				return basketList;//기존쿠키 넘기기
			} else {//basketList 에 지금 아무런 정보가 존재하지 않는경우	
				return basketList;//기존쿠키 넘기기
			}	
		}
	}
	
	//로그인 하지 않았을때 물품 정보 쿠키객체에 넣어주기
	@Override
	public int inputItemBasketNonLogin(HttpServletRequest request, HttpServletResponse response, int productId) {
		
		KakaoCookie kc = new KakaoCookie();
		String basketList = (String)kc.getCookieInfo(request, "basketList");
		
		try {
			
			//이미 장바구니에 담긴 번호인지 체크해준다.
			String[] basketLists = basketList.split("#");			
			
			//장바구니 쿠키 객체에서 해당물품번호가 있는지 찾아준다. 없으면 -1을 리턴할것
			int index = Arrays.asList(basketLists).indexOf(Integer.toString(productId));
			
			//System.out.println(index);
			//-1 이라는건 없다는거임 그리고 진짜 아예 아무것도 없을수가 있음
			
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
				//System.out.println("???");
				return -1;
			}
			
			
		} catch(Exception e) {
			//System.out.println("error");
			e.printStackTrace();
			return -1;
		}
		
	}
	
	//로그인 하지 않았을때 물품 정보 쿠키객체에 빼주기
	@Override
	public int outputItemBasketNonLogin(HttpServletRequest request, HttpServletResponse response, int productId) {
		
		KakaoCookie kc = new KakaoCookie();
		String basketList = (String)kc.getCookieInfo(request, "basketList");
		
		try {
			
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
			
			
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}	
	}
	
	//상품정보 리스트 #붙여서 반환
	@Override
	public String productCookieList(List<Integer> list) {
		
		StringBuffer sb = new StringBuffer();
		
		for (int productSeq : list) {
			sb.append(Integer.toString(productSeq));
			sb.append("#");
		}
		
		String newBasketList = sb.toString();
		newBasketList = newBasketList.substring(0,newBasketList.length()-1);
		
		return newBasketList;
	}
	
	
	
	
	
	

}

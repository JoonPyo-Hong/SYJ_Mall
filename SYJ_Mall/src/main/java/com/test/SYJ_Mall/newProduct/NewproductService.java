package com.test.SYJ_Mall.newProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.KakaoCookie;
import com.test.SYJ_Mall.login.UserDTO;

@Service
public class NewproductService implements INewProductService {
	@Autowired
	private INewProductDAO dao;
	
	//맨 처음 신규 페이지 로딩
	@Override
	public int getNewProductInfo(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			int themeNum = 2;//테마 번호
			
			// 상단에 표시될 페이지
			request.setAttribute("seleted", "new");// 상단-> 오늘/신규/인기/마이 중에서 인기를 선택해주는 로직

			// 마지막 페이지 정보 쿠키에 넘기는 작업
			KakaoCookie ck = new KakaoCookie();
			ck.generateCookie(response, "lastPage", "newProductMain");

			if (userInfo == null) {
				// 로그인 되지 않은 경우
				String basketList = getCookieBasket(request, response);
				List<RecommendThemeDTO> rtp = dao.getNewRecommendThemeNoLogin(request,basketList,themeNum);
				
				for (RecommendThemeDTO dto : rtp) {
					System.out.println(dto.getProdNm());
				}
				
				String themeSubject = rtp.get(0).getCategoryNm();//테마 이름
				
				request.setAttribute("recommendTheme",rtp);
				request.setAttribute("themeSubject",themeSubject);
				
			} else {
				// 로그인이 된 경우
				
				
			}
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	
	
	// 쿠키에 존재하는 장바구니 내역 가져오기
	@Override
	public String getCookieBasket(HttpServletRequest request, HttpServletResponse response) {

		KakaoCookie kc = new KakaoCookie();

		String basketList = (String) kc.getCookieInfo(request, "basketList");

		// 쿠키내에 장바구니 내역이 없는경우
		if (basketList == null) {

			// System.out.println("쿠키내에 basketList가 없음");

			kc.generateCookie(response, "basketList", "", 60 * 60 * 24 * 7);// 쿠키생성 7 일동안 유지
			String newBasketList = (String) kc.getCookieInfo(request, "basketList");

			return newBasketList;

		} else {
			// 쿠키내에 장바구니 내역이 있는경우

			if (basketList.length() != 0) {
				basketList = basketList.substring(0, basketList.length() - 1);
				return basketList;// 기존쿠키 넘기기
			} else {// basketList 에 지금 아무런 정보가 존재하지 않는경우
				return basketList;// 기존쿠키 넘기기
			}
		}
	}

}

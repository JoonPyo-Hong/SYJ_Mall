package com.test.SYJ_Mall.newGoods;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * NewGoodService 객체
 * @author shin
 *
 */
@Service
public class NewGoodService implements INewGoodService{
	
	@Autowired
	private INewGoodDAO dao;
	
	
	// 신규 상단 배너 어떤 물품 가져올것인지 정해준다.	
	@Override
	public int setTopProductSetting(HttpServletRequest request) {
		
		try {
			HttpSession session = request.getSession();
			int userSeq = 1;//(Integer)session.getAttribute("userSeq");
			int charNum = 9;//어떤 캐릭터를 신규추천에 넣을건지 캐릭터 번호지정 --> 지금은 애 정확히 지정안해주면 오류발생한다.
			
			
			//신규-상단 배너 이미지쪽
			List<PdtBannerDTO> dtoList = new ArrayList<PdtBannerDTO>();
			dtoList = dao.bringNewTopImg();
			
			request.setAttribute("dtoList", dtoList);
			
			
			//캐릭터이름 가져오기
			String charName = dao.bringCharName(charNum);
			request.setAttribute("charName",charName);
			
			System.out.println(charName);
			
			//신규-추천 신규 테마
			List<PdtRecommedDTO> pdtrdtoList = new ArrayList<PdtRecommedDTO>();
			pdtrdtoList = dao.bringNewRecommendInfo(userSeq,charNum);
			
			//System.out.println(pdtrdtoList.get(0).getProductPrice());
			
			request.setAttribute("pdtrdtoList", pdtrdtoList);
			
			
			return 1;
		}
		catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
		
	}
	
	
	
	
	
}

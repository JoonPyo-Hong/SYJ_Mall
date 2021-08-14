package com.test.SYJ_Mall.popularItem;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PopularService implements IPopularService{
	
	@Autowired
	private IPoupularDAO dao;
	
	//인기상품 보여주기
	@Override
	public int getPopularProductList(HttpServletRequest request) {
		try {

			List<PopularItemDTO> popularDtoList = dao.getPopularItem();
			request.setAttribute("popularDtoList", popularDtoList);
			request.setAttribute("seleted", "popular");//상단 오늘/신규/인기/마이 중에서 인기를 선택해주는 로직
			
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
		
	}
	
	
	
}

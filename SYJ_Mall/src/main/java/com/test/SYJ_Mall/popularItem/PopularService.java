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
			
			//1. 인기상품 집계 시작일
			String startDt = "2017-01-01";
			//1. 인기상품 집계 종료일
			String endDt = "2019-12-31";
			
			List<PopularItemDTO> popularDtoList = dao.getPopularItem(startDt,endDt);
			request.setAttribute("popularDtoList", popularDtoList);
			request.setAttribute("seleted", "popular");//상단 오늘/신규/인기/마이 중에서 인기를 선택해주는 로직
			
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
		
	}
	
	
	
}

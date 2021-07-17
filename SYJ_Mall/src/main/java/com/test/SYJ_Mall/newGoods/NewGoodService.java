package com.test.SYJ_Mall.newGoods;

import javax.servlet.http.HttpServletRequest;

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
	public void setTopProductSetting(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}
	
}

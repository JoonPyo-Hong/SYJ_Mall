package com.test.SYJ_Mall.newGoods;

import java.util.ArrayList;
import java.util.List;

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
	public int setTopProductSetting(HttpServletRequest request) {
		
		try {
			List<PdtBannerDTO> dtoList = new ArrayList<PdtBannerDTO>();
			dtoList = dao.bringNewTopImg();
			
			request.setAttribute("dtoList", dtoList);
			
			return 1;
		}
		catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
		
	}
	
	
	
	
	
}

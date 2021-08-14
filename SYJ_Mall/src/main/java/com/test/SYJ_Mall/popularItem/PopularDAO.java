package com.test.SYJ_Mall.popularItem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PopularDAO implements IPoupularDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	

	//인기상품 리스트 가져오기
	@Override
	public List<PopularItemDTO> getPopularItem(String startDt, String endDt) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("startDt", startDt);
		map.put("endDt", endDt);
		
		return template.selectList("popuarItem.popularProductList",map);
	}
	
	
	
}

package com.test.SYJ_Mall.popularItem;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PopularDAO implements IPoupularDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	//인기상품 리스트 가져오기
	@Override
	public List<PopularItemDTO> getPopularItem() {
			
		return template.selectList("popuarItem.popularProductList");
	}
	
	
	
}

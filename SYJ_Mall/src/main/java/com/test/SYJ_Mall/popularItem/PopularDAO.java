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
	public List<PopularItemDTO> getPopularItem(int paging, int userSeq,String basketList) {
		
		PopularPagingDTO dto = new PopularPagingDTO(paging, userSeq, basketList);
		
		return template.selectList("popuarItem.popularProductList",dto);
	}	
	
	
	//회원이 선택한 상품 장바구니에 넣어주기
	@Override
	public int inputItemBasket(int userSeq, int productId) {
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("userSeq",userSeq);
		map.put("productId",productId);
		
		return template.selectOne("popuarItem.itemInputBasket", map);
	}

	//회원이 선택한 상품 장바구니에서 빼주기
	@Override
	public int outputItemBasket(int userSeq, int productId) {
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("userSeq",userSeq);
		map.put("productId",productId);
		
		return template.selectOne("popuarItem.itemOutputBasket", map);
	}


	
}

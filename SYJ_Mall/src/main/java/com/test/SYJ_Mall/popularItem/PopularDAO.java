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

	//새로추가해야할 상품번호 리스트 반환
	@Override
	public List<UserProductDTO> getCookieProductId(int userSeq) {
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("userSeq",userSeq);

		return template.selectList("popuarItem.getCookieProductId", map);
		
	}
	
	//회원이 선택한 상품 장바구니에서 빼주기
	@Override
	public int outputItemBasket(int userSeq, int productId) {
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("userSeq",userSeq);
		map.put("productId",productId);
		
		return template.selectOne("popuarItem.itemOutputBasket", map);
	}

	//쿠키에존재하는 상품 회원의 디비로 모두 넣어주기 -> 지운적 없는 목록
	@Override
	public int setCookieToDbBasketListNondeleted(int userSeq, String newBasketList) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("userSeq",Integer.toString(userSeq));
		map.put("productId",newBasketList);
		
		return template.selectOne("popuarItem.setCookieToDbBasketListNondeleted", map);
	}

	//쿠키에존재하는 상품 회원의 디비로 모두 넣어주기 -> 지운적 있는 목록
	@Override
	public int setCookieToDbBasketListDeleted(int userSeq, String newBasketList) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("userSeq",Integer.toString(userSeq));
		map.put("productId",newBasketList);
		
		return template.selectOne("popuarItem.setCookieToDbBasketListDeleted", map);
	}


}

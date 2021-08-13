package com.test.SYJ_Mall.popularItem;

import java.util.List;

public interface IPoupularDAO {
	
	/**
	 * 인기상품 리스트 가져오기
	 * @return PopularItemDTO 객체의 리스트
	 */
	List<PopularItemDTO> getPopularItem();
	


}

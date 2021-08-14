package com.test.SYJ_Mall.popularItem;

import java.util.List;

public interface IPoupularDAO {
	
	/**
	 * 인기상품 리스트 가져오기
	 * @param endDt 	인기상품 집계 시작일자
	 * @param startDt 	인기상품 집계 마지막 일자
	 * @return 			PopularItemDTO 객체의 리스트
	 */
	List<PopularItemDTO> getPopularItem(String startDt, String endDt);
	


}

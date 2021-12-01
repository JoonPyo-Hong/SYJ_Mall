package com.test.SYJ_Mall.myPages;

import java.util.List;

public interface IMyPagesDAO {
	
	/**
	 * 마이페이지 - 최근본 상품 리스트 가져오기
	 * @param seenList
	 * @return
	 */
	List<MyPageSeenDTO> getMyPageSeenList(String seenList);

}

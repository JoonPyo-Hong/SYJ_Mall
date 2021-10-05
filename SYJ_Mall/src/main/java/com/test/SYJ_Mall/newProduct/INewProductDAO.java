package com.test.SYJ_Mall.newProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface INewProductDAO {
	
	/**
	 * 추천신규테마 불러오기
	 * @param request
	 * @param basketList	장바구니 정보
	 * @param themeNum		테마번호
	 * @return
	 */
	List<RecommendThemeDTO> getNewRecommendThemeNoLogin(HttpServletRequest request, String basketList,int themeNum);
	


}

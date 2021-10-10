package com.test.SYJ_Mall.newProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface INewProductDAO {
	
	/**
	 * 추천신규테마 불러오기
	 * @param basketList	장바구니 정보
	 * @param themeNum		테마번호
	 * @return				물품객체
	 */
	List<RecommendThemeDTO> getNewRecommendThemeNoLogin(String basketList,int themeNum);
	
	/**
	 * 추천신규테마 불러오기
	 * @param userSeq	유저 고유번호
	 * @param themeNum	테마번호
	 * @return			물품객체
	 */
	List<RecommendThemeDTO> getNewRecommendTheme(int userSeq, int themeNum);
	
	/**
	 * 최상단 신규물품 가져오기
	 * @return
	 */
	List<RecommendTopProdDTO> getRecommendTopProdDTOList();
	

	


}

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
	
	/**
	 * 새로나온 친구 물품 갯수
	 * @return	물품의 갯수
	 */
	int getNewFriendsCount();
	
	/**
	 * 새로나온 친구들 물품객체 - 로그인 안된 경우
	 * @param basketList	장바구니 물품 객체
	 * @param paging	페이징 변수
	 * @return				
	 */
	List<NewFriendsProdDTO> getNewFriendDtosNologin(String basketList, int paging);
	
	

	


}

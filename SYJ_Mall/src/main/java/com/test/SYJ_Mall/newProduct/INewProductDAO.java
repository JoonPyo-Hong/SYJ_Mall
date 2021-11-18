package com.test.SYJ_Mall.newProduct;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface INewProductDAO {
	
	/**
	 * 추천신규테마 불러오기 - 비로그인 상태
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
	 * @param paging		페이징 변수
	 * @return				
	 */
	List<NewFriendsProdDTO> getNewFriendDtosNologin(String basketList, int paging);
	
	/**
	 * 새로나온 친구들 물품객체 - 로그인 된 경우
	 * @param userSeq		유저 고유번호
	 * @param paging		페이징변수
	 * @return
	 */
	List<NewFriendsProdDTO> getNewFriendDtos(int userSeq, int paging);
	
	/**
	 * 추천신규테마 불러오기 - 비로그인 상태(더보기)
	 * @param basketList			장바구니 정보
	 * @param themeNum				테마 번호
	 * @param sortedOption			정렬옵션
	 * @param sortedCharOption		캐릭터 필터링 옵션
	 * @return
	 */
	List<RecommendThemeDTO> getNewRecommendThemeNoLoginAdd(String basketList, int themeNum, int sortedOption, int sortedCharOption);
	
	/**
	 * 추천신규테마 불러오기 - 로그인 상태(더보기)
	 * @param userSeq			회원 고유번호
	 * @param themeNum			테마 번호
	 * @param sortedOption		정렬옵션
	 * @param sortedCharOption	캐릭터 필터링 옵션
	 * @return
	 */
	List<RecommendThemeDTO> getNewRecommendThemeAdd(int userSeq, int themeNum, int sortedOption, int sortedCharOption);
	
	/**
	 * 상품 소분류 목록 가져오기
	 * @param themeNum	대분류 번호
	 * @return
	 */
	List<SmallCategoryDTO> getNewRecommendProdtCategory(int themeNum);


	


}

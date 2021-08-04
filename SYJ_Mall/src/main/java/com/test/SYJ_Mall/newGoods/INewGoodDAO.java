package com.test.SYJ_Mall.newGoods;

import java.util.List;

/**
 * INewGoodDAO 객체
 * @author shin
 *
 */
public interface INewGoodDAO {
	
	/**
	 * 신규 목록 가장 위에있는 배너 어떤 상품과 그에관련된 어떤 사진을 가져올것인지 정해준다.
	 * @return	PdtBannerDTO 객체
	 */
	List<PdtBannerDTO> bringNewTopImg();
	
	/**
	 * 신규목록 추천신규 테마 정보
	 * @param userSeq	회원번호
	 * @param charNum	캐릭터번호
	 * @return			추천신규 테마 객체
	 */
	List<PdtRecommedDTO> bringNewRecommendInfo(int userSeq, int charNum);
	
	/**
	 * 캐릭터 이름 가져오기
	 * @param charNum	캐릭터 번호
	 * @return			캐릭터 이름
	 */
	String bringCharName(int charNum);
	


}

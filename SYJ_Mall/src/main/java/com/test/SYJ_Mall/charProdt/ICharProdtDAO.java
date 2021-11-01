package com.test.SYJ_Mall.charProdt;

import java.util.List;

/**
 * 
 * @author shin
 *
 */
public interface ICharProdtDAO {
	
	/**
	 * 상단 타이틀에 맞는 캐릭터 사진 & 이름  & 총 갯수 가져오기
	 * @param charSeq	캐릭터 번호
	 * @return			캐릭터 상단 객체
	 */
	List<CharHeadTitleDTO> getCharHeadData(String charSeq);
	
	/**
	 * 캐릭터에 해당되는 세부상품 가져오기
	 * @param charSeq		캐릭터 번호
	 * @param sortedOption	정렬옵션
	 * @param paging		페이지 번호
	 * @param basketList	장바구니 리스트
	 * @return				세부상품 객체
	 */
	List<CharProdtDTO> getCharProdts(String charSeq, String sortedOption, int paging, String basketList);
	
	
	

}

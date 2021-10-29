package com.test.SYJ_Mall.charProdt;

import java.util.List;

/**
 * 
 * @author shin
 *
 */
public interface ICharProdtDAO {
	
	/**
	 * 상단 타이틀에 맞는 캐릭터 사진&& 이름 가져오기
	 * @param charSeq	캐릭터 번호
	 * @return			캐릭터 상단 객체
	 */
	List<CharHeadTitleDTO> getCharHeadData(String charSeq);
	

}

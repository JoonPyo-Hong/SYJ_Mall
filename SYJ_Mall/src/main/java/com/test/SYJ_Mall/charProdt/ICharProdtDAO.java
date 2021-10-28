package com.test.SYJ_Mall.charProdt;

/**
 * 
 * @author shin
 *
 */
public interface ICharProdtDAO {
	
	/**
	 * 캐릭터에 알맞은 사진 가져오기
	 * @param charSeq	캐릭터 번호
	 * @return			캐릭터 url
	 */
	String getCharPicUrl(String charSeq);

}

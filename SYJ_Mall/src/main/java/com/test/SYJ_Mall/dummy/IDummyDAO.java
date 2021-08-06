package com.test.SYJ_Mall.dummy;

/**
 * IDummyDAO 인터페이스
 * @author shin
 *
 */
public interface IDummyDAO {
	
	/**
	 * 더미 넣기
	 * @param dto	dto 객체
	 * @return		1: 성공, -1 :실패
	 */
	int generateDummy(DummyDTO dto);
	
	
}

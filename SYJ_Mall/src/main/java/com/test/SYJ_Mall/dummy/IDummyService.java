package com.test.SYJ_Mall.dummy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * 더미생성 서비스 인터페이스
 * @author shin
 *
 */
public interface IDummyService {
	
	
	/**
	 * 더미 데이터 넣어주기
	 * @param categories
	 * @param names
	 * @param counts
	 * @param prices
	 * @param discounts
	 * @param rep_yns
	 * @param char_firsts
	 * @param char_seconds
	 * @param rep_imgs
	 * @param heads1
	 * @param heads2
	 * @param heads3
	 * @param heads4
	 * @return
	 */
	int putInfo(List<Integer> categories, List<String> names, List<Integer> counts, List<Integer> prices,
			List<Integer> discounts, List<String> rep_yns, List<Integer> char_firsts, List<Integer> char_seconds,
			List<String> rep_imgs, List<String> heads1, List<String> heads2, List<String> heads3, List<String> heads4);
	
	

}

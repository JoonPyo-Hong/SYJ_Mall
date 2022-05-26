package com.test.SYJ_Mall.common;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 공통 기능 dao
 * @author shin
 *
 */
@Repository
public class CommonDAONew implements ICommonDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	//알람 관련 체크 기능
	@Override
	public int setProdtAlarmChecking(int userSeq, int productId) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("userSeq",userSeq);
		map.put("productId",productId);
		
		return template.selectOne("CommonDB.prodtAlarmChecking",map);
	}
	
	//장바구니 관련 체크 기능 (로그인이 된 경우)
	@Override
	public int setBasketProdtChecking(int userSeq, int prodtId) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("userSeq",userSeq);
		map.put("prodtId",prodtId);
		
		return template.selectOne("CommonDB.prodtBasketChecking",map);
	}

	//해당 리뷰에 대해서 유저가 좋아요를 했는지 아닌지 확인해주고 또한 좋아요 처리에 대한 로직
	@Override
	public int setReviewLikeControl(int userSeq, int orderSeq, int prodtId) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userSeq",userSeq);
		map.put("orderSeq",orderSeq);
		map.put("prodtId",prodtId);
		
		return template.selectOne("CommonDB.reviewLikeCheck",map);
	}
	
	
}

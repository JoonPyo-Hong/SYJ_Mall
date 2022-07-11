package com.test.SYJ_Mall.prodtPay;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 상품결제 DAO
 * @author shin
 *
 */
@Repository
public class ProdtPayDAO implements IProdtPayDAO {
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int getTest() {
		// TODO Auto-generated method stub
		return 0;
	}

	//구매할 상품의 정보 가져오기
	@Override
	public List<ProdtPayDTO> getProdtPayList(String prodtId) {
		
		return template.selectList("ProdtPay.buyProdtList",prodtId);
	}
	
	//유저정보 가져와주기
	@Override
	public List<ProdtPayUserDTO> getProdtPayUserInfo(int userSeq) {
		
		return template.selectList("ProdtPay.buyProdtUserInfos",userSeq);
	}
	
	//유저의 기프트카드 잔액 가져오기
	@Override
	public int getProdtUserGiftMoney(int userSeq) {
		
		return template.selectOne("ProdtPay.buyProdtUserGiftBalance",userSeq);
	}
	
	//유저의 카카오 포인트 잔액 가져오기
	@Override
	public int getProdtUserKakaoPoint(int userSeq) {
		return template.selectOne("ProdtPay.buyProdtUserKakaoPointBalance",userSeq);
	}
	
	
}

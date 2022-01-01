package com.test.SYJ_Mall.myPages;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPagesDAO implements IMyPagesDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	//마이페이지 - 최근본 상품 객체들 가져오기
	@Override
	public List<MyPageSeenDTO> getMyPageSeenList(String seenList) {
		
		return template.selectList("MyPages.myPageSeenDatas",seenList);
	}

	//장바구니 리스트 가져오기 - 로그인 안된 상태
	@Override
	public List<MyPageBasketDTO> getMyPageBasketNoLogin(String basketList) {
		
		return template.selectList("MyPages.myPageBasketDatas",basketList);
	}
	
	//장바구니 리스트 가져오기 - 로그인 된 상태
	@Override
	public List<MyPageBasketDTO> getMyPageBasketLogin(int userSeq) {
		
		return template.selectList("MyPages.myPageBasketDatasLogin",userSeq);
	}
	
	//장바구니 물품 제거해주기 - 로그인이 된 상태
	@Override
	public int modifyBasketCookiesLogin(int userSeq, String productIds) {
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("userSeq",Integer.toString(userSeq));
		map.put("productIds",productIds);
		
		return template.selectOne("MyPages.modifyBasketCookiesLogin",map);
	}
	

	//주문내역 - 회원이 주문한 제품 객체
	@Override
	public List<MyPageOrderDTO> getMyPageDtoList(int userSeq) {
		
		return template.selectList("MyPages.myPageOrderList",userSeq);
	}
	
	//주문내역 - 회원이 주문한 제품 객체 날짜에 관한 객체만 가져올것
	@Override
	public List<String> getMyPageDtoDateList(int userSeq) {
		
		return template.selectList("MyPages.myPageOrderDateList",userSeq);
	}
	
}

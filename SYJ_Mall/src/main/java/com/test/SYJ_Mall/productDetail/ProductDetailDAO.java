package com.test.SYJ_Mall.productDetail;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDetailDAO implements IProductDetailDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	//해당삼풍 헤드 이미지
	@Override
	public List<String> getProductHeadImages(int prodtSeq) {
		
		return template.selectList("ProductDetails.productHeadImages",prodtSeq);
	}
	
	
	//해당 상품 상세내역(비로그인 상태)
	@Override
	public List<ProductDetailDTO> getProductDetailInfo(int prodtSeq) {
		
		return template.selectList("ProductDetails.productDetailsInfo",prodtSeq);
	}

	//잠깐만 이 상품은 어때요 상품 객체들
	@Override
	public List<ProductHowDTO> getProductHowInfo(String basketInfo, int prodtSeq, int filterSeq) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		System.out.println(basketInfo);
		System.out.println(prodtSeq);
		System.out.println(filterSeq);
		
		map.put("basketInfo",basketInfo);
		map.put("prodtSeq",Integer.toString(prodtSeq));
		map.put("filterSeq",Integer.toString(filterSeq));

		return template.selectList("ProductDetails.productHowInfo",map);
	}



}

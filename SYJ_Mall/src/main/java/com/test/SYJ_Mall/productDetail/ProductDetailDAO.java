package com.test.SYJ_Mall.productDetail;

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

}

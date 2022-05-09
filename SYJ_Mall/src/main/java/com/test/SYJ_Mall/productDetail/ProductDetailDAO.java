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
	
	//해당 상품 상세내역(로그인 상태)
	@Override
	public List<ProductDetailDTO> getProductDetailInfoLogin(int userSeq, int prodtSeq) {
		
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("userSeq",userSeq);
		map.put("prodtSeq",prodtSeq);
		
		return template.selectList("ProductDetails.productDetailsInfoLogin",map);
		
	}
	
	//잠깐만 이 상품은 어때요 대분류 정보
	@Override
	public List<Integer> getProductCategory() {
		
		return template.selectList("ProductDetails.productHowInfoCategory");
	}

	//잠깐만 이 상품은 어때요 상품 객체들(로그인이 안된 경우)
	@Override
	public List<ProductHowDTO> getProductHowInfo(String basketInfo, int prodtSeq, int filterSeq, int selectCategory) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("basketInfo",basketInfo);
		map.put("prodtSeq",Integer.toString(prodtSeq));
		map.put("filterSeq",Integer.toString(filterSeq));
		map.put("selectCategory",Integer.toString(selectCategory));

		return template.selectList("ProductDetails.productHowInfo",map);
	}
	
	//잠깐만 이 상품은 어때요 상품 객체들(로그인이 된 경우)
	@Override
	public List<ProductHowDTO> getProductHowInfoLogin(int userSeq, int prodtSeq, int filterSeq, int selectCategory) {
		
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		
		map.put("userSeq",userSeq);
		map.put("prodtSeq",prodtSeq);
		map.put("filterSeq",filterSeq);
		map.put("selectCategory",selectCategory);
		
		return template.selectList("ProductDetails.productHowInfoLogon",map);
	}

	//상품에 관한 리뷰 정보
	@Override
	public List<ProductDetailReviewDTO> getProductReview(String prodtSeq, int sortOption, int paging, String currentTime) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		
		map.put("prodtSeq",prodtSeq);
		map.put("sortOption",Integer.toString(sortOption));
		map.put("paging",Integer.toString(paging));
		map.put("currentTime",currentTime);
		
		return template.selectList("ProductDetails.productReview",map);
	}

	//상품에 관한 전체 리뷰 개수
	@Override
	public int getProductReviewCounts(int prodtSeq) {
		
		return template.selectOne("ProductDetails.productReviewTotalCount",prodtSeq);
	}

	
	// 최근 본 상품 요기있네 객체들
	@Override
	public List<ProductRecentDTO> getProductRecentInfo(String recentSeen, String basketInfo) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("recentSeen",recentSeen);
		map.put("basketInfo",basketInfo);
		
		return template.selectList("ProductDetails.productRecentInfo",map);
	}

	
	// 최근본 상품 요기 있네 객체들 - 로그인 된 경우
	@Override
	public List<ProductRecentDTO> getProductRecentInfoLogin(String userSeq, String recentSeen) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("userSeq",userSeq);
		map.put("recentSeen",recentSeen);
		
		return template.selectList("ProductDetails.productRecentInfoLogin",map);
	}


	


	

	



}

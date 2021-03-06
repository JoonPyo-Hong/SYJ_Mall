package com.test.SYJ_Mall.productDetail;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.utill.KakaoCookie;

public interface IProductDetailDAO {
	
	/**
	 * 해당 상품 헤드페이지 가져오기
	 * @param prodtSeq
	 * @return
	 */
	List<String> getProductHeadImages(int prodtSeq);
	
	/**
	 * 상품에 대한 상세정보(비로그인 상태)
	 * @param prodtSeq
	 * @return
	 */
	List<ProductDetailDTO> getProductDetailInfo(int prodtSeq);
	
	/**
	 * 상품에 대한 상세정보(로그인 상태)
	 * @param prodtSeq
	 * @param parseInt
	 * @return
	 */
	List<ProductDetailDTO> getProductDetailInfoLogin(int userSeq, int prodtSeq);
	
	/**
	 * 잠깐만 이 상품은 어때요 대분류 정보
	 * @return
	 */
	List<Integer> getProductCategory();
	
	/**
	 * 잠깐만 이 상품은 어때요 상품정보
	 * @param basketInfo
	 * @param parseInt
	 * @param filterSeq
	 * @param selectCategory
	 * @return
	 */
	List<ProductHowDTO> getProductHowInfo(String basketInfo,int prodtSeq, int filterSeq, int selectCategory);
	
	/**
	 * 잠깐만 이 상품은 어때요 상품정보 - 로그인 한 경우
	 * @param userSeq
	 * @param prodtSeq
	 * @param filterSeq
	 * @param selectCategory
	 * @return
	 */
	List<ProductHowDTO> getProductHowInfoLogin(int userSeq, int prodtSeq, int filterSeq, int selectCategory);
	
	/**
	 * 상품에 관한 리뷰 정보
	 * @param prodtSeq
	 * @param sortOption
	 * @param paging
	 * @return
	 */
	List<ProductDetailReviewDTO> getProductReview(String prodtSeq, int sortOption, int paging ,String currentTime);
	
	/**
	 * 상품에 관한 전체 리뷰 개수
	 * @param prodtSeq
	 * @return
	 */
	int getProductReviewCounts(int prodtSeq);
	
	/**
	 * 최근본 상품 요기 있네 객체들
	 * @param string
	 * @param basketInfo
	 * @return
	 */
	List<ProductRecentDTO> getProductRecentInfo(String string,String basketInfo);
	
	/**
	 * 최근본 상품 요기 있네 객체들 - 로그인 된 경우
	 * @param string
	 * @param queueToString
	 * @return
	 */
	List<ProductRecentDTO> getProductRecentInfoLogin(String string, String queueToString);
	
	/**
	 * 상품에 관한 리뷰 정보 - 로그인 한 경우
	 * @param prodtSeq
	 * @param sortOption
	 * @param paging
	 * @param currentTime
	 * @param userSeq
	 * @return
	 */
	List<ProductDetailReviewDTO> getProductReviewLogin(String prodtSeq, int sortOption, int paging, String currentTime,int userSeq);
	
	
	/**
	 * 특정 유저가 해당 상품을 구매했는지 또한 이미 리뷰를 작성했는지 확인
	 * @param userSeq
	 * @param prodtSeq
	 * @return
	 */
	int getProdtBuyReviewChecking(int userSeq, int prodtSeq);
	
	/**
	 * 상품에 관한 리뷰 등록
	 * @param userSeq
	 * @param prodtSeq
	 * @param reviewText
	 * @param starCount
	 * @return
	 */
	int getProductReviewWriting(String userSeq, String prodtSeq, String reviewText, String starCount);
	
	/**
	 * 리뷰에 대해서 좋아요 눌렀을 경우에 해당 리뷰에 대한 좋아요 개수 가져오기
	 * @param pdOrderSeq
	 * @param prodtId
	 * @return
	 */
	int getProductReviewLikeCnt(String pdOrderSeq, String prodtId);

	
	
	
	
	
	

}

package com.test.SYJ_Mall.myPages;
import lombok.Data;

/**
 * 주문하는 주문번호에 해당하는 제품의 정
 * @author sinseunghwan
 *
 */
@Data
public class MyPageOrderProdtDTO {
	private int prodtSeq;//제품 일련번호
	private String prodtName;//제품 이름
	private int prodtPrice;//제품 가격
	private int prodtBuyCount;//제품 구매 개수
}

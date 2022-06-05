package com.test.SYJ_Mall.myPages;

import lombok.Data;
/**
 * 마이페이지 주문 dto 객체
 * @author shin
 *
 */
@Data
public class MyPageOrderDTO {
	private String prodtName;//제품 이름
	private String orderState;//주문 상태
	private String prodtImg;//제품 이미지
	private String orderDatetime;//제품 주문 일
	private String prodtOrderSeq;//주문번호
}

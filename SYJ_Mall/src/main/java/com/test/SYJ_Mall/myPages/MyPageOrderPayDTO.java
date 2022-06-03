package com.test.SYJ_Mall.myPages;

import lombok.Data;

/**
 * 결제관련 dto
 * @author sinseunghwan
 *
 */
@Data
public class MyPageOrderPayDTO {
	private int paySudan;//결제수단
	private String payDatetime;//결제일시
	private int payMoney;//전체 상품 가격
	private int payPoint;// 사용 포인트비용
	private int payShippment;//배송비
	private int payGiftCard;//기프트카드 사용비용
	private int totalPayMomey;//모든공제액을 뺀 총비용
}

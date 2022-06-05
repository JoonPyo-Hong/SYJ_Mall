package com.test.SYJ_Mall.myPages;

import lombok.Data;

/**
 * 결제관련 dto
 * @author sinseunghwan
 *
 */
@Data
public class MyPageOrderPayDTO {
	private String payDatetime;//결제일시
	private String payMoney;//전체 상품 가격
	private String payPoint;// 사용 포인트비용
	private String payShippment;//배송비
	private String payGiftCard;//기프트카드 사용비용
	private String totalPayMomey;//모든공제액을 뺀 총비용 - 포인트 기프트카드 제외하고 정산해야 하는 비용
}

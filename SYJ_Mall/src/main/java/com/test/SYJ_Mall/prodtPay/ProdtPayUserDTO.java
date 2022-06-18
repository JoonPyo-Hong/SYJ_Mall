package com.test.SYJ_Mall.prodtPay;

import lombok.Data;

/**
 * 결제 준비 유저 정보
 * @author shin
 *
 */
@Data
public class ProdtPayUserDTO {
	private String userName;
	private String userPhoneNum;
	private String userFirstAddr;
	private String userSecondAddr;
	//유저 포인트랑 기프트카드 가져와야함
}

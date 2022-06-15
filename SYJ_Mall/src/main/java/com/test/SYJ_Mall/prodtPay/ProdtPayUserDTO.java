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
}

package com.test.SYJ_Mall.myPages;

import lombok.Data;

/**
 * 주문하는 회원 관련 회원정보
 * @author sinseunghwan
 *
 */
@Data
public class MyPageOrderPayUserDTO {
	private String userName;//주문고객 이름
	private String userPhoneNum;//주문 고객의 핸드폰 번호
	private String userEmail;//주몬 고객의 이메일 주소
	private String userAddr;//주몬 고객의 집 주소
}	

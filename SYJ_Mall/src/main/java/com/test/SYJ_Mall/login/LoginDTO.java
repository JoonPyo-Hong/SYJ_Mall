package com.test.SYJ_Mall.login;

import lombok.Data;

/**
 * 로그인 검증 객체
 * @author shin
 *
 */
@Data
public class LoginDTO {
	
	
	//로그인 검증결과를 위한 dto 객체이다.
	private int loginCode;
	private int userSeq;
	
	
}

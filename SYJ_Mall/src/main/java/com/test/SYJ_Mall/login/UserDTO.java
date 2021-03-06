package com.test.SYJ_Mall.login;

import lombok.Data;
/**
 * 유저객체
 * @author shin
 *
 */
@Data
public class UserDTO {

	private int userSeq;//유저 고유번호
	private String userId;//유저 아이디
	private String userGender;//유저 성별
	private String userNation;//유저 국가
	private int userHasCoin;//유저 보유 코인
	private int userGrade;//유저 등급
	private String userName;// 유저이름
	
	
}

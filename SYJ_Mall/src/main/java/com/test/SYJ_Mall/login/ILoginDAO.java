package com.test.SYJ_Mall.login;

import java.util.List;

import com.common.utill.AdverDTO;

/**
 * 로그인 dao 인터페이스
 * @author shin
 *
 */
public interface ILoginDAO {
	
	/**
	 * 로그인 결과
	 * @param userIp	유저 ip
	 * @param id		유저 아이디
	 * @param encpw		유저 비밀번호(암호화된 비밀번호)
	 * @return			로그인 검증 객체
	 */
	List<LoginDTO> loginResult(String userIp,String id,String encpw);
	
	
	/**
	 * 광고 넣기
	 * @return	광고 객체
	 */
	List<AdverDTO> getAdvertiseInfo();
	
	/**
	 * 해당번호 유저 정보 가져오기
	 * @param userSeq	유저고유번호
	 * @return			유저객체
	 */
	List<UserDTO> userInfo(int userSeq);
	
	
}

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


	/**
	 * 자동로그인 인증 후 고객의 로그인을 기록해줄것
	 * @param userSeq		유저의 고유번호
	 * @param ipaddress		아이피주소
	 */
	void autoLoginPassTrace(int userSeq,String ipaddress);

	
	/**
	 * 회원이 기입한 정보를 회원테이블로 옮겨줄 메서드
	 * @param dto	회원가입 데이터 객체
	 * @return		실패 성공 여부 체크
	 */
	int signUp(SignUpDTO dto);
	
	
}

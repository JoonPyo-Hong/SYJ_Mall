package com.test.SYJ_Mall.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

/**
 * 로그인 서비스 인터페이스
 * @author shin
 *
 */
public interface ILoginService {
	
	/**
	 * 접속자의 ip를 체크함
	 * @param request 	request 객체
	 * @return			접속자의 아이피
	 */
	String ipCheck(HttpServletRequest request);
	
	/**
	 * 비밀번호 암호화
	 * @param password 	암호화되지 않은 비밀번호 
	 * @return			암호화된 비밀번호
	 */
	String pwEnc(String password);
	
	/**
	 * 로그인 결과
	 * @param userIp	접속자 ip
	 * @param id		접속자 id
	 * @param pw		접속자 비밀번호
	 * @return			
	 */
	List<LoginDTO> loginResult(String userIp,String id, String pw);
	
	/**
	 * 로그인 성공
	 * @param request	request 객체
	 * @param userSeq	유저 고유번호
	 * @param mode		0 : 자동로그인방지 걸쳐서 성공, 1 : 자동방지 없이 로그인 성공
	 */
	void loginSuccess(HttpServletRequest request, int userSeq,int mode);
	
	
	/**
	 * 광고관련 로직
	 * @return	광고정보
	 */
	HashMap<String,String> adverShow();
	
	
	
	/**
	 * 자동로그인 방지
	 * @param request	request 객체
	 * @return			request 객체
	 */
	HttpServletRequest AutoLoginBanned(HttpServletRequest request);
	
	/**
	 * 자동로그인 방지 - 사진불러오기
	 * @param request	request 객체
	 * @return			json 객체 - 사진정보
	 */
	JSONObject picCheck(HttpServletRequest request);

	
	/**
	 * 회원가입
	 * @param request	request 객체
	 * @return			회원가입 결과
	 */
	int userSignUp(HttpServletRequest request);//회원가입 해주는 로직

	
	
}
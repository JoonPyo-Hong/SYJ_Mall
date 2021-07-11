package com.test.SYJ_Mall.login;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
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
	 */
	void loginSuccess(HttpServletRequest request, int userSeq);
	
	/**
	 * 자동로그인 방지
	 * @param request	request 객체
	 * @param userSeq	유저 고유번호
	 * @param ip		유저 아이피 주소
	 * @return			HttpServletRequest 객체 request 를 보내주기 위함
	 */
	HttpServletRequest AutoLoginBanned(HttpServletRequest request,int userSeq,String ip);
	
	/**
	 * 자동로그인 방지 - 사진불러오기
	 * @param request	request 객체
	 * @return			json 객체 - 사진정보
	 */
	JSONObject picCheck(HttpServletRequest request);
	

	/**
	 * 자동로그인 방지인증 후 회원이 로그인한 시간을 기록으로 남길것.
	 * @param userSeq		회원 고유번호
	 * @param ipaddress		ip주소
	 */
	void logUserTrace(int userSeq,String ipaddress);

	
	/**
	 * 회원가입
	 * @param request
	 * @param dto
	 * @return	회원가입 결과 -> 1 : 성공, -1 : 실패
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeySpecException
	 */
	int userSignUp(HttpServletRequest request,SignUpDTO dto) throws NoSuchAlgorithmException, InvalidKeySpecException;//회원가입 해주는 로직
	
	/**
	 * 유저회원가입 - 아이디 검증
	 * @param request	request 객체
	 * @return			-1 : 사용불가, 1 : 사용가능
	 */
	int userSignUpIdVerify(HttpServletRequest request);
	
	/**
	 * 유저회원가입 - 비밀번호 검증
	 * @param request	request 객체
	 * @return			-1 : 비밀번호가 안전하지 않음, 1 : 비밀번호가 안전해서 사용가능
	 */
	int userSignUpPwVerify(HttpServletRequest request);
	
	
	/**
	 * RSA 대칭키 암호화
	 * @param request	request 객체
	 * @return			-1 : 오류 , 1 : 성공
	 */	
	int setRSAkey(HttpServletRequest request) throws NoSuchAlgorithmException, InvalidKeySpecException;
	
	/**
	 * RSA 대칭키 복호화
	 * @param request	request 객체
	 * @return			복호화된 결과값을 map객체로 불러와준다.
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeySpecException
	 */
	HashMap<String,String> getRSAkey(HttpServletRequest request);
	
	
	/**
	 * 첫번째 로그인 과정 - 광고넘겨주고 rsa키값 넘겨준다
	 * @param request		request 객체
	 * @param errorCode		오류코드 - 로그인오류 : -1, 정상 : 0
	 * @param comeCount		첫번째 들어올때만 애니메이션 효과 넣어줄것. -> 로그인 오류가 발생하면 애니메이션 작동 안하게 처리
	 * @return				정상 : 0 , 비정상 : -1
	 */
	int firstLoginStep(HttpServletRequest request,int errorCode,int comeCount);
	
	/**
	 * 유저회원가입 - 이메일 아이디 중복 체크
	 * @param request	request 객체
	 * @return			1 : 성공, -1 : 실패
	 */
	int userEmailVerify(HttpServletRequest request);
	

	
	/**
	 * 유저 아이디 찾아주기
	 * @param email	유저 이메일
	 * @param phone	유저 휴대폰 번호
	 * @return		유저관련 json 객체
	 */
	JSONObject findUserId(String email, String phone);
	
	/**
	 * 유저 비밀번호 찾기전 해당 아이디가 존재하는지 확인하는 작업
	 * @param userId	유저의 아이디
	 * @param userEmail	유저의 이메일
	 * @param userPhone	유저의 전화번호
	 * @return			1 : 존재, -1 : 존재하지 않음
	 */
	int findUserPw(String userId, String userEmail, String userPhone);
	
	/**
	 * 비밀번호 찾기 - 비밀번호를 변경하고 고객에게 임시비밀번호 발급
	 * @param userId	고객의 아이디
	 * @param userEmail	고객의 이메일
	 * @param userPhone	고객의 전화번호
	 * @return			1: 성공, -1: 실패
	 */
	int sendPw(String userId, String userEmail, String userPhone);
	
	/**
	 * 회원가입 - 고객이 입력한 전화번호가 중복되지 않는지 체크
	 * @param request	request 객체	
	 * @return			1 : 중복안됨, -1 : 중복됨
	 */
	int userPhoneNumVerify(HttpServletRequest request);
	
	/**
	 * 로그인 - 유저가 임시비밀번호 발급받아서 비밀번호 변경해야함
	 * @param request	request 객체
	 * @param userSeq	유저 고유번호
	 * @param id		유저 아이디
	 * @param ip		유저 아이피 주소
	 * @return			1: 성공, -1: 실패
	 */
	int userRedefinedPw(HttpServletRequest request, int userSeq, String id, String ip);
	
	
	
	/**
	 * 고객의 임시비밀번호를 다시 바꾸어주는 작업 => 고객이 직접 변경해서 넘어온 값 
	 * @param request	request 객체
	 * @return			1 : 성공, -1 : 실패
	 */
	int remodiftUserPw(HttpServletRequest request);
	
	/**
	 * 세션객체를 소멸시키는 메서드
	 * @param request	request 객체	
	 */
	void sessionDelete(HttpServletRequest request);
	
	/**
	 * 자동로그인 방지를 통과 한 후 로그인 처리단계
	 * @param request	request 객체
	 * @return			1 : 성공, -1 : 실패
	 */
	int autoLoginPassLogOn(HttpServletRequest request);
    
	/**
	 * 에러가 발생했을때 처리
	 * @param e		에러요인
	 * @param ip	에러를 발생시킨 ip
	 */
	void errorEruptionTodb(Exception e, String ip);
	



	

	
	
	
	
	

	
	
	
}
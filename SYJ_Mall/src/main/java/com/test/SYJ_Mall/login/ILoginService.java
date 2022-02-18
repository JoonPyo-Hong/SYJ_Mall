package com.test.SYJ_Mall.login;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.common.utill.AES256Util;
import com.common.utill.KakaoCookie;
import com.common.utill.QRCodeGenerate;
import com.common.utill.RSAalgorithm;
import com.common.utill.StringFormatClass;

/**
 * 로그인 서비스 인터페이스
 * @author shin
 *
 */
public interface ILoginService {
	
	
	/**
	 * 이메일 확인
	 * @param userId
	 * @param userEmail
	 * @param userPhone
	 * @return
	 */
	int emailCertify(String userId,String userEmail,String userPhone);
	
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
	int loginSuccess(HttpServletRequest request,HttpServletResponse response, int userSeq) throws Exception;
	
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
	 * 회원가입 - 고객이 입력한 전화번호가 중복되지 않는지 체크
	 * @param request	request 객체	
	 * @return			1 : 중복안됨, -1 : 중복됨
	 */
	int userPhoneNumVerify(HttpServletRequest request);
	
	/**
	 * 로그인 - 유저가 임시비밀번호 발급받아서 비밀번호 변경해야함
	 * @param request	request 객체
	 * @param userSeq	유저 고유번호
	 * @param ip		유저 아이피 주소
	 * @return			1: 성공, -1: 실패
	 */
	int userRedefinedPw(HttpServletRequest request, int userSeq, String ip);
	
	
	
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
	 * @param request
	 * @param response
	 * @return 			1 : 성공, -1 : 실패
	 */
	int autoLoginPassLogOn(HttpServletRequest request, HttpServletResponse response);
    
	
	/**
	 * 로그인 버튼 누른후 -> 존재하는 아이디가 맞는지 체크 (모달창)
	 * @param request	request 객체
	 * @return			1 : 존재함, -1 : 존재하지 않음 / 벤당한 아이피로 접속
	 */
	int userIdPwCheck(HttpServletRequest request);
	
	/**
	 * RSA 대칭키 복호화
	 * @param request	request 객체
	 * @return			복호화된 결과값을 map객체로 불러와준다.(id,pw)
	 */
	HashMap<String, String> getRSAkeySessionStay(HttpServletRequest request);
	
	/**
	 * 마지막 접속 페이지 쿠키 가져오기
	 * @param request		
	 * @param response		
	 * @param cookieName	쿠키이름
	 * @return				해당 쿠키이름에 대응되는 value
	 */
	Object instanceCookie(HttpServletRequest request, HttpServletResponse response, String cookieName);
	
	
	/**
	 * 메인페이지로 보내주기
	 * @param request
	 */
	void goMain(HttpServletRequest request);
	
	/**
	 * 물품정보를 리스트형식으로 넣어주면 #을 붙여서 반환
	 * @param list	상품정보리스트
	 * @return		상품정보리스트 #을 붙여서 반환
	 */
	String productCookieList(List<Integer> list);
	
	/**
	 * get방식의 url 한글을 인코딩 해주기 위함
	 * @param lastPage	마지막 페이지 url 주소
	 * @return			인코딩된 url 주소
	 */
	String urlEncoder(String lastPage);
	
	/**
	 * 로그인 확인 로직
	 * @param request
	 * @param response
	 * @return
	 */
	int loginChecking(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 로그인 시 필요한 정보 쿠키에 저장해줄 매서드
	 * @param request
	 * @param response
	 * @param addUrl
	 * @param kc
	 * @return
	 */
	int modifyCookie(HttpServletRequest request, HttpServletResponse response, String addUrl, KakaoCookie kc);
	
	/**
	 * 로그아웃 처리 수행
	 * @param request
	 * @param response
	 * @return
	 */
	String goLogOut(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * 로그인 관련 캅차
	 * @param request
	 * @return
	 */
	int getCapcharData(HttpServletRequest request);
	
	
	/**
	 * 로그인 유지해줄지 말지 결정해주는 함수
	 * @param request
	 * @param response
	 * @param userSeq
	 * @return
	 */
	int loginSaveYn(HttpServletRequest request, HttpServletResponse response,int userSeq);
	
	/**
	 * 로그인 유지 판단
	 * @param request
	 * @param response
	 * @param kc
	 * @param rsa
	 * @return
	 */
	String getLoginStayYn(HttpServletRequest request,HttpServletResponse response,KakaoCookie kc,RSAalgorithm rsa);
	
	
	/**
	 * 로그인 관련 서비스 메서드
	 * @param request
	 * @param response
	 * @return
	 */
	String loginVerifyLogic(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * QR 관련 로직
	 * @param request
	 * @param response
	 * @return
	 */
	int loginGetQr(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * QR 관련 로직 - 모바일 기기에서 아이디 체킹
	 * @param request
	 * @param response
	 * @return
	 */
	int loginQrChecking(HttpServletRequest request, HttpServletResponse response);
	
	/**
	 * QR 코드 통과한 후 로그인 권한 부여
	 * @param request
	 * @param response
	 * @param qrCheckUserId	회원의 아이디
	 * @return
	 */
	int grantResult(HttpServletRequest request, HttpServletResponse response, int qrCheckUserId);
	

	/**
	 * QR 코드 uid 대한 로그인정보 획득한 경우 유저 정보 부여
	 * @param request
	 * @return
	 */
	int qrCheckingUser(HttpServletRequest request);
	
	/**
	 * QR 코드 모바일 기기로 접근하는 처음경우 uuid 등 기본정보 조회
	 * @param request
	 * @param response
	 * @param kc
	 * @param au
	 * @param sf
	 * @return	1: 정상, -1: 실패(오류), -2: 아이디 존재하지 않음(회원의 고유번호 존재하지 않음), -3: uuid 자체가 존재하지 않음
	 */
	int loginQrPrevCheck(HttpServletRequest request, HttpServletResponse respons,KakaoCookie kc,AES256Util au,StringFormatClass sf);
	
	/**
	 * 타임아웃이 되거나 리프레쉬한 경우 기존의 uuid 정보를 db에서 제거해준다.
	 * @param request
	 * @return
	 */
	int loginQrDelete(HttpServletRequest request);
	
	/**
	 * 모바일기기에서 아이디 체킹하는 작업 -> QR 로그인 허용하지 않음
	 * @param request
	 * @return
	 */
	int loginQrCheckingNotAgree(HttpServletRequest request);
	

	



	

	
	
	
	
	

	
	
	
}
package com.test.SYJ_Mall.login;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.common.utill.AES256Util;
import com.common.utill.CommonDAO;
import com.common.utill.CommonDate;
import com.common.utill.ElasticSearchConn;
import com.common.utill.Encryption;
import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.KafkaConn;
import com.common.utill.KakaoCookie;
import com.common.utill.MessageSender;
import com.common.utill.RSAalgorithm;
import com.common.utill.ReCaptcha;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.CommonWebsocket;

/**
 * 로그인 서비스 인터페이스
 * @author shin
 *
 */
public interface ILoginService {
	
	
	/**
	 * 이메일 확인
	 * @param request
	 * @param sfc
	 * @param enc
	 * @param ms
	 * @param ea
	 * @return
	 */
	int emailCertify(HttpServletRequest request, StringFormatClass sfc, Encryption enc, MessageSender ms, ErrorAlarm ea);
	
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
	 * @param ea
	 * @return			json 객체 - 사진정보
	 */
	JSONObject picCheck(HttpServletRequest request, ErrorAlarm ea);
	

	/**
	 * 자동로그인 방지인증 후 회원이 로그인한 시간을 기록으로 남길것.
	 * @param userSeq		회원 고유번호
	 * @param ipaddress		ip주소
	 */
	void logUserTrace(int userSeq,String ipaddress);

	
	/**
	 * 회원가입 로직
	 * @param request
	 * @param dto
	 * @param comDate
	 * @param sb
	 * @param ea
	 * @return 회원가입 결과 -> 1 : 성공, -1 : 실패
	 */
	int userSignUp(HttpServletRequest request,SignUpDTO dto, CommonDate comDate, StringBuffer sb, ErrorAlarm ea);
	

	/**
	 * 유저회원가입 - 아이디 검증
	 * @param request
	 * @param ea
	 * @return	-1 : 사용불가, 1 : 사용가능
	 */
	int userSignUpIdVerify(HttpServletRequest request,ErrorAlarm ea);
	
	/**
	 * 
	 * @param request	request 객체
	 * @return			
	 */
	
	/**
	 * 유저회원가입 - 비밀번호 검증
	 * @param request
	 * @param ea
	 * @return	-1 : 비밀번호가 안전하지 않음, 1 : 비밀번호가 안전해서 사용가능
	 */
	int userSignUpPwVerify(HttpServletRequest request,ErrorAlarm ea);
	
	
	/**
	 * RSA 대칭키 암호화
	 * @param request
	 * @param ea
	 * @return	-1 : 오류 , 1 : 성공
	 */
	int setRSAkey(HttpServletRequest request, ErrorAlarm ea);
	
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
	 * @param ea			오류관련 클래스
	 * @param rsa			RSA 암호 관련 알고리즘
	 * @return				정상 : 0 , 비정상 : -1
	 */
	int firstLoginStep(HttpServletRequest request,int errorCode,int comeCount, ErrorAlarm ea, RSAalgorithm rsa);
	
	/**
	 * 유저회원가입 - 이메일 아이디 중복 체크
	 * @param request	request 객체
	 * @param ea
	 * @return			1 : 성공, -1 : 실패
	 */
	int userEmailVerify(HttpServletRequest request, ErrorAlarm ea);
	
	/**
	 * 유저 아이디 찾아주기
	 * @param request
	 * @param ea
	 * @param sfc
	 * @param dto
	 * @return
	 */
	LoginFindIdDTO findUserId(HttpServletRequest request, ErrorAlarm ea, StringFormatClass sfc, LoginFindIdDTO dto);
	
	/**
	 * 아이디 찾기 확인 과정
	 * @param request
	 * @param ea
	 * @return
	 */
	int findUserIdCheck(HttpServletRequest request, ErrorAlarm ea);
	
	/**
	 * 유저 비밀번호 찾기전 해당 아이디가 존재하는지 확인하는 작업
	 * @param request
	 * @param ea
	 * @return		1 : 존재, -1 : 존재하지 않음
	 */
	int findUserPw(HttpServletRequest request, ErrorAlarm ea);
	
	/**
	 * 회원가입 - 고객이 입력한 전화번호가 중복되지 않는지 체크
	 * @param request	request 객체	
	 * @param ea		ErrorAlarm 객체
	 * @return			1 : 중복안됨, -1 : 중복됨
	 */
	int userPhoneNumVerify(HttpServletRequest request, ErrorAlarm ea);
	
	
	/**
	 * 로그인 - 유저가 임시비밀번호 발급받아서 비밀번호 변경해야함
	 * @param request	request 객체
	 * @param userSeq	유저 고유번호
	 * @param ip		유저 아이피 주소
	 * @param ea		1: 성공, -1: 실패
	 * @return
	 */
	int userRedefinedPw(HttpServletRequest request, int userSeq, String ip, ErrorAlarm ea);
	
	
	/**
	 * 고객의 임시비밀번호를 다시 바꾸어주는 작업 => 고객이 직접 변경해서 넘어온 값 
	 * @param request
	 * @param rsa
	 * @param enc
	 * @param ea
	 * @return		1 : 성공, -1 : 실패
	 */
	int remodiftUserPw(HttpServletRequest request, RSAalgorithm rsa, Encryption enc, ErrorAlarm ea);
	
	/**
	 * 세션객체를 소멸시키는 메서드
	 * @param request	request 객체	
	 */
	void sessionDelete(HttpServletRequest request);
	

	/**
	 * 자동로그인 방지를 통과 한 후 로그인 처리단계
	 * @param request
	 * @param response
	 * @param ea
	 * @return	1 : 성공, -1 : 실패
	 */
	int autoLoginPassLogOn(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea);
    
	
	/**
	 *  로그인 버튼 누른후 -> 존재하는 아이디가 맞는지 체크 (모달창)
	 * @param request
	 * @param ea
	 * @param ec
	 * @param cd
	 * @param kc
	 * @return	1 : 존재함, -1 : 존재하지 않음 / 벤당한 아이피로 접속
	 */
	int userIdPwCheck(HttpServletRequest request,ErrorAlarm ea,ElasticSearchConn ec, CommonDate cd, KafkaConn kc);
	
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
	 * @param ea
	 * @return
	 */
	int modifyCookie(HttpServletRequest request, HttpServletResponse response, String addUrl, KakaoCookie kc,ErrorAlarm ea);
	
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
	 * @param cdao
	 * @param rc
	 * @param ea
	 * @return
	 */
	int getCapcharData(HttpServletRequest request, CommonDAO cdao, ReCaptcha rc, ErrorAlarm ea);
	
	
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
	 * @param ea
	 * @return
	 */
	String getLoginStayYn(HttpServletRequest request,HttpServletResponse response,KakaoCookie kc,RSAalgorithm rsa, ErrorAlarm ea);
	
	
	/**
	 * 로그인 관련 서비스 메서드
	 * @param request
	 * @param response
	 * @param ic
	 * @param ea
	 * @param kc
	 * @return
	 */
	String loginVerifyLogic(HttpServletRequest request, HttpServletResponse response,IpCheck ic, ErrorAlarm ea, KakaoCookie kc);
	
	/**
	 * QR 관련 로직
	 * @param request
	 * @param response
	 * @param ic
	 * @param ea
	 * @return
	 */
	int loginGetQr(HttpServletRequest request, HttpServletResponse response, IpCheck ic, ErrorAlarm ea);

	
	/**
	 * QR 관련 로직 - 모바일 기기에서 아이디 체킹
	 * @param request
	 * @param response
	 * @param ea
	 * @param kc
	 * @param au
	 * @param sf
	 * @param cw
	 * @return
	 */
	int loginQrChecking(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, KakaoCookie kc, AES256Util au, StringFormatClass sf, CommonWebsocket cw);
	
	/**
	 * QR 코드 통과한 후 로그인 권한 부여
	 * @param request
	 * @param response
	 * @param qrCheckUserId	회원의 아이디
	 * @param ea 에러처리 클래스
	 * @return
	 */
	int grantResult(HttpServletRequest request, HttpServletResponse response, int qrCheckUserId, ErrorAlarm ea);

	
	/**
	 * QR 코드 모바일 기기로 접근하는 처음경우 uuid 등 기본정보 조회
	 * @param request
	 * @param response
	 * @param kc
	 * @param au
	 * @param sf
	 * @param ea
	 * @param cw
	 * @param cdao
	 * @return	1: 정상, -1: 실패(오류), -2: 아이디 존재하지 않음(회원의 고유번호 존재하지 않음), -3: uuid 자체가 존재하지 않음
	 */
	int loginQrPrevCheck(HttpServletRequest request, HttpServletResponse respons,KakaoCookie kc,AES256Util au,StringFormatClass sf, ErrorAlarm ea, CommonWebsocket cw, CommonDAO cdao);
	
	
	/**
	 * 모바일기기에서 아이디 체킹하는 작업 -> QR 로그인 허용하지 않음
	 * @param request
	 * @param ea
	 * @param cw
	 * @return
	 */
	int loginQrCheckingNotAgree(HttpServletRequest request,ErrorAlarm ea, CommonWebsocket cw);
	
	/**
	 * 자동로그인 방지 실패한 경우의 로직
	 * @param request
	 * @param ea
	 * @return
	 */
	int autoLoginBanned(HttpServletRequest request, ErrorAlarm ea);
	
	/**
	 * QR code 생성해주기
	 * @param request
	 * @param CommonWebsocket
	 * @param ea
	 * @return
	 */
	int getPrintQrCode(HttpServletRequest request, CommonWebsocket cw, ErrorAlarm ea);
	
	/**
	 * QR 로그인 마지막단계 - qr 로그인 시도하는 디바이스에서 로그인을 허용할지 허용하지 않을지 정해준다.
	 * @param request
	 * @param response
	 * @param ea
	 * @param cw
	 * @param ic
	 * @param kc
	 * @return
	 */
	String getQrDevicePassYn(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, CommonWebsocket cw, IpCheck ic, KakaoCookie kc);
	
	/**
	 * 로그인 검증
	 * @param request
	 * @param response
	 * @param ic
	 * @param ea
	 * @param ec
	 * @param cd
	 * @param dtos
	 * @return
	 */
	LoginDTO loginVerifyLogicNew(HttpServletRequest request, HttpServletResponse response, IpCheck ic, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd, LoginDTO dtos);
	
	/**
	 * 로그인 인증티켓 발급
	 * @param request
	 * @param response
	 * @param kc
	 * @param ic
	 * @param ea
	 * @param userSeq
	 * @return
	 */
	int loginSuccessNew(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc, IpCheck ic, ErrorAlarm ea, AES256Util au, StringBuffer sb ,int userSeq);
	
	/**
	 * 로그인 문제 없을 경우에 url 돌려주기
	 * @param request
	 * @param kc
	 * @param ea
	 * @param logResult
	 * @param userLog
	 * @return
	 */
	String loginPassBasic(HttpServletRequest request, KakaoCookie kc, ErrorAlarm ea, int logResult, int userLog);
	
	/**
	 * 유저 로그인 로그로 남기기
	 * @param request
	 * @param ea
	 * @param ec
	 * @param cd
	 * @param ip
	 * @return
	 */
	int loginUserPassLog(HttpServletRequest request, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd, String ip);
	

	

	



	

	
	
	
	
	

	
	
	
}
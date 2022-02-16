package com.test.SYJ_Mall.login;

import java.security.PrivateKey;
import java.util.List;

import com.common.utill.AdverDTO;
import com.test.SYJ_Mall.popularItem.UserProductDTO;

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

	
	/**
	 * 회원이 입력한 id가 중복되지 않는지 체크
	 * @param inputId	회원이 회원가입 하기 위해 입력한 아이디
	 * @return			-1 : 사용가능 불가, 1 : 사용가능
	 */
	int signUpIdVerifyCheck(String inputId);

	/**
	 * 회원이 입력한 email이 중복되지 않는지 체크
	 * @param fullEmail		회원이 사용할 이메일 아이디
	 * @return				1 : 성공, -1 : 실패
	 */
	int emailVerifyCheck(String fullEmail);

	/**
	 * 에러요건 디비에 넣어주기
	 * @param errormsg	에러요인
	 * @param ip		에러발생시킨 아이피
	 */
	void errorIntoDb(String errormsg, String ip);

	/**
	 * 유저 아이디 찾아주기
	 * @param email	유저 이메일
	 * @param phone	유저 폰번호
	 * @return		유저 아이디
	 */
	String findUserId(String email, String phone);

	/**
	 * 유저 비밀번호 찾기전 해당 아이디가 존재하는지 확인하는 작업
	 * @param userId	유저 아이디	
	 * @param userEmail	유저 이메일주소
	 * @param userPhone	유저 폰번호
	 * @return			1 : 존재, -1 : 존재하지 않음
	 */
	int findUserPwExist(String userId, String userEmail, String userPhone);

	/**
	 * 비밀번호를 찾고자하는 유저의 비밀번호를 임시비밀번호로 바꾸어준다.
	 * @param userId		유저의 아이디
	 * @param userEmail		유저의 이메일
	 * @param userPhone		유저의 핸드폰번호
	 * @param encInstPw		유저의 임시아이디(암호화된 값)
	 * @return				1 : 성공, -1 : 실패
	 */
	int modifyUserPw(String userId, String userEmail, String userPhone, String encInstPw);

	/**
	 * 회원가입 - 고객이 입력한 전화번호가 중복되지 않는지 체크한다.
	 * @param userPhoneNum	고객의 전화번호
	 * @return				1 : 중복안됨, -1 : 중복
	 */
	int phoneVerifyCheck(String userPhoneNum);

	/**
	 * 고객의 비밀번호 재지정 + 임시비밀번호 정보 변경 + 로그인 정보 로그테이블에 기록
	 * @param userSeq	고객의 고유변호
	 * @param userPw	고객의 비밀번호
	 * @param userId	고객의 아이디
	 * @param userIp	고객의 아이피주소
	 * @return
	 */
	int modifyUserPwReal(int userSeq, String userPw, String userId, String userIp);

	/**
	 * 프론트단 회원 아이디 비밀번호 검증
	 * @param ip	회원의 아이피주소
	 * @param id	회원의 아이디
	 * @param pw	회원의 비밀번호
	 * @return		1 : 존재, -1 : 비밀번호,아이디 잘못되었거나, 아이피 벤
	 */
	int firstLoginCheck(String ip, String id, String pw);

	
	/**
	 * 고객의 비밀번호 재지정 + 임시비밀번호 정보 변경
	 * @param userSeq	고객의 고유변호
	 * @param userPw	고객의 비밀번호
	 * @return
	 */
	int modifyUserPwRealNew(int userSeq, String userPw);
	
	
	/**
	 * 회원의 장바구니와 쿠키 장바구니를 비교
	 * @param userSeq	회원번호
	 * @return			새로 추가해야할 상품번호 리스트
	 */
	List<UserProductDTO> getCookieProductId(int userSeq);

	/** 
	 * 쿠키에존재하는 상품 회원의 디비로 모두 넣어주기(지운적없는 새로운 상품목록)
	 * @param userSeq			회원고유번호
	 * @param newBasketList		쿠키에 존재하는 상품리스트
	 * @return					1: 성공, -1 : 실패
	 */
	int setCookieToDbBasketListNondeleted(int userSeq, String newBasketList);

	/**
	 * 쿠키에존재하는 상품 회원의 디비로 모두 넣어주기(지운적없는 있는 상품목록)
	 * @param userSeq			회원고유번호
	 * @param newBasketList		쿠키에 존재하는 상품리스트
	 * @return					1: 성공, -1 : 실패
	 */
	int setCookieToDbBasketListDeleted(int userSeq, String newBasketList);

	
	/**
	 * 로그인 유지를 위해 DB에 secureKey 를 저장함.
	 * @param userSeq
	 * @param privateKey
	 * @return
	 */
	int saveRsaPrivateKey(int userSeq, String privateKeyEnc);

	/**
	 * 
	 * @param loginSaveUserSeq	고객번호
	 * @return
	 */
	String getUserSecureKey(int loginSaveUserSeq);

	
	/**
	 * QR 코드 인증 정보 만들어서 테이블에 넣기
	 * @param uuid				고유번호
	 * @param requestIpAddress	qr 요청한 ip 주소
	 * @return					1: 성공, -1: 실패
	 */
	int insertQrCheck(String uuid,String requestIpAddress);

	
	/**
	 * QR 코드 인증 - 모바일 기기 체크
	 * @param qruuid
	 * @param decodeQrSeqCode
	 * @return
	 */
	int checkingQrUserInfo(String qruuid, String decodeQrSeqCode);

	/**
	 * QR 코드 인증 - 유저SEQ 가져오기
	 * @param uuid
	 * @return
	 */
	int checkingQrUserGrant(String uuid);

	/**
	 * QR 코드 인증 - QR 코드 사용을 위해 QR url 생성후 테이블 정보에 QR 요청 정보가 있는지 확인해주기
	 * @param qruuid
	 * @param decodeQrSeqCode
	 * @return
	 */
	int checkPrevQrExists(String qruuid, String decodeQrSeqCode);

	/**
	 * QR 코드 인증 - uuid 정보와 유저 고유번호 정보가 제대로 존재하는 경우 유저아이디와 요청아이피를 받아와준다.
	 * @param qruuid
	 * @param decodeQrSeqCode
	 * @return
	 */
	List<LoginQrIdIpDTO> getUserQrIdIp(String qruuid, String decodeQrSeqCode);

	
	/**
	 * 타임아웃이 되거나 리프레쉬한 경우 기존의 uuid 정보를 db에서 제거해준다.
	 * @param uuid
	 * @return
	 */
	int deleteQrUuid(String uuid);




	
	
	
}

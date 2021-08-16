package com.test.SYJ_Mall.login;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.AdverDTO;
import com.common.utill.AutoLoginPic;
import com.common.utill.CommonDate;
import com.common.utill.Encryption;
import com.common.utill.IpCheck;
import com.common.utill.KakaoCookie;
import com.common.utill.RSAalgorithm;
import com.common.utill.SendEmail;
import com.common.utill.StringFormatClass;

/**
 * 로그인 서비스 객체
 * 
 * @author shin
 *
 */
@Service
public class LoginService implements ILoginService {

	@Autowired
	private ILoginDAO dao;

	@Override
	public String ipCheck(HttpServletRequest request) {// 접속자의 아이피를 체크함

		IpCheck ip = new IpCheck();

		return ip.getClientIP(request);
	}

	@Override
	public String pwEnc(String password) {// 접속자의 비밀번호를 변환

		Encryption enc = new Encryption();

		return enc.returnEncVoca(password);//
	}
	
	//맨처음 로그인할때 광고,rsa키 지정해주는곳
	@Override
	public int firstLoginStep(HttpServletRequest request,int errorCode,int comeCount) {
		
		int error = 0;//에러처리
		Random rnd = new Random();
		List<AdverDTO> dtoList = dao.getAdvertiseInfo();//광고관련
		IpCheck ic = new IpCheck();
		
		// 금액에 맞춰서 내보내야 하지만 -> 이건 후에 적용하고 지금은 "랜덤"으로 처리해준다.
		// ----광고관련----
		AdverDTO dto = dtoList.get(rnd.nextInt(dtoList.size()));
		String picName = dto.getAdpPcUrl();
		String url = dto.getAdUrl();

		HashMap<String, String> adverMap = new HashMap<String, String>();
		adverMap.put("picName", picName);
		adverMap.put("url", url);
		
		request.setAttribute("adverMap", adverMap);
		
		// ----광고관련----
		if(comeCount == 0) {
			request.setAttribute("comeCount", "SYJ_Mall");
		} 
		
		
		
		//로그인 에러 관련 : 벤당한 아이피로 로그인 시도를 한다거나 로그인 아이디/비밀번호가 틀렸을 경우
		if (errorCode == -1) {
			request.setAttribute("loginError", -1);
		} else {
			request.setAttribute("loginError", 0);
		}
		
		try {
			int result = setRSAkey(request);
		} catch(Exception e) {
			error = -1;
			errorEruptionTodb(e,ic.getClientIP(request));//오류가 발생하면 오류를 디비에 넣어준다.
		}
		
		return error;

	}
	
	
	@Override
	public List<LoginDTO> loginResult(String userIp, String id, String pw) {// 로그인 결과

		return dao.loginResult(userIp, id, pw);
	}

	@Override
	public HttpServletRequest AutoLoginBanned(HttpServletRequest request,int userSeq,String ip) {// 과거로그인 기록을 조회하여 마지막 로그인기록 아이피와 다른경우 자동로그인 방지 페이지로 이동한다.
																		 

		HttpSession userSession = request.getSession();// 유저의 세션객체를 만들어준다.
		userSession.setAttribute("userSeq", userSeq);
		userSession.setAttribute("userIp", ip);
		
		int sucessCount = 0;//사용자가 몇번 정답을 맞췄는지 알려줄것이다.
		int failCount = 0;//사용자가 몇번 틀렸는지 알려줄 것이다.
		userSession.setAttribute("sucessCount", sucessCount);// sucessCount 세션객체에 대입
		userSession.setAttribute("failCount", failCount);// failCount 세션객체에 대입

		AutoLoginPic autoLogin = new AutoLoginPic();
		String[] picNameKorEng = autoLogin.picName();// 어떤 사진을 줄건지 생각을 해야한다.
		List<String> picList = autoLogin.firstCall(9, picNameKorEng[1]);// 처음으로 가져와서 넘겨줄 사진

		userSession.setAttribute("selectPicName", picNameKorEng[1]);// 사진이름 넘긴다. -> 영어이름 넘길것이다.

		request.setAttribute("picList", picList);
		request.setAttribute("picName", picNameKorEng[0]);// 한글이름만 넘겨준다. -> 애는 requst 객체로 그림 한글이름만 넘겨준다.

		return request;
	}

	@Override
	public JSONObject picCheck(HttpServletRequest request) {//그림을 체크해주는것

		HttpSession userSession = request.getSession();
		int sucessCount = (Integer) userSession.getAttribute("sucessCount");//성공횟수
		int failCount = (Integer) userSession.getAttribute("failCount");//실패횟수
		
		String selectPicName = (String) userSession.getAttribute("selectPicName");// 정답 그림이름 -> 영어이름
		String throwPicName = request.getParameter("picName");// ajax 를 통해서 넘어온 그림의 이름
		String clickNum = request.getParameter("clickNum");// ajax 를 통해서 넘어온 태그 id명

		if (selectPicName.equals("airplane")) {
			if (throwPicName.contains("airplane")) sucessCount++;
			else failCount++;	
		} else if (selectPicName.equals("apartment")) {
			if (throwPicName.contains("apartment")) sucessCount++;
			else failCount++;
		} else if (selectPicName.equals("car")) {
			if (throwPicName.contains("car")) sucessCount++;
			else failCount++;
		} else if (selectPicName.equals("cat")) {
			if (throwPicName.contains("cat")) sucessCount++;
			else failCount++;
		} else if (selectPicName.equals("dog")) {
			if (throwPicName.contains("dog")) sucessCount++;
			else failCount++;
		} else if (selectPicName.equals("laptop")) {
			if (throwPicName.contains("laptop")) sucessCount++;
			else failCount++;
		} else if (selectPicName.equals("phone")) {
			if (throwPicName.contains("phone")) sucessCount++;
			else failCount++;
		} else if (selectPicName.equals("sea")) {
			if (throwPicName.contains("sea")) sucessCount++;
			else failCount++;
		}

		userSession.setAttribute("sucessCount", sucessCount);// 성공횟수를 세션에 다시 넣어주기
		userSession.setAttribute("failCount", failCount);// 카운트를 넣어주기

		JSONObject obj = new JSONObject();
		AutoLoginPic al = new AutoLoginPic();
		String selectPic = al.imgMakers();// 두번째로 불러올 이미지

		Map<Integer, String[]> map = al.picAnother(clickNum, selectPicName);
		obj.put("ansImg_1", map.get(0)[0]);
		obj.put("ansImg_1_value", map.get(0)[1]);
		obj.put("ansImg_2", map.get(1)[0]);
		obj.put("ansImg_2_value", map.get(1)[1]);
		obj.put("ansImg_3", map.get(2)[0]);
		obj.put("ansImg_3_value", map.get(2)[1]);

		obj.put("clickNum", clickNum);// 클릭한 태그명
		obj.put("selectPic", selectPic);// 클릭한 태그명에 새로운 사진 업데이트
		obj.put("sucessCount", sucessCount);//javascript 에 넘겨주기 위함 -> 성공횟수
		obj.put("failCount", failCount);//javascript 에 넘겨주기 위함 -> 실패횟수

		return obj;
	}

	@Override
	public void loginSuccess(HttpServletRequest request, int userSeq) {// 로그인 성공한 경우 - 인증티켓 발급

		HttpSession userSession = request.getSession();

		List<UserDTO> dto = dao.userInfo(userSeq);
		userSession.setAttribute("userinfo", dto.get(0));//유저 dto 객체를 session에 주입
		

	}


	@Override
	public void logUserTrace(int userSeq, String ipaddress) {// 자동로그인 방지 인증 후 로그인정보 남기기

		dao.autoLoginPassTrace(userSeq, ipaddress);

	}

	@Override
	public int userSignUp(HttpServletRequest request,SignUpDTO dto) throws NoSuchAlgorithmException, InvalidKeySpecException {// 회원가입 로직
		
		Map<String, String> map = getRSAkey(request);

		CommonDate comDate = new CommonDate();
		
		String qoouser_id = map.get("id");// 회원가입 아이디
		String qoouser_pw = pwEnc(map.get("pw"));// 암호화 해줘야한다. -> 회원가입 비밀번호
		String qoouser_name = request.getParameter("name_input");// 회원가입 이름
		String qoouser_gender = request.getParameter("sex_input");// 회원가입 성별
		String qoouser_nation = request.getParameter("nation_input");// 회원가입 국가

		StringBuffer sb = new StringBuffer();
		sb.append(request.getParameter("yy_input"));
		sb.append("-");
		sb.append(request.getParameter("mm_input"));
		sb.append("-");
		sb.append(comDate.dateTypeConvert(request.getParameter("dd_input")));

		String qoouser_birthday = sb.toString();// 회원가입 생년월일
		String qoouser_phone_num = request.getParameter("phone_input");// 회원가입 전화번호

		sb.setLength(0);// StringBuffer 객체 초기화
		sb.append(request.getParameter("email_input_address"));
		sb.append("@");
		sb.append(request.getParameter("email_input_site"));

		String qoouser_email = sb.toString();// 회원가입 이메일주소
		String qoouser_receive_email = request.getParameter("email_agree_input");
		String qoouser_receive_sms = request.getParameter("sms_agree_input");

		String qoouser_ipaddress = ipCheck(request);

		dto = new SignUpDTO(qoouser_id,qoouser_pw,qoouser_name,qoouser_gender,qoouser_nation,
							qoouser_birthday,qoouser_phone_num,qoouser_email,qoouser_receive_email,
							qoouser_receive_sms,qoouser_ipaddress);

		int result = dao.signUp(dto);

		return result;
	}

	// 유저 아이디 확인
	@Override
	public int userSignUpIdVerify(HttpServletRequest request) {

		String inputId = request.getParameter("checkid");

		int result = dao.signUpIdVerifyCheck(inputId);

		return result;
	}

	// 유저 비밀번호 확인
	@Override
	public int userSignUpPwVerify(HttpServletRequest request) {
		
		String inputPw = request.getParameter("checkpw");
		
		// 1: pass , else : fail
		
		// 최소 8자, 최대 16자 상수 선언
	    final int MIN = 8;
	    final int MAX = 16;
		
	    // 영어, 숫자, 특수문자 포함한 MIN to MAX 글자 정규식
	    final String REGEX = "^((?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[\\W]).{" + MIN + "," + MAX + "})$";
	    
	    // 3자리 연속 문자 정규식
	    final String SAMEPT = "(\\w)\\1\\1";
	    // 공백 문자 정규식
	    final String BLANKPT = "(\\s)";
	    
	    // 정규식 검사객체
	    Matcher matcher;
		
	    // 공백 체크
	    if (inputPw == null || "".equals(inputPw)) {
	    	return -1;// -1 : 공백문제
	    }
	    
	    
	    // ASCII 문자 비교를 위한 UpperCase
	    String tmpPw = inputPw.toUpperCase();
	    // 문자열 길이
	    int strLen = tmpPw.length();
	    
	    // 글자 길이 체크
	    if (strLen > 16 || strLen < 8) {
	    	return -2;//-2 : 글자 길이 문제 
	    }
	    
	    // 공백 체크
	    matcher = Pattern.compile(BLANKPT).matcher(tmpPw);
	    if (matcher.find()) {
	    	return -1; // -1 : 공백문제
	    }

	    // 비밀번호 정규식 체크
	    matcher = Pattern.compile(REGEX).matcher(inputPw);
	    if (!matcher.find()) {
	    	return -3; // 정규식 문제 -> 대,소문자 특수기호
	    }

	    // 동일한 문자 3개 이상 체크
	    matcher = Pattern.compile(SAMEPT).matcher(tmpPw);
	    if (matcher.find()) {
	    	return -4;// 동일한문제 3개 이상 쓰기 금지
	    } 
	    
	    // ASCII Char를 담을 배열 선언
	    int[] tmpArray = new int[strLen];
	    
	    // Make Array
	    for (int i = 0; i < strLen; i++) {
	    	tmpArray[i] = tmpPw.charAt(i);
	    }	    
	    
	      // Validation Array
	    for (int i = 0; i < strLen - 2; i++) {
	      // 첫 글자 A-Z / 0-9
	      if ((tmpArray[i] > 47 && tmpArray[i + 2] < 58)
	          || (tmpArray[i] > 64 && tmpArray[i + 2] < 91)) {
	        // 배열의 연속된 수 검사
	        // 3번째 글자 - 2번째 글자 = 1, 3번째 글자 - 1번째 글자 = 2
	        if (Math.abs(tmpArray[i + 2] - tmpArray[i + 1]) == 1
	            && Math.abs(tmpArray[i + 2] - tmpArray[i]) == 2) {
	          char c1 = (char) tmpArray[i];
	          char c2 = (char) tmpArray[i + 1];
	          char c3 = (char) tmpArray[i + 2];
	          return -5;//연속된수 금지
	        }
	      }
	    }
		
	    //아무것도 걸리지 않으면 정상적으로 0을 반환시켜준다.
	    return 0;
		
	}
	
	
	// RSA 대칭키 생성
	@Override
	public int setRSAkey(HttpServletRequest request) throws NoSuchAlgorithmException, InvalidKeySpecException {

		RSAalgorithm rsa = new RSAalgorithm();

		rsa.setRSA(request);

		return 0;
	}

	// RSA 대칭키 - 복호화
	@Override
	public HashMap<String, String> getRSAkey(HttpServletRequest request) {
		
			RSAalgorithm rsa = new RSAalgorithm();
			
			HashMap<String, String> map = rsa.getRSA(request);
			
			return map;
			
		
	}
	
	// RSA 대칭키 - 복호화 - 세션유지
	@Override
	public HashMap<String, String> getRSAkeySessionStay(HttpServletRequest request) {
		
			RSAalgorithm rsa = new RSAalgorithm();
			
			HashMap<String, String> map = rsa.getRSASessionMaintain(request);
			
			return map;
			
	}
	
	
	//회원가입 - 유저 이메일 중복 확인
	@Override
	public int userEmailVerify(HttpServletRequest request) {
		
		String fullEmail = request.getParameter("fullEmail");
		
		int result = dao.emailVerifyCheck(fullEmail);
		
		return result;
	}
	

	
	//유저의 아이디를 찾아줌
	@Override
	public JSONObject findUserId(String email, String phone) {
		
		StringFormatClass sfc = new StringFormatClass();
		String userId = dao.findUserId(email,phone);
		
		if (userId != null) {
			userId = sfc.maskigId(userId);
		}
		
		phone = sfc.getPhoneNumHypoon(phone);
		
		JSONObject obj = new JSONObject();
		
		obj.put("userId", userId);
		obj.put("phone", phone);
		
		return obj;
	}
	
	//유저의 비밀번호를 찾기전에 아이디가 존재하는지 검증하는 작업
	@Override
	public int findUserPw(String userId, String userEmail, String userPhone) {
		
		return dao.findUserPwExist(userId,userEmail,userPhone);
	}
	
	//비밀번호 찾기 - 비밀번호를 변경하고 고객에게 임시비밀번호 발급
	@Override
	public int sendPw(String userId, String userEmail, String userPhone) {
		
		//임시비밀번호 생성
		Encryption enc = new Encryption();
		String instPw = enc.randomPw();//임시비밀번호
		String encInstPw = enc.returnEncVoca(instPw);//암호화된 임시비밀번호
		
		//디비에 접근해서 고객의 비밀번호 변경 -> 임시비밀번호로 변경한다.
		int modifyResult = dao.modifyUserPw(userId,userEmail,userPhone,encInstPw);
		
		if (modifyResult == 1) {
			//고객의 메일로 임시비밀번호 발급
			SendEmail se = new SendEmail();
			final String NVPW = "@*@#@@#&!!*@&*&@&!&&!!@+";
			final String NVID = "ssh9308@naver.com";
			
			StringBuffer sb = new StringBuffer();
			sb.append("안녕하세요\n");
			sb.append("고객님의 임시비밀번호는 : ");
			sb.append(instPw);
			sb.append(" 입니다.\n");
			sb.append("감사합니다.");
			
			se.sendMail("카카오 임시비밀번호 보내드립니다.", sb.toString(), NVID, NVPW, userEmail);
			
			return 1;
		} else {
			return -1;
		}

	}
	
	//로그인 - 유저가 임시비밀번호 발급받아서 새 비밀번호 지정이 필요함
	@Override
	public int userRedefinedPw(HttpServletRequest request, int userSeq, String ip) {
		
		HttpSession userSession = request.getSession();
		userSession.setAttribute("userSeq", userSeq);//유저 고유번호를 세션에 넘겨준다.
		
		try {
			int val = setRSAkey(request);
			return 1;
		} catch(Exception e) {
			errorEruptionTodb(e,ip);
			return -1;
		}
	}
	
	//회원가입 - 고객이 입력한 전화번호가 중복이 되는지 체크 
	@Override
	public int userPhoneNumVerify(HttpServletRequest request) {
		
		String userPhoneNum = request.getParameter("phoneNum");
		
		return dao.phoneVerifyCheck(userPhoneNum);
	}
	
	//고객이 직접 새로운 비밀번호 넘겨준곳
	@Override
	public int remodiftUserPw(HttpServletRequest request) {
		
		RSAalgorithm rsa = new RSAalgorithm();
		Encryption enc = new Encryption();
		String userPw = rsa.getRSAonlyPw(request);//유저가 설정해준 비밀번호에 대한 복호화 작업 수행 
		userPw = enc.returnEncVoca(userPw);//유저가 설정한 암호를 암호화 해준다.
		
		HttpSession userSession = request.getSession();
		int userSeq = (Integer)userSession.getAttribute("userSeq");
		

		userSession.invalidate();//세션값 자체를 제거
		
		
		//이제 여기서 유저의 임시비밀번호 기록을 지워야함. 그리고 비밀번호도 바꿔줘야함
		int result = dao.modifyUserPwRealNew(userSeq,userPw);
		
		
		return result;
	}
	
	//세션객체를 소멸시켜주는 메서드
	@Override
	public void sessionDelete(HttpServletRequest request) {
		
		HttpSession userSession = request.getSession();
		userSession.invalidate();//세션 완전히 삭제
		
	}

	//자동로그인 방지 통과 후 로그인 처리
	@Override
	public int autoLoginPassLogOn(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userSeq = (Integer)session.getAttribute("userSeq");
		String userIp = (String)session.getAttribute("userIp");
			
		loginSuccess(request,userSeq);//로그인 인증티켓 발급
		logUserTrace(userSeq,userIp);//로그인 기록 남겨주기
			
		session.removeAttribute("userSeq");
		session.removeAttribute("userIp");
		session.removeAttribute("picName");
		session.removeAttribute("clickNum");
		session.removeAttribute("sucessCount");
		session.removeAttribute("failCount");
			
		return 1;

	}
	
	//에러 발생했을때 디비에 넣어주기 
	@Override
	public void errorEruptionTodb(Exception e, String ip) {
		
		StringWriter errors = new StringWriter();
		e.printStackTrace(new PrintWriter(errors));
		
		dao.errorIntoDb(errors.toString(),ip);
	}
	
	//존재하는 아이디인지  체크 - 모달창 띄워줄것
	@Override
	public int userIdPwCheck(HttpServletRequest request) {
		
		String ip = "";
		
		try {
			request.setCharacterEncoding("UTF-8");//인코딩 타입 설정
			ip = ipCheck(request);//아이피 주소 체크
			
			Map<String,String> map = getRSAkeySessionStay(request);//세션에서 정보를 지우지는 않는다.
			
			String id = map.get("id");//아이디
			String pw = map.get("pw");//비밀번호
			
			String encPw = pwEnc(pw);//상대방이 입력한 pw를 암호화작업해준다.
			
			//여기서는 그냥 아이디 비밀번호가 있는지 없는지만 판단해준다. && 벤할지도 결정
			int result = dao.firstLoginCheck(ip,id,encPw);
			
			return result;
			
		} catch(Exception e) {
			errorEruptionTodb(e,ip);
			return 505;
		}
	}
	
	
	//임시쿠키객체 발급
	@Override
	public Object instanceCookie(HttpServletRequest request, HttpServletResponse response, String cookieName) {
		
		KakaoCookie ck = new KakaoCookie();
		Object result = ck.getCookieInfo(request, cookieName);
		ck.deleteCookie(request,response,cookieName);
		
		return result;
	}
	
	

	

	


	

	
	
	
	
	
}

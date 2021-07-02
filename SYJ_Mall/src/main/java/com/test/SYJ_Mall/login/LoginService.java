package com.test.SYJ_Mall.login;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.AdverDTO;
import com.common.utill.AutoLoginPic;
import com.common.utill.CommonDate;
import com.common.utill.Encryption;
import com.common.utill.IpCheck;
import com.common.utill.RSAalgorithm;
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

		return enc.returnEncVoca(password);
	}
	
	//맨처음 로그인할때 광고,rsa키 지정해주는곳
	@Override
	public int firstLoginStep(HttpServletRequest request,int errorCode,int comeCount) {
		
		int error = 0;
		Random rnd = new Random();
		List<AdverDTO> dtoList = dao.getAdvertiseInfo();

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
			e.printStackTrace();
		}
		
		return error;

	}
	
	
	@Override
	public List<LoginDTO> loginResult(String userIp, String id, String pw) {// 로그인 결과

		return dao.loginResult(userIp, id, pw);
	}

	@Override
	public HttpServletRequest AutoLoginBanned(HttpServletRequest request) {// 과거로그인 기록을 조회하여 마지막 로그인기록 아이피와 다른경우 자동로그인
																			// 방지 페이지로 이동한다.

		HttpSession userSession = request.getSession();// 유저의 세션객체를 만들어준다.
		int sucessCount = 0;// 사용자가 몇번 정답을 맞췄는지 알려줄것이다.
		userSession.setAttribute("sucessCount", sucessCount);// 세션객체에 대입

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
		int sucessCount = (Integer) userSession.getAttribute("sucessCount");

		String selectPicName = (String) userSession.getAttribute("selectPicName");// 정답 그림이름 -> 영어이름

		String throwPicName = request.getParameter("picName");// ajax 를 통해서 넘어온 그림의 이름
		String clickNum = request.getParameter("clickNum");// ajax 를 통해서 넘어온 태그 id명

		if (selectPicName.equals("airplane")) {
			if (throwPicName.contains("airplane"))
				sucessCount++;
		} else if (selectPicName.equals("apartment")) {
			if (throwPicName.contains("apartment"))
				sucessCount++;
		} else if (selectPicName.equals("car")) {
			if (throwPicName.contains("car"))
				sucessCount++;
		} else if (selectPicName.equals("cat")) {
			if (throwPicName.contains("cat"))
				sucessCount++;
		} else if (selectPicName.equals("dog")) {
			if (throwPicName.contains("dog"))
				sucessCount++;
		} else if (selectPicName.equals("laptop")) {
			if (throwPicName.contains("laptop"))
				sucessCount++;
		} else if (selectPicName.equals("phone")) {
			if (throwPicName.contains("phone"))
				sucessCount++;
		} else if (selectPicName.equals("sea")) {
			if (throwPicName.contains("sea"))
				sucessCount++;
		}

		userSession.setAttribute("sucessCount", sucessCount);// 카운트를 넣어주기

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
		obj.put("sucessCount", sucessCount);

		return obj;
	}

	@Override
	public void loginSuccess(HttpServletRequest request, int userSeq) {// 로그인 성공한 경우

		HttpSession userSession = request.getSession();

		List<UserDTO> dto = dao.userInfo(userSeq);
		userSession.setAttribute("userinfo", dto.get(0));
		

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
	
	
	//회원가입 - 유저 이메일 중복 확인
	@Override
	public int userEmailVerify(HttpServletRequest request) {
		
		String fullEmail = request.getParameter("fullEmail");
		
		int result = dao.emailVerifyCheck(fullEmail);
		
		return result;
	}
	
	//에러발생요건 디비에 넣어주기
	@Override
	public void errorEruptionTodb(String errormsg, String ip) {
		
		dao.errorIntoDb(errormsg,ip);
		
	}
	
	//유저의 아이디를 찾아줌
	@Override
	public JSONObject findUserId(String email, String phone) {
		
		StringFormatClass sfc = new StringFormatClass();
		String userId = dao.findUserId(email,phone);
		
		if (userId != null) {
			userId = sfc.maskigId(userId);
		}
		
		phone = phone = sfc.getPhoneNumHypoon(phone);
		
		JSONObject obj = new JSONObject();
		
		obj.put("userId", userId);
		obj.put("phone", phone);
		
		return obj;
	}
	


	

	
	
	
	
	
}

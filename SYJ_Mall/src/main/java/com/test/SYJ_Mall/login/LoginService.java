package com.test.SYJ_Mall.login;

import java.net.URLEncoder;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;

import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.AES256Util;
import com.common.utill.AutoLoginPic;
import com.common.utill.CommonDAO;
import com.common.utill.CommonDate;
import com.common.utill.CommonDateFormat;
import com.common.utill.ElasticSearchConn;
import com.common.utill.Encryption;
import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.KafkaConn;
import com.common.utill.KakaoCookie;
import com.common.utill.MessageSender;
import com.common.utill.RSAalgorithm;
import com.common.utill.ReCaptchar;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.CommonWebsocket;
import com.test.SYJ_Mall.popularItem.UserProductDTO;

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
	//임시비밀번호 생성후 -> 메일로 보내주기
	public int emailCertify(HttpServletRequest request, StringFormatClass sfc, Encryption enc, MessageSender ms, ErrorAlarm ea) {
		
		try {
			
			String userId = request.getParameter("kakaoId");
			String userEmail = request.getParameter("kakaoMail");
			String userPhone = request.getParameter("kakaoPhone");
			
			// 임시비밀번호 생성
			String instPw = enc.randomPw();// 임시비밀번호
			String encInstPw = enc.returnEncVoca(instPw);// 암호화된 임시비밀번호		
			
			// 디비에 접근해서 고객의 비밀번호 변경 -> 임시비밀번호로 변경한다.
			int modifyResult = dao.modifyUserPw(userId, userEmail, userPhone, encInstPw);	
			
			if (modifyResult == 1) { 
				StringBuffer sb = new StringBuffer();
				sb.append("안녕하세요\n");
				sb.append("고객님의 임시비밀번호는 : ");
				sb.append(instPw);
				sb.append(" 입니다.\n");
				sb.append("감사합니다.");
				
				ms = new MessageSender("카카오 임시비밀번호 보내드립니다.", sb.toString(), userEmail);
				
				ms.sendDefaultMassage();
				
				String sendEmail = sfc.maskingMail(userEmail);
				request.setAttribute("sendEmail", sendEmail);
				
			}
			
			return modifyResult;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}

	}
	
	//이것도 안쓰면 뺄듯
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

	// 맨처음 로그인할때 rsa키 지정해주는곳
	@Override
	public int firstLoginStep(HttpServletRequest request, int errorCode, int comeCount, ErrorAlarm ea, RSAalgorithm rsa) {
		
		try {
		
			// 로그인 에러 관련 : 벤당한 아이피로 로그인 시도를 한다거나 로그인 아이디/비밀번호가 틀렸을 경우
			if (errorCode == -1) {
				request.setAttribute("loginError", -1);
			} else {
				request.setAttribute("loginError", 0);
			}
			
			rsa.setRSA(request);
			
			return 0;
		} catch (Exception e) {
			return ea.basicErrorException(request,e);
		}
	}

	@Override
	public List<LoginDTO> loginResult(String userIp, String id, String pw) {// 로그인 결과

		return dao.loginResult(userIp, id, pw);
	}

	@Override
	public HttpServletRequest AutoLoginBanned(HttpServletRequest request, int userSeq, String ip) {
		// 과거로그인 기록을 조회하여 마지막 로그인기록 아이피와 다른경우 자동로그인 방지 페이지로 이동한다.

		HttpSession userSession = request.getSession();// 유저의 세션객체를 만들어준다.
		userSession.setAttribute("userSeq", userSeq);
		userSession.setAttribute("userIp", ip);

		int sucessCount = 0;// 사용자가 몇번 정답을 맞췄는지 알려줄것이다.
		int failCount = 0;// 사용자가 몇번 틀렸는지 알려줄 것이다.
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
	public JSONObject picCheck(HttpServletRequest request,ErrorAlarm ea) {// 그림을 체크해주는것
		
		
		try {
			
			HttpSession userSession = request.getSession();
			int sucessCount = (Integer) userSession.getAttribute("sucessCount");// 성공횟수
			int failCount = (Integer) userSession.getAttribute("failCount");// 실패횟수

			String selectPicName = (String) userSession.getAttribute("selectPicName");// 정답 그림이름 -> 영어이름
			String throwPicName = request.getParameter("picName");// ajax 를 통해서 넘어온 그림의 이름
			String clickNum = request.getParameter("clickNum");// ajax 를 통해서 넘어온 태그 id명

			if (selectPicName.equals("airplane")) {
				if (throwPicName.contains("airplane"))
					sucessCount++;
				else
					failCount++;
			} else if (selectPicName.equals("apartment")) {
				if (throwPicName.contains("apartment"))
					sucessCount++;
				else
					failCount++;
			} else if (selectPicName.equals("car")) {
				if (throwPicName.contains("car"))
					sucessCount++;
				else
					failCount++;
			} else if (selectPicName.equals("cat")) {
				if (throwPicName.contains("cat"))
					sucessCount++;
				else
					failCount++;
			} else if (selectPicName.equals("dog")) {
				if (throwPicName.contains("dog"))
					sucessCount++;
				else
					failCount++;
			} else if (selectPicName.equals("laptop")) {
				if (throwPicName.contains("laptop"))
					sucessCount++;
				else
					failCount++;
			} else if (selectPicName.equals("phone")) {
				if (throwPicName.contains("phone"))
					sucessCount++;
				else
					failCount++;
			} else if (selectPicName.equals("sea")) {
				if (throwPicName.contains("sea"))
					sucessCount++;
				else
					failCount++;
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
			obj.put("sucessCount", sucessCount);// javascript 에 넘겨주기 위함 -> 성공횟수
			obj.put("failCount", failCount);// javascript 에 넘겨주기 위함 -> 실패횟수
			
			return obj;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return null;
		}
		
	}

	@Override
	public int loginSuccess(HttpServletRequest request,HttpServletResponse response, int userSeq) {// 로그인 성공한 경우 - 인증티켓 발급
		
		try {
			HttpSession userSession = request.getSession();

			List<UserDTO> dto = dao.userInfo(userSeq);
			userSession.setAttribute("userinfo", dto.get(0));// 유저 dto 객체를 session에 주입-??애가 왜 문제?
			
			KakaoCookie kc = new KakaoCookie();
			
			/* ================ master 모바일 기기 등록/확인 - 모바일 기기로 로그인한 경우 해당 모바일 기기에 정보남겨둔다. ================ */
			IpCheck ic = new IpCheck();
			int deviceCode = request.getParameter("deviceCode") == null ? -1 : Integer.parseInt(request.getParameter("deviceCode"));
			
			//모바일 기기인 경우
			if (deviceCode == 1) {
				AES256Util au = new AES256Util();
				StringBuffer sb = new StringBuffer();
				sb.append("userQrSeq");
				sb.append(userSeq);
				sb.append(";");
				String saveCookie = au.encrypt(sb.toString());//로그인한 회원정보 저장.
				
				kc.modifyCookie(request,response,"QrSeqCode",saveCookie,60 * 60 * 24 * 15);
			}
			
			/* ================ 쿠키 - db 연동작업(장바구니 정보) ================ */
			// 여기서 기존의 회원의 상품쿠키정보를 db로 연동시켜주는 작업이 필요함. -> 로그인이 성공한 경우 이므로
			String basketList = (String) kc.getCookieInfo(request, "basketList");

			// 쿠키객체안에 상품리스트가 있는경우에만 연동시켜줄것임
			if (basketList != null) {
				List<UserProductDTO> userList = dao.getCookieProductId(userSeq);// 회원이 장바구니로 보내준 물품
				List<Integer> userProdList = new ArrayList<Integer>();

				for (int i = 0; i < userList.size(); i++) {
					userProdList.add(userList.get(i).getProductId());
				}
				
				String[] cookieProductArr = basketList.split("#");// 쿠키에 남아있는 장바구니 물품목록
				List<Integer> newAddProduct = new ArrayList<Integer>();// 새롭게 회원 장바구니 db에 넣어줄 품목
				List<Integer> delAddProduct = new ArrayList<Integer>();// 새롭게 넣어줄 품목이긴 한데 기존에 회원이 삭제를 했던 상품인경우 -> 삭제값을 N으로 돌려줄것이다.


				for (int i = 0; i < cookieProductArr.length; i++) {
					if (!cookieProductArr[i].equals("")) {
						int cookieProductNum = Integer.parseInt(cookieProductArr[i]);

						int index = userProdList.indexOf(cookieProductNum);

						if (index == -1) {
							newAddProduct.add(cookieProductNum);
						} else if (userList.get(index).getDelYn().equals("Y")) {
							delAddProduct.add(cookieProductNum);
						}
					}
				}
				
				// 새로 넣어줄 물품이 존재하지 않는 경우
				if (newAddProduct.size() == 0 && delAddProduct.size() == 0) {
					return 1;
				}
				// 새로운 품목 넣어줘야 할 경우 -> 회원의 진짜 처음목록 (지웠던 적이 없는 목록)
				if (newAddProduct.size() != 0) {
					String newBasketList = productCookieList(newAddProduct);
					return dao.setCookieToDbBasketListNondeleted(userSeq, newBasketList);
				}
				// 새로운 품목 넣어줘야 할 경우 -> 지웠던 적이 있는 목록
				if (delAddProduct.size() != 0) {
					String newBasketList = productCookieList(delAddProduct);
					return dao.setCookieToDbBasketListDeleted(userSeq, newBasketList);
				}
			}//if
			
			// 쿠키객체안에 상품리스트가 없는경우
			else {
				return 1;
			}
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;//오류 발생
		}
		
		return -1;

	}
	
	//로그인 완료
	@Override
	public int loginSuccessNew(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc, IpCheck ic, ErrorAlarm ea, AES256Util au, StringBuffer sb, int userSeq) {
		try {
			
			HttpSession userSession = request.getSession();

			List<UserDTO> dto = dao.userInfo(userSeq);
			userSession.setAttribute("userinfo", dto.get(0));//유저 dto 객체를 session에 주입
	
			/* ================ master 모바일 기기 등록/확인 - 모바일 기기로 로그인한 경우 해당 모바일 기기에 정보남겨둔다. ================ */
			int deviceCode = request.getParameter("deviceCode") == null ? -1 : Integer.parseInt(request.getParameter("deviceCode"));
			kc = new KakaoCookie();
			
			//모바일 기기인 경우
			if (deviceCode == 1) {
				au = new AES256Util();
				sb = new StringBuffer();
				sb.append("userQrSeq");
				sb.append(userSeq);
				sb.append(";");
				
				String saveCookie = au.encrypt(sb.toString());//로그인한 회원정보 저장.
				
				kc.modifyCookie(request,response,"QrSeqCode",saveCookie,60 * 60 * 24 * 15);
			}
			
			/* ================ 쿠키 - db 연동작업(장바구니 정보) ================ */
			// 여기서 기존의 회원의 상품쿠키정보를 db로 연동시켜주는 작업이 필요함. -> 로그인이 성공한 경우 이므로
			String basketList = (String) kc.getCookieInfo(request, "basketList");
			
			// 쿠키객체안에 상품리스트가 있는경우에만 연동시켜줄것임
			if (basketList != null) {
				List<UserProductDTO> userList = dao.getCookieProductId(userSeq);// 회원이 장바구니로 보내준 물품
				List<Integer> userProdList = new ArrayList<Integer>();

				for (int i = 0; i < userList.size(); i++) {
					userProdList.add(userList.get(i).getProductId());
				}
				
				String[] cookieProductArr = basketList.split("#");// 쿠키에 남아있는 장바구니 물품목록
				List<Integer> newAddProduct = new ArrayList<Integer>();// 새롭게 회원 장바구니 db에 넣어줄 품목
				List<Integer> delAddProduct = new ArrayList<Integer>();// 새롭게 넣어줄 품목이긴 한데 기존에 회원이 삭제를 했던 상품인경우 -> 삭제값을 N으로 돌려줄것이다.


				for (int i = 0; i < cookieProductArr.length; i++) {
					if (!cookieProductArr[i].equals("")) {
						int cookieProductNum = Integer.parseInt(cookieProductArr[i]);

						int index = userProdList.indexOf(cookieProductNum);

						if (index == -1) {
							newAddProduct.add(cookieProductNum);
						} else if (userList.get(index).getDelYn().equals("Y")) {
							delAddProduct.add(cookieProductNum);
						}
					}
				}
				
				// 새로 넣어줄 물품이 존재하지 않는 경우
				if (newAddProduct.size() == 0 && delAddProduct.size() == 0) {
					return 1;
				}
				// 새로운 품목 넣어줘야 할 경우 -> 회원의 진짜 처음목록 (지웠던 적이 없는 목록)
				if (newAddProduct.size() != 0) {
					String newBasketList = productCookieList(newAddProduct);
					return dao.setCookieToDbBasketListNondeleted(userSeq, newBasketList);
				}
				// 새로운 품목 넣어줘야 할 경우 -> 지웠던 적이 있는 목록
				if (delAddProduct.size() != 0) {
					String newBasketList = productCookieList(delAddProduct);
					return dao.setCookieToDbBasketListDeleted(userSeq, newBasketList);
				}
			}//if
			
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return ea.basicErrorException(request, e);
		}
	}
	

	// 상품정보 리스트 #붙여서 반환
	@Override
	public String productCookieList(List<Integer> list) {

		StringBuffer sb = new StringBuffer();

		for (int productSeq : list) {
			sb.append(Integer.toString(productSeq));
			sb.append("#");
		}

		String newBasketList = sb.toString();
		newBasketList = newBasketList.substring(0, newBasketList.length() - 1);

		return newBasketList;
	}

	@Override
	public void logUserTrace(int userSeq, String ipaddress) {// 자동로그인 방지 인증 후 로그인정보 남기기

		dao.autoLoginPassTrace(userSeq, ipaddress);

	}
	
	// 회원가입 로직
	@Override
	public int userSignUp(HttpServletRequest request, SignUpDTO dto, CommonDate comDate, StringBuffer sb, ErrorAlarm ea) {
		
		try {
			Map<String, String> map = getRSAkey(request);

			String qoouser_id = map.get("id");// 회원가입 아이디
			String qoouser_pw = pwEnc(map.get("pw"));// 암호화 해줘야한다. -> 회원가입 비밀번호
			String qoouser_name = request.getParameter("name_input");// 회원가입 이름
			String qoouser_gender = request.getParameter("sex_input");// 회원가입 성별
			String qoouser_nation = request.getParameter("nation_input");// 회원가입 국가
			
			sb = new StringBuffer();
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
			
			String qoouser_addr_info = request.getParameter("addr_input_first"); 
			String qoouser_addr_info_detail = request.getParameter("addr_input_second");
			String qoouser_ipaddress = ipCheck(request);
			
			dto = new SignUpDTO(qoouser_id, qoouser_pw, qoouser_name, qoouser_gender, qoouser_nation, qoouser_birthday,
					qoouser_phone_num, qoouser_email, qoouser_receive_email, qoouser_receive_sms, qoouser_ipaddress, qoouser_addr_info,
					qoouser_addr_info_detail);

			return dao.signUp(dto);
		} catch(Exception e) {
			ea.basicErrorException(request,e);
			return -1;
		}
		
		

	}

	// 유저 아이디 확인
	@Override
	public int userSignUpIdVerify(HttpServletRequest request, ErrorAlarm ea) {
		
		try {
			String inputId = request.getParameter("checkid");
			
			return dao.signUpIdVerifyCheck(inputId);
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}

	// 유저 비밀번호 확인
	@Override
	public int userSignUpPwVerify(HttpServletRequest request, ErrorAlarm ea) {
		
		
		try {
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
				return -2;// -2 : 글자 길이 문제
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
				if ((tmpArray[i] > 47 && tmpArray[i + 2] < 58) || (tmpArray[i] > 64 && tmpArray[i + 2] < 91)) {
					// 배열의 연속된 수 검사
					// 3번째 글자 - 2번째 글자 = 1, 3번째 글자 - 1번째 글자 = 2
					if (Math.abs(tmpArray[i + 2] - tmpArray[i + 1]) == 1 && Math.abs(tmpArray[i + 2] - tmpArray[i]) == 2) {
						char c1 = (char) tmpArray[i];
						char c2 = (char) tmpArray[i + 1];
						char c3 = (char) tmpArray[i + 2];
						return -5;// 연속된수 금지
					}
				}
			}

			// 아무것도 걸리지 않으면 정상적으로 0을 반환시켜준다.
			return 0;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		

	}

	// RSA 대칭키 생성 -> 굳이 매소드로 만들어줘야 하나? 일단 검토
	@Override
	public int setRSAkey(HttpServletRequest request, ErrorAlarm ea) {
		
		try {
			RSAalgorithm rsa = new RSAalgorithm();
			rsa.setRSA(request);

			return 1;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
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

	// 회원가입 - 유저 이메일 중복 확인
	@Override
	public int userEmailVerify(HttpServletRequest request,ErrorAlarm ea) {
		
		try {
			
			String fullEmail = request.getParameter("fullEmail");
			return dao.emailVerifyCheck(fullEmail);
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
			
		}
	}

	// 유저의 아이디를 찾아줌
	@Override
	public LoginFindIdDTO findUserId(HttpServletRequest request,ErrorAlarm ea, StringFormatClass sfc , LoginFindIdDTO dto) {

		try {
			String email = request.getParameter("inputmail");
			String phone = request.getParameter("inputphone");
			
			String userId = dao.findUserId(email, phone);

			if (userId != null) {
				userId = sfc.maskigId(userId);
			}
			
			phone = sfc.getPhoneNumHypoon(phone);
			
			dto = new LoginFindIdDTO(userId,phone);
			
			return dto;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return null;
		}	
	}
	
	//유저의 아이디 찾기 - 정보 제공
	@Override
	public int findUserIdCheck(HttpServletRequest request, ErrorAlarm ea) {
		
		try {
			
			String userId = request.getParameter("throwUserId");
			String phone = request.getParameter("throwUserPhone");
			
			if (userId == null || phone == null) return -1;
			
			request.setAttribute("userId", userId);
			request.setAttribute("phone", phone);
			
			return 1;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
	

	// 유저의 비밀번호를 찾기전에 아이디가 존재하는지 검증하는 작업
	@Override
	public int findUserPw(HttpServletRequest request, ErrorAlarm ea) {
		
		try {
			
			String userId = request.getParameter("userId");
			String userEmail = request.getParameter("userEmail");
			String userPhone = request.getParameter("userPhone");
			
			return dao.findUserPwExist(userId, userEmail, userPhone);
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
	

	// 로그인 - 유저가 임시비밀번호 발급받아서 새 비밀번호 지정이 필요함
	@Override
	public int userRedefinedPw(HttpServletRequest request, int userSeq, String ip, ErrorAlarm ea) {

		HttpSession userSession = request.getSession();
		userSession.setAttribute("userSeq", userSeq);// 유저 고유번호를 세션에 넘겨준다.

		return setRSAkey(request,ea);
			
	}

	// 회원가입 - 고객이 입력한 전화번호가 중복이 되는지 체크
	@Override
	public int userPhoneNumVerify(HttpServletRequest request,ErrorAlarm ea) {
		
		try {
			
			String userPhoneNum = request.getParameter("phoneNum");

			return dao.phoneVerifyCheck(userPhoneNum);
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
	}

	// 고객이 직접 새로운 비밀번호 넘겨준곳
	@Override
	public int remodiftUserPw(HttpServletRequest request, RSAalgorithm rsa, Encryption enc, ErrorAlarm ea) {
		
		try {
			
			String userPw = rsa.getRSAonlyPw(request);// 유저가 설정해준 비밀번호에 대한 복호화 작업 수행
			userPw = enc.returnEncVoca(userPw);// 유저가 설정한 암호를 암호화 해준다.
			
			HttpSession userSession = request.getSession();
			int userSeq = (Integer) userSession.getAttribute("userSeq");
			
			userSession.invalidate();// 세션값 자체를 제거
			
			return dao.modifyUserPwRealNew(userSeq, userPw);
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}

	// 세션객체를 소멸시켜주는 메서드 -> 이게 쓰일지는 잘 모르겠네
	@Override
	public void sessionDelete(HttpServletRequest request) {

		HttpSession userSession = request.getSession();
		userSession.invalidate();// 세션 완전히 삭제

	}

	// 자동로그인 방지 통과 후 로그인 처리
	@Override
	public int autoLoginPassLogOn(HttpServletRequest request,HttpServletResponse response, ErrorAlarm ea) {
		
		try {
			
			HttpSession session = request.getSession();
			
			int userSeq = (Integer) session.getAttribute("userSeq");
			String userIp = (String) session.getAttribute("userIp");
			
			int result = loginSuccess(request, response ,userSeq);// 로그인 인증티켓 발급
			
			if (result == 1) {
				logUserTrace(userSeq, userIp);// 로그인 기록 남겨주기
				session.removeAttribute("userSeq");
				session.removeAttribute("userIp");
				session.removeAttribute("picName");
				session.removeAttribute("clickNum");
				session.removeAttribute("sucessCount");
				session.removeAttribute("failCount");
				
				return 1;
			} else {
				return -1;
			}
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
	}
	
	
	// Check if the ID exists.
	@Override
	public int userIdPwCheck(HttpServletRequest request, ErrorAlarm ea,ElasticSearchConn ec, CommonDate cd, KafkaConn kc) {

		try {
			
			request.setCharacterEncoding("UTF-8");// Setting the encoding type
			String ip = ipCheck(request);// IP Address Check

			Map<String, String> map = getRSAkeySessionStay(request);// Do not clear RSA key information from the session.

			String id = map.get("id");	// User ID
			String pw = map.get("pw");	// User PW
			String encPw = pwEnc(pw);	// Encrypts the User PW.
			
			CommonDateFormat cmd = new CommonDateFormat();
			
			// Send a message through kafkatopic
			//1. elasticsearch conn info -> login log write
			HashMap<String, Object> jsonob = new JSONObject();
			LocalDateTime curTimeUtc = cmd.getPresentTimeUTC();
			LocalDateTime curTimeKOR = curTimeUtc.plusHours(9);
			
			jsonob.put("@timestamp",cmd.formatStringTimeElastic(curTimeUtc));
			jsonob.put("ip",ip);
		
			// Sends a message to the specified kafkatopic.
			kc.kafkaSendMessage(jsonob.toString());
			
			String dateNameIndex = cmd.getDateElasticIndex("login_cnt_index",curTimeUtc);
			
			//2. Check the banned list. If it is not on the list, access is allowed.
			int bannedResult = dao.checkingIpBanned(ip,cmd.formatStringTime(curTimeKOR));
			if (bannedResult == 1) return 0;

			
			//3. It checks whether the user entered the correct ID and password.
			int idPasswdCheck = dao.checkingUserIdPwSimple(id,encPw);
			if (idPasswdCheck != -1) return 1;
			
			
			//4. If the password is incorrect, Check how many access attempts have been made with the IP.
			BoolQueryBuilder query = QueryBuilders.boolQuery();
			SearchRequest searchRequest = new SearchRequest();
			SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();
			
			String preDate = cmd.formatStringTimeElastic(curTimeUtc.plusSeconds(-300));
			String postDate = cmd.formatStringTimeElastic(curTimeUtc);
			
			query.must(QueryBuilders.termQuery("ip",ip));
			query.must(QueryBuilders.rangeQuery("@timestamp").gte(preDate));
			query.must(QueryBuilders.rangeQuery("@timestamp").lte(postDate));
			
			searchRequest.indices(dateNameIndex);
			sourceBuilder.query(query);
			searchRequest.source(sourceBuilder);
			
			SearchResponse srep = ec.getClient().search(searchRequest, RequestOptions.DEFAULT);
			long loginTyrCnt = srep.getHits().getTotalHits().value;
			
			System.out.println("loginTyrCnt : " + loginTyrCnt);
			
			// If access attempts are made more than four times within 15 seconds with a specific IP, access is prohibited with that IP. 
			if (loginTyrCnt >= 2) {
				// SP
				return dao.setIpBanned(ip,cmd.formatStringTime(curTimeKOR));
				
				//Account Temporarily Locked
				//return 0;
			} 
			
			// Other situations are considered abnormal.
			return -1;

		} catch (Exception e) {
			return ea.basicErrorException(request, e);
		}
	}

	// 임시쿠키객체 발급
	@Override
	public Object instanceCookie(HttpServletRequest request, HttpServletResponse response, String cookieName) {

		KakaoCookie ck = new KakaoCookie();
		Object result = ck.getCookieInfo(request, cookieName);
		ck.deleteCookie(request, response, cookieName);

		return result;
	}

	// 메인페이지 보내주기
	@Override
	public void goMain(HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO) session.getAttribute("userinfo");
		request.setAttribute("seleted", "today");

		int seq = 0;

		if (dto == null) {
			seq = 0;
		} else {
			seq = dto.getUserSeq();
		}
		request.setAttribute("seq", seq);

	}
	
	//url 인코딩작업
	@Override
	public String urlEncoder(String lastPage) {
		
		StringBuffer sb = new StringBuffer();
		
		try {
			
			for (int i = 0; i < lastPage.length(); i++) {
				
				if (Character.getType(lastPage.charAt(i))==5) {
					sb.append(URLEncoder.encode(lastPage.substring(i,i+1),"UTF-8"));
				} else {
					sb.append(lastPage.substring(i,i+1));
				}
				
			}
			
			return sb.toString();
			
		} catch(Exception e) {
			ErrorAlarm ea = new ErrorAlarm(e);
			ea.sendErrorMassegeAdmin();
			ea.inputErrorToDb();
			
			return null;
		}
	}
	
	//로그인 되어있는지 확인해주는 로직
	@Override
	public int loginChecking(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");// 유저객체
			
			//System.out.println(userInfo.getUserSeq());
			
			if (userInfo == null) return -1;
			else return 1;
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
	}
	
	//로그인 시 필요한 정보 쿠키에 저장해줄 매서드
	@Override
	public int modifyCookie(HttpServletRequest request, HttpServletResponse response, String addUrl,KakaoCookie kc, ErrorAlarm ea) {
		try {
			kc.deleteCookie(request, response, "lastPage");//기존에 있는 마지막 페이지를 지워준다.
			kc.generateUrlCookie(response, addUrl, 60 * 60 * 24 * 7);
			
			return 1;
		} catch(Exception e) {
			return ea.basicErrorException(request,e);
		}
		
	}
	
	//로그아웃 처리 수행
	@Override
	public String goLogOut(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			
			HttpSession session = request.getSession();
			session.removeAttribute("userinfo");// 로그인세션 지워주기
			
			KakaoCookie kc = new KakaoCookie();
			
			//로그인 관련 쿠키객체 모두 지워주기.
			kc.deleteCookie(request, response, "loginSaveUserId");
			kc.deleteCookie(request, response, "loginSaveUserPw");
			kc.deleteCookie(request, response, "loginSaveUserSeq");
			
			String lastPage = kc.getUrlCookieInfo(request);
			
			if (lastPage == null) {
				goMain(request);
				return "/tiles/mainStart.layout";// 메인페이지로 이동
			} 
			else if (lastPage.indexOf("?") != -1) {
				//인코딩 처리를 잘 해줘야한다.
				String url = urlEncoder(lastPage);
				return "redirect:/" + url;
			}
			else {
				return "forward:/" + lastPage + ".action";
			}
			
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return "none";
		}	
	}
	
	//로그인 관련 capchar
	@Override
	public int getCapcharData(HttpServletRequest request,CommonDAO cdao, ReCaptchar rc, ErrorAlarm ea) {
		
		try {
			
			String siteKey = request.getParameter("recaptcha");
			int adminSeq = 1;
			
			String secureKey =  cdao.getCaptchaPrivateKey(adminSeq);
			
			rc.setPublicKey(siteKey); 
			rc.setSecretKey(secureKey);
			
			return rc.verifyCaprcha(request);
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
	}
	
	//로그인 유지 관련 메서드
	@Override
	public int loginSaveYn(HttpServletRequest request, HttpServletResponse response, int userSeq) {
		try {
			
			int loginSave = -1; 
			loginSave = Integer.parseInt(request.getParameter("loginSave"));
			
			if (loginSave == -1) return -2;//로그인 유지 안함
			else {
				
				//로그인 유지 해줄것임.
				String securedUsername = request.getParameter("securedUsername");
				String securedPassword = request.getParameter("securedPassword");
				
				KakaoCookie kc = new KakaoCookie();
				
				kc.generateCookie(response, "loginSaveUserId", securedUsername, 60 * 60 * 24 * 3);
				kc.generateCookie(response, "loginSaveUserPw", securedPassword, 60 * 60 * 24 * 3);
				kc.generateCookie(response, "loginSaveUserSeq", Integer.toString(userSeq), 60 * 60 * 24 * 3);
				
				//DB 에 securedKey 를 저장해야함
				HttpSession session = request.getSession();
				PrivateKey privateKey = (PrivateKey)session.getAttribute("__rsaPrivateKey__");
				String privateKeyEnc = Base64.getEncoder().encodeToString(privateKey.getEncoded());
				
				
				int result = dao.saveRsaPrivateKey(userSeq,privateKeyEnc);
				
				return result;
				
			}
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;//오류 발생
		}
	}
	
	//로그인 유지 판단 -> 유지 체크 이후 로그인 검증 작업 진행.
	@Override
	public String getLoginStayYn(HttpServletRequest request,HttpServletResponse response,KakaoCookie kc,RSAalgorithm rsa, ErrorAlarm ea) {
		
		try {
			
			String ip = ipCheck(request);
			
			String loginSaveUserId = (String)kc.getCookieInfo(request, "loginSaveUserId");
			String loginSaveUserPw = (String)kc.getCookieInfo(request, "loginSaveUserPw");
			String loginSaveUserSeq = (String)kc.getCookieInfo(request, "loginSaveUserSeq");
			
			//로그인 유지하는 정보가 있는 경우
			if (loginSaveUserId != null && loginSaveUserPw != null && loginSaveUserSeq != null) {
				
				//여기에서 이제 로그인 유지 정보를 가져와주는 역할을 수행해야한다.
				String secureKeyEnc = dao.getUserSecureKey(Integer.parseInt(loginSaveUserSeq));
				
				KeyFactory keyFactory = KeyFactory.getInstance("RSA");
				byte[] bytePrivateKey = Base64.getDecoder().decode(secureKeyEnc.getBytes());
	            PKCS8EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(bytePrivateKey);
	            PrivateKey secureKey = keyFactory.generatePrivate(privateKeySpec);//암호화 키
				
	            HashMap<String, String> map = rsa.getRSASessionMaintainChoice(secureKey,loginSaveUserId,loginSaveUserPw);
	            
	            if (map == null) {
	            	
	            	kc.deleteCookie(request, response, "loginSaveUserId");
	            	kc.deleteCookie(request, response, "loginSaveUserPw");
	            	kc.deleteCookie(request, response, "loginSaveUserSeq");
	            	
	            	return "crash";
	            }
	            
	            String id = map.get("id");// 아이디
				String pw = map.get("pw");// 비밀번호
	            
				String encPw = pwEnc(pw);// 상대방이 입력한 pw를 암호화작업해준다.
				
				List<LoginDTO> loginResult = loginResult(ip, id, encPw);
				
				int userSeq = loginResult.get(0).getUserSeq();// 유저 고유 코드
				int loginCode = loginResult.get(0).getLoginCode();// 로그인 결과
				
				if (loginCode == 0 ) {// 로그인 성공

					int logResult = loginSuccess(request, response, userSeq);// 로그인 인증티켓 발급
					
					String lastPage = kc.getUrlCookieInfo(request);
					
					if (logResult == 1) {
						if (lastPage == null) {
							goMain(request);
							return "/tiles/mainStart.layout";// 메인페이지로 이동
						} 
						else if (lastPage.indexOf("?") != -1) {
							//인코딩 처리를 잘 해줘야한다.
							String url = urlEncoder(lastPage);
							return "redirect:/" + url;
						}
						else {
							return "forward:/" + lastPage + ".action";
						}
					} else {
						throw new Exception();
					}

				} else if (loginCode == 1) {// 로그인 성공 : 하지만 비밀번호를 변경해줘야한다.
					// 아래에서 기본적으로 정보와 rsa키를 넘겨야한다.
					int result = userRedefinedPw(request, userSeq, ip,ea);
					
					
					if (result == 1) {
						return "/login/UserLoginPwRedefine";
					} else
						return "/testwaiting/kakaoerror";// 문제생겼을시에 에러페이지로 이동

				} else if (loginCode == 2) {// 보안정책을 따라야하는 경우 --> 사진을 골라야한다.
					
					// 자동로그인 방지 알고리즘
					request = AutoLoginBanned(request, userSeq, ip);

					return "/login/UserAutoLoginCheck";

				} else {
					return "error";
				}
			}
			//로그인 유지하는 정보가 없을 경우
			else return "pass";//그냥 기존대로 로직 진행
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return "error";//오류 발생
		}
	}
	
	//로그인 관련 서비스 메서드 -> 직접적으로 로그인을 수행하고 티켓 세션을 주는 곳.
	@Override
	public String loginVerifyLogic(HttpServletRequest request, HttpServletResponse response,IpCheck ic, ErrorAlarm ea, KakaoCookie kc) {
		
		try {
			
			request.setCharacterEncoding("UTF-8");// 인코딩 타입 설정

			String ip = ic.getClientIP(request);
			Map<String, String> map = getRSAkeySessionStay(request);
			
			String id = map.get("id");// 아이디
			String pw = map.get("pw");// 비밀번호
			String encPw = pwEnc(pw);// 상대방이 입력한 pw 암호화
			
			List<LoginDTO> loginResult = loginResult(ip, id, encPw);
			int userSeq = loginResult.get(0).getUserSeq();// 유저 고유 코드
			int loginCode = loginResult.get(0).getLoginCode();// 로그인 결과
	
			//System.out.println(loginCode);
			int loginSave = loginSaveYn(request,response,userSeq);//로그인 유지 관련 함수
			
			if (loginCode == 0 && loginSave != -1) {// 로그인 성공

				int logResult = loginSuccess(request, response, userSeq);// 로그인 인증티켓 발급
				
				String lastPage = kc.getUrlCookieInfo(request);
				
				if (logResult == 1) {
					
					if (lastPage == null) {
						goMain(request);
						return "/tiles/mainStart.layout";// 메인페이지로 이동
					} 
					else if (lastPage.indexOf("?") != -1) {
						//인코딩 처리를 잘 해줘야한다.
						String url = urlEncoder(lastPage);
						return "redirect:/" + url;
					}
					else {
						return "forward:/" + lastPage + ".action";
					}
				} else {
					throw new Exception();
				}

			} else if (loginCode == 1 && loginSave != -1) {// 로그인 성공 : 하지만 비밀번호를 변경해줘야한다.
				// 아래에서 기본적으로 정보와 rsa키를 넘겨야한다.
				int result = userRedefinedPw(request, userSeq, ip, ea);
				
				if (result == 1) {
					return "/login/UserLoginPwRedefine";
				} else
					return "/testwaiting/kakaoerror";// 문제생겼을시에 에러페이지로 이동

			} else if (loginCode == 2 && loginSave != -1) {// 보안정책을 따라야하는 경우 --> 사진을 골라야한다.
				
				// 자동로그인 방지 알고리즘
				request = AutoLoginBanned(request, userSeq, ip);

				return "/login/UserAutoLoginCheck";

			} else {
				return "error";
			}
			
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return "error";//오류 발생
		}
	}
	
	//로그인 검증 - 새로운 버전
	@Override
	public LoginDTO loginVerifyLogicNew(HttpServletRequest request, HttpServletResponse response, IpCheck ic, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd, LoginDTO dtos) {
		
		try {
			
			request.setCharacterEncoding("UTF-8");// 인코딩 타입 설정

			String ip = ic.getClientIP(request);
			Map<String, String> map = getRSAkeySessionStay(request);
			
			String id = map.get("id");// 아이디
			String pw = map.get("pw");// 비밀번호
			String encPw = pwEnc(pw);// 상대방이 입력한 pw 암호화
			
			Calendar curTimeKor = cd.getPresentTimeKORCal();
			String curTimeString = cd.formatStringTimeElastic(curTimeKor);
			
			//1. 로그인 확인
			int userSeq = dao.checkingUserIdPwSimple(id,encPw);
			
			dtos.setUserSeq(userSeq);
			
			if (userSeq == -1) {
				dtos.setLoginCode(-1);
				return dtos; 
			}

			//2. 로그인 문제없을 경우 다른문제 확인
			int loginEtcChecking = dao.checkingUserIdPwEtc(ip,curTimeString,userSeq);
			
			
			//2-1. 로그인 성공했으나 비밀번호를 변경해야 하는 상태
			if (loginEtcChecking == 1) {
				dtos.setLoginCode(1);
				return dtos; 
			}
			
			//2-2. 로그인은 성공했으나 아이피 주소가 마지막 주소와 달라서 자동 로그인 검증과정을 거쳐야함
			else if (loginEtcChecking == 2) {
				dtos.setLoginCode(2);
				return dtos; 
			}
			
			//2-3. 문제없음
			else if (loginEtcChecking == 3) {
				
				dtos.setLoginCode(3);
				return dtos; 
				
			} else {
				dtos.setLoginCode(-1);
				return dtos; 
			}
			
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			dtos.setLoginCode(-1);
			
			return dtos;
		}
	}
	
	//QR 관련 로직 -> QR관련 url을 생성해준다.
	@Override
	public int loginGetQr(HttpServletRequest request, HttpServletResponse response, IpCheck ic, ErrorAlarm ea) {
		
		try {
			
			//qr 시도하는 컴퓨터측 ip 정보
			String requestIpAddress = ic.getClientIP(request);//qr 로그인 시도하는 컴퓨터측 ip 정보
			
			//현재 열려있는 서버포트
			int serverPort = request.getServerPort();
			
			request.setAttribute("serverPort", serverPort);
			request.setAttribute("requestIpAddress", requestIpAddress);
			
			return 1;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;//오류 발생
		}
	}
	
	//QR 코드 모바일 기기로 접근하는 처음경우 uuid 등 기본정보 조회
	@Override
	public int loginQrPrevCheck(HttpServletRequest request, HttpServletResponse response,KakaoCookie kc,AES256Util au,StringFormatClass sf, ErrorAlarm ea, CommonWebsocket cw, CommonDAO cdao) {
		try {
			
			String qruuid = request.getParameter("qrhttps");//넘어온 uuid 정보
			String tryIp = request.getParameter("tryip");//넘어온 시도 ip 정보
			String QrSeqCode = (String) kc.getCookieInfo(request, "QrSeqCode");
			String decodeQrSeqCode;
			
			// 최근 15일동안 모바일에서 로그인한 기록이 없음
			if (QrSeqCode == null) {
				return 2;
			} 
			// 최근 15일 이내에 모바일에서 로그인한 기록이 있음
			else {
				decodeQrSeqCode = sf.findDigitString(au.decrypt(QrSeqCode));//고객번호가 암호화 되어있는데 이것을 복호화 시킨다.
				
				//확인창 화면에서 정보를 볼수 있도록 request 객체에 넘겨준다.
				request.setAttribute("QrSeqCode",QrSeqCode);//고객번호가 그냥 넘어가면 안되므로 암호화 상태로 넘겨준다.
				request.setAttribute("qruuid",qruuid);
				
				//고객번호가 이상한 경우 -> 숫자가 아닌 경우(공격시도로 볼 수 있음)
				if (!sf.isStringDigit(decodeQrSeqCode)) return -1;
				
				// 넘어온 uuid 에 대한 정보가 현재 소켓 세션에도 존재하는지 찾아준다.
				Map<String,String> guidLists = cw.guidLists;
				if (guidLists.get(qruuid) == null) return 2; 
				
				// 소켓에 저장된 uuid에 대해서 문제가 없다면 해당 아이피와 유저의 번호가 문제없는지 확인해준다.
				int userCheck = dao.checkUserPassYn(decodeQrSeqCode,tryIp);
				
				if (userCheck != 1) return -1;//문제 있는경우 오류 발생
				
				String userId = cdao.getUserId(Integer.parseInt(decodeQrSeqCode));//db 단에서 정보를 조회해준다.
				cdao.close();
				
				request.setAttribute("qrUserId",userId);
				request.setAttribute("qrUserIp",tryIp);
				
			}
			
			return 1;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;//오류 발생
		}
	}
	

	//모바일기기에서 아이디 체킹하는 작업 -> QR 로그인 허용
	@Override
	public int loginQrChecking(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, KakaoCookie kc, AES256Util au, StringFormatClass sf, CommonWebsocket cw) {
		
		try {
			
			String qruuid = request.getParameter("qruuid");//넘어온 uuid 정보
			String QrSeqCode = request.getParameter("QrSeqCode");//유저 고유번호
			String decodeQrSeqCode = sf.findDigitString(au.decrypt(QrSeqCode));//유저 고유번호 복호화
			
			//이쪽에서 로그인 허용해줘야한다.
			Map<String,String> guidLists = cw.guidLists;
			List<Session> sessionLists = cw.sessionLists;
			Map<String,String> guidUserSeqMap = cw.guidUserSeqMap;
			
			Session selectSession = null;
			
			String sessionId = guidLists.get(qruuid);
			
			for (Session s : sessionLists) {
				if (s.getId().equals(sessionId)) {
					selectSession = s;
					break;
				}
			}
			
			//허용을 해준다면 해당 세션아이디와 복호화된 고객의 고유번호를 넘겨준다
			guidUserSeqMap.put(sessionId, decodeQrSeqCode);
			
			final Basic basic = selectSession.getBasicRemote();
			basic.sendText("qruuid," + qruuid);
			
			request.setAttribute("qrResult", "허용");
			
			return 1;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;//오류 발생
		}
	}
	
	//모바일기기에서 아이디 체킹하는 작업 -> QR 로그인 허용하지 않음
	@Override
	public int loginQrCheckingNotAgree(HttpServletRequest request, ErrorAlarm ea, CommonWebsocket cw) {
		try {
			
			String qruuid = request.getParameter("qr_uuid");//넘어온 uuid 정보
			
			List<Session> sessionLists = cw.sessionLists;
			Map<String,String> guidLists = cw.guidLists;
			
			String sessionId = guidLists.get(qruuid);
			
			for (Session s : sessionLists) {
				if (s.getId().equals(sessionId)) {
					
					final Basic basic = s.getBasicRemote();
					basic.sendText("stop," + qruuid);
					
					break;
				}
			}
			
			request.setAttribute("qrResult", "비허용");
			
			return 1;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;//오류 발생
		}
	}
	
	//QR 코드로 로그인 하는 경우 로그인 성공 경우에 유저 객체 정보 반환
	@Override
	public int grantResult(HttpServletRequest request, HttpServletResponse response, int qrCheckUserId,ErrorAlarm ea) {
		
		try {
			
			return loginSuccess(request, response, qrCheckUserId);//로그인 성공처리 해준다.
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;//오류 발생
		}
	}
	
	//자동 로그인 방지통과하지 못한 경우의 처리
	@Override
	public int autoLoginBanned(HttpServletRequest request, ErrorAlarm ea) {
		
		try {
			HttpSession session = request.getSession();
			int failCount = (Integer) session.getAttribute("failCount");
			
			session.invalidate();// 세션 완전히 삭제
			
			if (failCount != 3) return -1;
			
			return 1;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
	
	//Qr code 생성 - 확인(테스트용)
	@Override
	public int getPrintQrCode(HttpServletRequest request, CommonWebsocket cw, ErrorAlarm ea) {
		
		try {
			
			cw = new CommonWebsocket();
			
			List<Session> sessionLists = cw.sessionLists;
			Map<String,String> guidLists = cw.guidLists;
			
			for (int i = 0; i < sessionLists.size(); i++) {
				System.out.println(sessionLists.get(i).getId());
			}
			
			Iterator<String> keys = guidLists.keySet().iterator();
			
			while(keys.hasNext()) {
				String key = keys.next();
				//System.out.println( String.format("키 : %s, 값 : %s", key, guidLists.get(key)) );

			}

			return 1;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
		
	}
	
	
	//QR 로그인 마지막단계 - qr 로그인 시도하는 디바이스에서 로그인을 허용할지 말지 정해준다.
	@Override
	public String getQrDevicePassYn(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, CommonWebsocket cw, IpCheck ic, KakaoCookie kc) {
		
		try {
			
			String uuid = request.getParameter("throwUuid");//넘겨져온 uuid정보
			
			String ip = ic.getClientIP(request);
			
			Map<String,String> guidLists = cw.guidLists;
			Map<String,String> guidUserSeqMap = cw.guidUserSeqMap;
			
			String sessionId = guidLists.get(uuid);
			String userSeq = guidUserSeqMap.get(sessionId);
			
			//1. userSeq 가 존재하는지 판단하고 존재하지 않으면 오류발생으로 보낸다.
			//2. userSeq 가 존재한다면 해당 회원의 기본정보를 디비에서 조회해서 가져와준다.
			//3. 로그인 로직을 따른다.
			
			if (sessionId != null && userSeq != null) {
				
				int qrLoginResult = dao.getQrLoginResult(userSeq,ip);
				
				// 1. 정확하게 로그인 성공한 경우
				if (qrLoginResult == 0) {
					int loginYn = loginSuccess(request, response, Integer.parseInt(userSeq));// 로그인 인증티켓 발급
					
					if (loginYn == -1) return "error";
					
					String lastPage = kc.getUrlCookieInfo(request);
					
					if (lastPage == null) {
						goMain(request);
						return "/tiles/mainStart.layout";// 메인페이지로 이동
					} else if (lastPage.indexOf("?") != -1) {
						//인코딩 처리를 잘 해줘야한다.
						String url = urlEncoder(lastPage);
						return "redirect:/" + url;
					} else {
						return "forward:/" + lastPage + ".action";
					}
				} else if (qrLoginResult == 1) {
					// 2. 로그인 성공 : 하지만 비밀번호를 변경해줘야한다.
					// 아래에서 기본적으로 정보와 rsa키를 넘겨야한다.
					int result = userRedefinedPw(request, Integer.parseInt(userSeq), ip ,ea);
					
					if (result == 1) {
						return "/login/UserLoginPwRedefine";
					} else {
						return "/testwaiting/kakaoerror";// 문제생겼을시에 에러페이지로 이동
					}
				} else if (qrLoginResult == 2) {
					// 3. 보안정책을 따라야하는 경우 --> 사진을 골라야한다.
					
					//자동로그인 방지 알고리즘 실행
					request = AutoLoginBanned(request, Integer.parseInt(userSeq), ip);
					return "/login/UserAutoLoginCheck";
				} else return "error";
				
				
				
			} else return "error";
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return "error";
		}
	}
	
	//로그인 문제 없을 경우에 url 정보 돌려주기
	@Override
	public String loginPassBasic(HttpServletRequest request, KakaoCookie kc, ErrorAlarm ea, int logResult, int userLog) {
		try {
			
			String lastPage = kc.getUrlCookieInfo(request);

			if (logResult == 1 && userLog == 1) {
				if (lastPage == null) {
					goMain(request);
					return "/tiles/mainStart.layout";// 메인페이지로 이동
				} 
				else if (lastPage.indexOf("?") != -1) {
					//인코딩 처리를 잘 해줘야한다.
					String url = urlEncoder(lastPage);
					return "redirect:/" + url;
				}
				else {
					return "forward:/" + lastPage + ".action";
				}
			} else return "/testwaiting/kakaoerror";
			
		} catch (Exception e) {
			ea.basicErrorException(request, e);
			return "/testwaiting/kakaoerror";
		}
	}
	
	//유저 로그인 로그 남기기
	@Override
	public int loginUserPassLog(HttpServletRequest request, ErrorAlarm ea, ElasticSearchConn ec, CommonDate cd, String ip) {
		try {
			
			HttpSession session = request.getSession();
			UserDTO dto = (UserDTO)session.getAttribute("userinfo");
			Calendar curTimeKor = cd.getPresentTimeKORCal();
			
			//elasticsearch 에 유저 로그인 성공 기록 남기기.
			HashMap<String,Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put("@timestamp",curTimeKor);
			jsonMap.put("ip",ip);
			jsonMap.put("userSeq",dto.getUserSeq());
			jsonMap.put("userId",dto.getUserId());
			
			String dateNameIndex = cd.getCurrentDateIndex("login_user_index",curTimeKor);
			IndexResponse indexresp = ec.elasticPostData(dateNameIndex,jsonMap);
			
			
			return 1;
		} catch(Exception e) {
			return ea.basicErrorException(request, e);
		}
	}
}

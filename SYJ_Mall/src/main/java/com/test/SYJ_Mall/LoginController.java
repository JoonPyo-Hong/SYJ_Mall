package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.AES256Util;
import com.common.utill.CommonDAO;
import com.common.utill.CommonDate;
import com.common.utill.Encryption;
import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.KakaoCookie;
import com.common.utill.MessageSender;
import com.common.utill.RSAalgorithm;
import com.common.utill.ReCaptchar;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.login.ILoginService;
import com.test.SYJ_Mall.login.LoginFindIdDTO;
import com.test.SYJ_Mall.login.SignUpDTO;

/**
 * 로그인 관련 컨트롤러 역할
 * 
 * @author shin
 *
 */
@Controller
public class LoginController {

	@Autowired
	private ILoginService logService;

	/*---------------------------------------------------로그인 페이지------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	// 처음에 로그인 페이지로 보내주는 곳
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET , RequestMethod.POST})
	public String login(HttpServletRequest request, HttpServletResponse response, String site, KakaoCookie kc, RSAalgorithm rsa, ErrorAlarm ea) {
		
		//TEST 용	
		//kc.deleteCookie(request, response, "loginSaveUserId");
		//kc.deleteCookie(request, response, "loginSaveUserPw");
		//kc.deleteCookie(request, response, "loginSaveUserSeq");
		
		// ===================로그인 유지 관련 로직===================
		String loginStayYn = logService.getLoginStayYn(request,response,kc,rsa,ea);
		
		if (loginStayYn.equals("error")) return "/testwaiting/kakaoerror";// 에러페이지로 보내준다.
		else if (!loginStayYn.equals("pass")) return loginStayYn;   
		
		// =====================================================
		
		
		// 혹시나 세션이 존재하는데 url을 직접 쳐서 로그인 시도하는 경우에 막아줄것임 
		int result = -1;
		
		HttpSession session = request.getSession();
		
		//로그인시 쿠키에 지정해줘야할 정보 
		String addUrl = request.getParameter("addUrl");
		
		if (addUrl != null) {
			
			int addUrlResult = logService.modifyCookie(request,response,addUrl,kc,ea);
			
			if (addUrlResult == -1) return "/testwaiting/kakaoerror";
		}
		
		if (session.getAttribute("userinfo") == null) {
			result = logService.firstLoginStep(request, 0, 0, ea, rsa);// result : 0 -> 에러없음
		} else {
			return "redirect:/main.action";
		}

		if (result == 0)
			return "/login/UserLogin";// 에러가 없는경우 -> 로그인 페이지로 넘겨준다.
		else
			return "/testwaiting/kakaoerror";// 에러페이지로 보내준다.

	}
	
	//로그인 입력 정보에 따른 처리
	@RequestMapping(value = "/userLoginVerificationCheck.action", method = { RequestMethod.POST })
	@ResponseBody
	public int loginVerificationCheck(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {

		return logService.userIdPwCheck(request,ea);

	}

	// 로그인페이지에서 정보를 넘겨주는곳 => 로그인 검증
	@RequestMapping(value = "/loginVerification.action", method = { RequestMethod.POST})
	public String loginVerification(HttpServletRequest request, HttpServletResponse response,IpCheck ic, ErrorAlarm ea) {

		
		String userLoginResult = logService.loginVerifyLogic(request,response,ic,ea);
		
		if (userLoginResult.equals("error")) return "/testwaiting/kakaoerror";
		else return userLoginResult;
		

	}
	

	// 자동로그인 방지
	@RequestMapping(value = "/userautologinCheck.action", method = { RequestMethod.POST })
	@ResponseBody
	public JSONObject autologinCheck(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {

		JSONObject obj = logService.picCheck(request,ea);
		
		return obj;

	}

	// 자동로그인 방지 -> 통과한경우
	@RequestMapping(value = "/userautologinPass.action", method = { RequestMethod.GET })
	public String autologinPass(HttpServletRequest request, HttpServletResponse response, IpCheck ic, KakaoCookie kc, ErrorAlarm ea) {

		
		HttpSession session = request.getSession();
		int sucessCount = (Integer) session.getAttribute("sucessCount");

		if (sucessCount != 3) {
			return "/testwaiting/kakaoerror";
		} 
		// 자동로그인 방지를 직접 통과하고 들어온 경우
		else {
			int result = logService.autoLoginPassLogOn(request, response, ea);

			if (result == 1) {

				String lastPage = (String) kc.getCookieInfo(request, "lastPage");
				kc.deleteCookie(request, response, "lastPage");

				if (lastPage == null) {
					return "redirect:/main.action";// 메인페이지로 이동
				} else {
					return "redirect:/" + lastPage + ".action";
				}

			} else
				return "/testwaiting/kakaoerror";// 오류페이지로 이동
		}
		
	}

	// 자동로그인 방지 -> 실패한 경우
	@RequestMapping(value = "/userautologinFail.action", method = { RequestMethod.GET })
	public String autologinFail(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
			
		int result = logService.autoLoginBanned(request,ea);
		
		if (result == 1) return "/login/UserAutoLoginFail";
		else return "/testwaiting/kakaoerror";
		

	}
	
	// 로그인 캅차 기능
	@RequestMapping(value = "/loginCaptcha.action", method = { RequestMethod.POST })
	@ResponseBody
	public int loginCaptcha(HttpServletRequest request, CommonDAO cdao, ReCaptchar rc, ErrorAlarm ea) {

		return logService.getCapcharData(request,cdao,rc,ea);
		
	}
	
	
	//QR code 로그인 관련 -> 첫번째로 qr 로그인을 하려는 피씨가 자신의 피씨정보를 db단으로 넘겨준다.
	@RequestMapping(value = "/loginQr.action", method = { RequestMethod.GET })
	public String loginQr(HttpServletRequest request, HttpServletResponse response, IpCheck ic, ErrorAlarm ea) {
		
		int qrResult = logService.loginGetQr(request,response,ic,ea);
		
		if (qrResult == 1) return "/login/MainQrLogin";
		else return "/testwaiting/kakaoerror";
		
	}
	
	
	//QR 검증 -> 핸드폰으로 qr 코드를 찍어서 넘어온 경우
	@RequestMapping(value = "/loginQrPrevCheck.action", method = { RequestMethod.GET })
	public String loginQrCheck(HttpServletRequest request, HttpServletResponse response,KakaoCookie kc,AES256Util au,StringFormatClass sf, ErrorAlarm ea) {
		
		
		int qrPrevCheck = logService.loginQrPrevCheck(request,response,kc,au,sf,ea);
		
		if (qrPrevCheck == 1) return "/login/UserQrChecking";
		else if (qrPrevCheck == 2) return "/semitiles/QrLoginNotUserSeq.layout";
		else return "/testwaiting/kakaoerror";
		
	}
	
	//ajax 로 계속 확인 - qr 검증이 완료되었는지 아닌지 확인 (1초마다 확인해줌)
	@RequestMapping(value = "/loginQrCheck.action", method = { RequestMethod.POST })
	@ResponseBody
	public int loginQrCheckajax(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea) {
		
		int passCheckUserSeq = logService.qrCheckingUser(request,ea);//QR 로그인이 허용된 유저의 고유번호
		
		if (passCheckUserSeq == -2) {
			return 2;
		} else if (passCheckUserSeq != -1) {
			int grantResult = logService.grantResult(request,response,passCheckUserSeq,ea);
			
			if (grantResult == 1) return 1;
			else return -2;
		} else {
			return 0;
		}
		
	}
	
	//QR 검증 -> 핸드폰으로 qr 코드를 찍어서 넘어온 경우 -> 로그인 허용
	@RequestMapping(value = "/loginQrLastCheck.action", method = { RequestMethod.POST })
	public String loginQrLastCheck(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, KakaoCookie kc, AES256Util au, StringFormatClass sf) {
	
		int qrLastCheck = logService.loginQrChecking(request, response,ea,kc,au,sf);
				
		if (qrLastCheck == 1) return "/login/QrLoginResult";
		else return "/testwaiting/kakaoerror";
	
		
	}
	
	//QR 검증 -> 핸드폰으로 qr 코드를 찍어서 넘어온 경우 -> 로그인 허용하지 않음
	@RequestMapping(value = "/loginQrLastCheckNotAgree.action", method = { RequestMethod.POST })
	public String loginQrLastCheckNotAgree(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		int qrLastCheck = logService.loginQrCheckingNotAgree(request,ea);
		
		if (qrLastCheck == 1) return "/login/QrLoginResult";
		else return "/testwaiting/kakaoerror";
		
	}
	
	
	//QR 검증 -> 타임아웃이나 새로고침을 한경우 기존 uuid 를 제거해준다.
	@RequestMapping(value = "/loginQrRemove.action", method = { RequestMethod.POST })
	@ResponseBody
	public int loginQrRemove(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		return logService.loginQrDelete(request, ea);
	}
	
	//QR 로그인 접근 비허용 컨트롤러
	@RequestMapping(value = "/qrLoginBannedMonitor.action", method = { RequestMethod.GET })
	public String qrLoginBannedMonitor(HttpServletRequest request, HttpServletResponse response) {
		
		return "/login/UserQrLginBanned";
	
	}
	
	
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------로그인 페이지------------------------------------------------------------------*/
	
	
	
	
	/*---------------------------------------------------회원가입 페이지------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/

	// 회원가입 페이지로 보내주는 곳
	@RequestMapping(value = "/userSignUp.action", method = { RequestMethod.GET })
	public String signUp(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		int result = logService.setRSAkey(request,ea);// rsa대칭키 생성
		
		if (result == 1) return "/login/usersignup";
		else return "/testwaiting/kakaoerror";

		
	}
	
	// 회원가입 페이지 - main
	@RequestMapping(value = "/userSignUpGo.action", method = { RequestMethod.POST })
	public String signUpGo(HttpServletRequest request, HttpServletResponse response, SignUpDTO dto, ErrorAlarm ea, CommonDate comDate, StringBuffer sb) {
		
		
		int result = logService.userSignUp(request, dto, comDate, sb, ea);

		
		if (result == 1) return "/login/UserLoginSuccess";
		else return "/testwaiting/kakaoerror";

	}
	

	// 회원가입 페이지 - 아이디 검증(ajax)
	@RequestMapping(value = "/userSignUpIdCheck.action", method = { RequestMethod.GET })
	@ResponseBody
	public int idVerify(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		return logService.userSignUpIdVerify(request,ea);
		
	}
	
	
	
	// 회원가입 페이지 - 비밀번호 검증(ajax)
	@RequestMapping(value = "/userSignUpPwCheck.action", method = { RequestMethod.POST })
	@ResponseBody
	public int pwVerify(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		return logService.userSignUpPwVerify(request,ea);
		
	}
	
	

	// 회원가입 페이지 - 사용자 이메일 아이디 검증(ajax)
	@RequestMapping(value = "/userEmailVerifyCheck.action", method = { RequestMethod.GET })
	@ResponseBody
	public int emailVerify(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea)  {
		
		return logService.userEmailVerify(request,ea);
		
	
	}
	
	

	// 회원가입 페이지 - 사용자 전화번호 검증(ajax)
	@RequestMapping(value = "/userPhoneVerifyCheck.action", method = { RequestMethod.GET })
	@ResponseBody
	public int phoneNumVerify(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		return logService.userPhoneNumVerify(request,ea);
		
	}

	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------회원가입 페이지------------------------------------------------------------------*/
	
	
	/*---------------------------------------------------아이디 찾기--------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/

	// 아이디 찾기 페이지로 보내준다.
	@RequestMapping(value = "/userFindId.action", method = { RequestMethod.GET })
	public String findId(HttpServletRequest request, HttpServletResponse response) {

		return "/login/UserIdFind";
	}
	
	// 아이디 찾기 확인로직
	@RequestMapping(value = "/userFindIdCheck.action", method = { RequestMethod.POST })
	@ResponseBody
	public LoginFindIdDTO findIdCheck(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, StringFormatClass sfc, LoginFindIdDTO dto) {
		
		return logService.findUserId(request, ea, sfc ,dto);
		
	}
	

	// 아이디 찾기 확인로직 -> 해당 정보 일치하는 아이디 정보 제공
	@RequestMapping(value = "/userFindIdCheckFinal.action", method = { RequestMethod.POST })
	public String findIdCheckFinal(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		int result = logService.findUserIdCheck(request, ea);
		
		if (result == 1) return "/login/UserIdFindCheck";
		else return "/testwaiting/kakaoerror";

	}
	
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------아이디 찾기--------------------------------------------------------------------*/

	/*---------------------------------------------------비밀번호 찾기--------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	// 비밀번호 찾기 로직
	@RequestMapping(value = "/userFindpw.action", method = { RequestMethod.GET })
	public String findUserPw(HttpServletRequest request, HttpServletResponse response) {

		return "/login/UserFindPw";
	}
	
	
	
	// 비밀번호 찾기전 해당 정보가 유효한지 체크해준다.
	@RequestMapping(value = "/userFindpwCheck.action", method = { RequestMethod.POST })
	@ResponseBody
	public int findUserPwCheck(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		return logService.findUserPw(request,ea);
		
	}
	
	//여기까지 일단 정리함

	// 비밀번호 찾기 -> 비밀번호를 변경해주고 회원 이메일로 변경된 임시비밀번호를 발급해준다.
	@RequestMapping(value = "/userFindpwSend.action", method = { RequestMethod.POST })
	public String findUserPwSend(HttpServletRequest request, HttpServletResponse response, StringFormatClass sfc, Encryption enc, MessageSender ms, ErrorAlarm ea) {

		// 여기서 넘어온 데이터를 체크하여 존재하는 아이디가 맞고 비밀번호를 바꿀 준비가 되었는지 확인작업을 진행해준다.
		int result = logService.emailCertify(request,sfc,enc,ms,ea);
		
		if (result == 1) return "/login/UserFindPwSendEmail";
		else return "/testwaiting/kakaoerror";
	}
	
	
	// 비밀번호 찾기 : 임시비번 -> 비밀번호 변경 -> 다시 로그인 해주는 로직
	@RequestMapping(value = "/userRedefinedPw.action", method = { RequestMethod.POST })
	public String userPwRedefined(HttpServletRequest request, HttpServletResponse response, RSAalgorithm rsa, Encryption enc, ErrorAlarm ea) {
		
		int result = logService.remodiftUserPw(request,rsa,enc,ea);
		
		if (result == 1) return "/login/UserRedefinedPwSuccess";
		else return "/testwaiting/kakaoerror";

	}

	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------비밀번호 찾기--------------------------------------------------------------------*/

	/*---------------------------------------------------로그아웃--------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	// 로그아웃
	@RequestMapping(value = "/userLogout.action", method = { RequestMethod.GET })
	public String userLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String result = logService.goLogOut(request,response);
		
		if (result.equals("none")) {
			return "/testwaiting/kakaoerror";
		} else {
			return result;
		}


	}

	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------로그아웃--------------------------------------------------------------------*/

	// 타일즈 테스트
	@RequestMapping(value = "/tilestest.action", method = { RequestMethod.GET })
	public String tilestest(HttpServletRequest request, HttpServletResponse response) {

		// 기존 ViewResolver : JSP 페이지를 찾는다
		// return "member/info"; //"/WEB-INF/views/" + "member/info" + ".jsp"

		// 새로운 Tiles ViewResolver : tiles.xml 에 가서-> <definition> 의 name 을 찾는다.(****)
		return "/tiles/main";

	}

	// 메인화면 타일즈 테스트
	@RequestMapping(value = "/mainTiles.action", method = { RequestMethod.GET })
	public String mainTiles(HttpServletRequest request, HttpServletResponse response) {

		// 기존 ViewResolver : JSP 페이지를 찾는다
		// return "member/info"; //"/WEB-INF/views/" + "member/info" + ".jsp"

		// 새로운 Tiles ViewResolver : tiles.xml 에 가서-> <definition> 의 name 을 찾는다.(****)
		return "/tiles/main.top";
	}
	
	
	
	
	
	/*---------------------------------------------------로그인 상태인지 아닌지 확인해주는 ajax-----------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "/loginChecking.action", method = { RequestMethod.GET })
	@ResponseBody
	public int loginChecking(HttpServletRequest request, HttpServletResponse response) {

		return logService.loginChecking(request,response);
	}
	
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------로그인 상태인지 아닌지 확인해주는 ajax-----------------------------------------------*/
	
	
	
	
	
	
	
	/*---------------------------------------------------에러처리 관련 컨트롤러------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	
	//에러 컨트롤러
	@RequestMapping(value = "/totalError.action", method = { RequestMethod.GET })
	public String totalError(HttpServletRequest request, HttpServletResponse response) {
		
		return "/testwaiting/kakaoerror";

	}
	
	
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------에러처리 관련 컨트롤러------------------------------------------------------------*/
	
	
	
	

}

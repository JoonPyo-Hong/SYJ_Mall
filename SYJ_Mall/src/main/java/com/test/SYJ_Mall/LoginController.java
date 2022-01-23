package com.test.SYJ_Mall;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.login.ILoginService;
import com.test.SYJ_Mall.login.LoginDTO;
import com.test.SYJ_Mall.login.SignUpDTO;

/**
 * 메인 컨트롤러 역할
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
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpServletRequest request, HttpServletResponse response, String site) {
		
		
		//TEST 용
		//KakaoCookie kc = new KakaoCookie();
		
		//kc.deleteCookie(request, response, "loginSaveUserId");
		//kc.deleteCookie(request, response, "loginSaveUserPw");
		//kc.deleteCookie(request, response, "loginSaveUserSeq");
		
		// ===================로그인 유지 관련 로직===================
		String loginStayYn = logService.getLoginStayYn(request,response);
		
		if (loginStayYn.equals("error")) return "/testwaiting/kakaoerror";// 에러페이지로 보내준다.
		else if (!loginStayYn.equals("pass")) return loginStayYn;   
		
		// =====================================================
		
		
		// 혹시나 세션이 존재하는데 url을 직접 쳐서 로그인 시도하는 경우에 막아줄것임 
		int result = -1;
		
		HttpSession session = request.getSession();
		
		//로그인시 쿠키에 지정해줘야할 정보 
		String addUrl = request.getParameter("addUrl");
		
		if (addUrl != null) {
			
			int addUrlResult = logService.modifyCookie(request,response,addUrl);
			
			if (addUrlResult == -1) return "/testwaiting/kakaoerror";
		}
		
		if (session.getAttribute("userinfo") == null) {
			result = logService.firstLoginStep(request, 0, 0);// result : 0 -> 에러없음
		} else {
			return "redirect:/main.action";
		}

		if (result == 0)
			return "/login/UserLogin";// 에러가 없는경우 -> 로그인 페이지로 넘겨준다.
		else
			return "/testwaiting/kakaoerror";// 에러페이지로 보내준다.

	}

	@RequestMapping(value = "/userLoginVerificationCheck.action", method = { RequestMethod.POST })
	public void loginVerificationCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		PrintWriter out = response.getWriter();
		int result = logService.userIdPwCheck(request);

		out.print(result);
	}

	// 로그인페이지에서 정보를 넘겨주는곳 => 로그인 검증
	@RequestMapping(value = "/loginVerification.action", method = { RequestMethod.POST})
	public String loginVerification(HttpServletRequest request, HttpServletResponse response) {

		
		String userLoginResult = logService.loginVerifyLogic(request,response);
		
		if (userLoginResult.equals("error")) return "/testwaiting/kakaoerror";
		else return userLoginResult;
		

	}

	// 자동로그인 방지
	@RequestMapping(value = "/userautologinCheck.action", method = { RequestMethod.POST })
	public void autologinCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {

		PrintWriter out = response.getWriter();
		JSONObject obj = logService.picCheck(request);

		out.print(obj);
	}

	// 자동로그인 방지 -> 통과한경우
	@RequestMapping(value = "/userautologinPass.action", method = { RequestMethod.GET })
	public String autologinPass(HttpServletRequest request, HttpServletResponse response) throws Exception {

		IpCheck ic = new IpCheck();

		try {
			HttpSession session = request.getSession();
			int sucessCount = (Integer) session.getAttribute("sucessCount");

			if (sucessCount != 3) {
				return "/testwaiting/kakaoerror";
				// 자동로그인 방지를 직접 통과하고 들어온 경우
			} else {
				int result = logService.autoLoginPassLogOn(request);

				if (result == 1) {

					KakaoCookie kc = new KakaoCookie();
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

		} catch (Exception e) {
			
			// 허용없이 들어올때 벤을 시켜줘야 한다.
			ErrorAlarm ea = new ErrorAlarm(e, ic.getClientIP(request));
			ea.sendErrorMassegeAdmin();
			ea.inputErrorToDb();
			return "/testwaiting/kakaoerror";
		}
	}

	// 자동로그인 방지 -> 실패한 경우
	@RequestMapping(value = "/userautologinFail.action", method = { RequestMethod.GET })
	public String autologinFail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		IpCheck ic = new IpCheck();
		// 못들어오게 해야하는데...
		try {
			HttpSession session = request.getSession();
			int failCount = (Integer) session.getAttribute("failCount");

			// 세션을 아예 삭제시켜주는 서비스를 구현
			logService.sessionDelete(request);

			if (failCount != 3) {
				throw new Exception();
			}

			return "/login/UserAutoLoginFail";
		} catch (Exception e) {
			
			ErrorAlarm ea = new ErrorAlarm(e, ic.getClientIP(request));
			ea.sendErrorMassegeAdmin();
			ea.inputErrorToDb();
			
			return "/testwaiting/kakaoerror";
		}

	}
	
	// 로그인 캅차 기능
	@RequestMapping(value = "/loginCaptcha.action", method = { RequestMethod.POST })
	@ResponseBody
	public int loginCaptcha(HttpServletRequest request, HttpServletResponse response) {

		return logService.getCapcharData(request);
		
	}
	
	//QR code 기능
	@RequestMapping(value = "/loginQr.action", method = { RequestMethod.POST })
	@ResponseBody
	public int loginQr(HttpServletRequest request, HttpServletResponse response) {
		
		
		return logService.loginGetQr(request,response);
		
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
	public String signUp(HttpServletRequest request, HttpServletResponse response) {
		IpCheck ic = new IpCheck();

		// 비밀번호를 암호하하기 위해서 RSA 대칭키를 써줄것이다.
		try {
			int result = logService.setRSAkey(request);// rsa대칭키 생성
		} catch (Exception e) {
			
			ErrorAlarm ea = new ErrorAlarm(e, ic.getClientIP(request));
			ea.sendErrorMassegeAdmin();
			ea.inputErrorToDb();
			
			return "/testwaiting/kakaoerror";
		}

		return "/login/usersignup";
	}

	// 회원가입 페이지 - main
	@RequestMapping(value = "/userSignUpGo.action", method = { RequestMethod.POST })
	public String signUpGo(HttpServletRequest request, HttpServletResponse response, SignUpDTO dto)
			throws UnsupportedEncodingException {
		IpCheck ic = new IpCheck();
		request.setCharacterEncoding("UTF-8");

		try {
			int result = logService.userSignUp(request, dto);
		} catch (Exception e) {
			
			ErrorAlarm ea = new ErrorAlarm(e, ic.getClientIP(request));
			ea.sendErrorMassegeAdmin();
			ea.inputErrorToDb();
			
			return "/testwaiting/kakaoerror";
		}

		return "/login/UserLoginSuccess";
	}

	// 회원가입 페이지 - 아이디 검증(ajax)
	@RequestMapping(value = "/userSignUpIdCheck.action", method = { RequestMethod.GET })
	public void idVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		int result = logService.userSignUpIdVerify(request);// -1 을 가져오거나 1을 가져오는데 뭐지?

		out.print(result);
	}

	// 회원가입 페이지 - 비밀번호 검증(ajax)
	@RequestMapping(value = "/userSignUpPwCheck.action", method = { RequestMethod.POST })
	public void pwVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		int result = logService.userSignUpPwVerify(request);

		out.print(result);
	}

	// 회원가입 페이지 - 사용자 이메일 아이디 검증(ajax)
	@RequestMapping(value = "/userEmailVerifyCheck.action", method = { RequestMethod.GET })
	public void emailVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		int result = logService.userEmailVerify(request);

		out.print(result);
	}

	// 회원가입 페이지 - 사용자 전화번호 검증(ajax)
	@RequestMapping(value = "/userPhoneVerifyCheck.action", method = { RequestMethod.GET })
	public void phoneNumVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		int result = logService.userPhoneNumVerify(request);

		out.print(result);
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
	public void findIdCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String email = request.getParameter("inputmail");
		String phone = request.getParameter("inputphone");

		PrintWriter out = response.getWriter();
		JSONObject obj = logService.findUserId(email, phone);

		out.print(obj);

	}

	// 아이디 찾기 확인로직
	@RequestMapping(value = "/userFindIdCheckFinal.action", method = { RequestMethod.POST })
	public String findIdCheckFinal(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String userId = request.getParameter("throwUserId");
		String phone = request.getParameter("throwUserPhone");

		request.setAttribute("userId", userId);
		request.setAttribute("phone", phone);

		return "/login/UserIdFindCheck";

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
	public String findUserPw(HttpServletRequest request, HttpServletResponse response) throws IOException {

		return "/login/UserFindPw";
	}

	// 비밀번호 찾기전 해당 정보가 유효한지 체크해준다.
	@RequestMapping(value = "/userFindpwCheck.action", method = { RequestMethod.POST })
	public void findUserPwCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 여기서 ajax로 넘어온 데이터를 체크하여 존재하는 아이디가 맞고 비밀번호를 바꿀 준비가 되었는지 확인작업을 진행해준다.
		String userId = request.getParameter("userId");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");

		PrintWriter out = response.getWriter();
		int result = logService.findUserPw(userId, userEmail, userPhone);

		out.print(result);
	}

	// 비밀번호 찾기 -> 비밀번호를 변경해주고 회원 이메일로 변경된 임시비밀번호를 발급해준다.
	@RequestMapping(value = "/userFindpwSend.action", method = { RequestMethod.POST })
	public String findUserPwSend(HttpServletRequest request, HttpServletResponse response, StringFormatClass sfc)
			throws IOException {

		// 여기서 ajax로 넘어온 데이터를 체크하여 존재하는 아이디가 맞고 비밀번호를 바꿀 준비가 되었는지 확인작업을 진행해준다.
		String userId = request.getParameter("kakaoId");
		String userEmail = request.getParameter("kakaoMail");
		String userPhone = request.getParameter("kakaoPhone");

		// 임시비밀번호 생성
		int result = logService.emailCertify(userId, userEmail, userPhone);

		if (result == 1) {
			String sendEmail = sfc.maskingMail(userEmail);
			request.setAttribute("sendEmail", sendEmail);
			return "/login/UserFindPwSendEmail";
		} else {// 에러가 발생한경우
			return "/testwaiting/kakaoerror";
		}
	}

	// 비밀번호 찾기 : 임시비번 -> 비밀번호 변경
	@RequestMapping(value = "/userRedefinedPw.action", method = { RequestMethod.POST })
	public String userPwRedefined(HttpServletRequest request, HttpServletResponse response) throws Exception {


		try {
			request.setCharacterEncoding("UTF-8");// 인코딩 타입 설정
			
			int result = logService.remodiftUserPw(request);
			
			if (result == 1) {
				return "/login/UserRedefinedPwSuccess";
			} else {
				throw new Exception("admin throw Exception");
			}
			
		} catch(Exception e) {
			
			ErrorAlarm ea = new ErrorAlarm(e);
			ea.sendErrorMassegeAdmin();
			ea.inputErrorToDb();
			
			return "/testwaiting/kakaoerror";
		}
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
	
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------로그인 상태인지 아닌지 확인해주는 ajax-----------------------------------------------*/
	@RequestMapping(value = "/loginChecking.action", method = { RequestMethod.GET })
	@ResponseBody
	public int loginChecking(HttpServletRequest request, HttpServletResponse response) {

		return logService.loginChecking(request,response);

	}

}

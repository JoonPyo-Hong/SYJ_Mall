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

import com.common.utill.IpCheck;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.login.ILoginService;
import com.test.SYJ_Mall.login.LoginDTO;
import com.test.SYJ_Mall.login.SignUpDTO;
/**
 * 메인 컨트롤러 역할
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
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET,RequestMethod.POST })
	public String login(HttpServletRequest request, HttpServletResponse response, String site) {
		
		//혹시나 세션이 존재하는데 url을 직접 쳐서 로그인 시도하는 경우에 막아줄것임 -> 모달창으로 바꿔주는게 좋으려나;
		int result = -1;
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("userinfo") == null) {
			result = logService.firstLoginStep(request,0,0);//result : 0 -> 에러없음
		} else {
			return "redirect:/main.action";
		}
		
		if (result == 0) return "/login/UserLogin";//에러가 없는경우 -> 로그인 페이지로 넘겨준다.
		else return "/testwaiting/kakaoerror";//에러페이지로 보내준다.
		
	}
	
	@RequestMapping(value = "/userLoginVerificationCheck.action", method = { RequestMethod.POST })
	public void loginVerificationCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		PrintWriter out = response.getWriter();
		//JSONObject obj = logService.picCheck(request);
		int result = logService.userIdPwCheck(request);
		
		
		out.print(result);			
	}
	
	
	//로그인페이지에서 정보를 넘겨주는곳
	@RequestMapping(value = "/loginVerification.action", method = { RequestMethod.POST })
	public String loginVerification(HttpServletRequest request, HttpServletResponse response) {
			
			String ip = "";//아이피 주소

			try {
				request.setCharacterEncoding("UTF-8");//인코딩 타입 설정
				
				ip = logService.ipCheck(request);
				
				//Map<String,String> map = logService.getRSAkey(request);
				Map<String,String> map = logService.getRSAkeySessionStay(request);
				
				String id = map.get("id");//아이디
				String pw = map.get("pw");//비밀번호
				
				String encPw = logService.pwEnc(pw);//상대방이 입력한 pw를 암호화작업해준다.
				
				
				List<LoginDTO> loginResult = logService.loginResult(ip, id, encPw);
				int userSeq = loginResult.get(0).getUserSeq();//유저 고유 코드
				int loginCode = loginResult.get(0).getLoginCode();//로그인 결과
				
				
				if (loginCode == 0) {// 로그인 성공
					//System.out.println("로그인 성공");
					
					logService.loginSuccess(request,userSeq);//로그인 인증티켓 발급
					//HttpSession session = request.getSession();
					//String lastPage = (String)session.getAttribute("lastPage");
					
//					if (lastPage == null) {
//						return "redirect:/main.action";//메인페이지로 이동
//					} else {
//						return "redirect:/" + lastPage + "";
//					}
					
					return "redirect:/main.action";//메인페이지로 이동

					
				} else if (loginCode == 1) {//로그인 성공 : 하지만 비밀번호를 변경해줘야한다.
					//System.out.println("비밀번호 변경 요망");
					
					//아래에서 기본적으로 정보와 rsa키를 넘겨야한다.
					int result = logService.userRedefinedPw(request,userSeq,ip);
					
					if (result == 1) {
						return "/login/UserLoginPwRedefine";
					}
					else return "/testwaiting/kakaoerror";//문제생겼을시에 에러페이지로 이동
					
				} else if (loginCode == 2) {//보안정책을 따라야하는 경우 --> 사진을 골라야한다.
					//System.out.println("보안정책을 따라야한다.");
					
					//자동로그인 방지 알고리즘
					request = logService.AutoLoginBanned(request,userSeq,ip);
					
					return "/login/UserAutoLoginCheck";
					
				} else {
					throw new Exception();
				}
				
			} catch(Exception e) {
				
				//위의 에러를 디비에 넣어줘야 한다.
				logService.errorEruptionTodb(e,ip);
			
				return "/testwaiting/kakaoerror";
			}

	}
	
	//자동로그인 방지
	@RequestMapping(value = "/userautologinCheck.action", method = { RequestMethod.POST })
	public void autologinCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		PrintWriter out = response.getWriter();
		JSONObject obj = logService.picCheck(request);
		
		out.print(obj);			
	}
	
	//자동로그인 방지 -> 통과한경우
	@RequestMapping(value = "/userautologinPass.action", method = { RequestMethod.GET })
	public String autologinPass(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		IpCheck ic = new IpCheck();
		
		try {
			HttpSession session = request.getSession();
			int sucessCount = (Integer)session.getAttribute("sucessCount");
			
			if (sucessCount != 3) {
				return "/testwaiting/kakaoerror";
			//자동로그인 방지를 직접 통과하고 들어온 경우	
			} else {
				int result = logService.autoLoginPassLogOn(request);
				
				if (result == 1) return "redirect:/main.action";//메인페이지로 이동
				else return "/testwaiting/kakaoerror";//오류페이지로 이동
			}
			
		} catch(Exception e) {
			//허용없이 들어올때 벤을 시켜줘야 한다.
			logService.errorEruptionTodb(e,ic.getClientIP(request));
			return "/testwaiting/kakaoerror";
		}
	}
	
	//자동로그인 방지 -> 실패한 경우
	@RequestMapping(value = "/userautologinFail.action", method = { RequestMethod.GET })
	public String autologinFail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		IpCheck ic = new IpCheck();
		//못들어오게 해야하는데...
		try {
			HttpSession session = request.getSession();
			int failCount = (Integer)session.getAttribute("failCount");
			
			//세션을 아예 삭제시켜주는 서비스를 구현
			logService.sessionDelete(request);
			
			if (failCount != 3) {
				throw new Exception();
			}

			return "/login/UserAutoLoginFail";
		} catch(Exception e) {
			logService.errorEruptionTodb(e,ic.getClientIP(request));
			return "/testwaiting/kakaoerror";
		}

		
	}
	
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------로그인 페이지------------------------------------------------------------------*/
	
	
	
	
	
	
	/*---------------------------------------------------회원가입 페이지------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	
	//회원가입 페이지로 보내주는 곳
	@RequestMapping(value = "/userSignUp.action", method = { RequestMethod.GET })
	public String signUp(HttpServletRequest request, HttpServletResponse response) {
		IpCheck ic = new IpCheck();
		
		//비밀번호를 암호하하기 위해서 RSA 대칭키를 써줄것이다.
		try {
			int result = logService.setRSAkey(request);//rsa대칭키 생성
		} catch(Exception e) {
			logService.errorEruptionTodb(e,ic.getClientIP(request));
			e.getMessage();
		}
		
		return "/login/usersignup";
	}	
	
	//회원가입 페이지 - main
	@RequestMapping(value = "/userSignUpGo.action", method = { RequestMethod.POST })
	public String signUpGo(HttpServletRequest request, HttpServletResponse response,SignUpDTO dto) throws UnsupportedEncodingException {
		IpCheck ic = new IpCheck();
		request.setCharacterEncoding("UTF-8");
		
		try {
			int result = logService.userSignUp(request,dto);
		} catch(Exception e) {
			logService.errorEruptionTodb(e,ic.getClientIP(request));
			e.printStackTrace();
		}
				
		return "/login/UserLoginSuccess";
	}
	
	
	//회원가입 페이지 - 아이디 검증(ajax)
	@RequestMapping(value = "/userSignUpIdCheck.action", method = { RequestMethod.GET })
	public void idVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		int result = logService.userSignUpIdVerify(request);// -1 을 가져오거나 1을 가져오는데 뭐지?
		
		out.print(result);
	}
	
	//회원가입 페이지 - 비밀번호 검증(ajax)
	@RequestMapping(value = "/userSignUpPwCheck.action", method = { RequestMethod.POST })
	public void pwVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		int result = logService.userSignUpPwVerify(request);
		
		
		out.print(result);
	}
	
	//회원가입 페이지 - 사용자 이메일 아이디 검증(ajax)
	@RequestMapping(value = "/userEmailVerifyCheck.action", method = { RequestMethod.GET })
	public void emailVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		int result = logService.userEmailVerify(request);
		
		out.print(result);
	}
	
	//회원가입 페이지 - 사용자 전화번호  검증(ajax)
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
	
	//아이디 찾기 페이지로 보내준다.
	@RequestMapping(value = "/userFindId.action", method = { RequestMethod.GET })
	public String findId(HttpServletRequest request, HttpServletResponse response) {
			
		return "/login/UserIdFind";
	}
	
	
	//아이디 찾기 확인로직
	@RequestMapping(value = "/userFindIdCheck.action", method = { RequestMethod.POST })
	public void findIdCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String email = request.getParameter("inputmail");
		String phone = request.getParameter("inputphone");
		
		PrintWriter out = response.getWriter();
		JSONObject obj = logService.findUserId(email,phone);
	
		out.print(obj);
		
	}
	
	//아이디 찾기 확인로직
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
	//비밀번호 찾기 로직
	@RequestMapping(value = "/userFindpw.action", method = { RequestMethod.GET })
	public String findUserPw(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		return "/login/UserFindPw";
	}
	
	//비밀번호 찾기전 해당 정보가 유효한지 체크해준다.
	@RequestMapping(value = "/userFindpwCheck.action", method = { RequestMethod.POST })
	public void findUserPwCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//여기서 ajax로 넘어온 데이터를 체크하여 존재하는 아이디가 맞고 비밀번호를 바꿀 준비가 되었는지 확인작업을 진행해준다.
		String userId = request.getParameter("userId");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		
		PrintWriter out = response.getWriter();
		int result = logService.findUserPw(userId,userEmail,userPhone);
		
		
		out.print(result);
	}
	
	
	//비밀번호 찾기 -> 비밀번호를 변경해주고 회원 이메일로 변경된 임시비밀번호를 발급해준다.
	@RequestMapping(value = "/userFindpwSend.action", method = { RequestMethod.POST })
	public String findUserPwSend(HttpServletRequest request, HttpServletResponse response,StringFormatClass sfc) throws IOException {
		
		//여기서 ajax로 넘어온 데이터를 체크하여 존재하는 아이디가 맞고 비밀번호를 바꿀 준비가 되었는지 확인작업을 진행해준다.
		String userId = request.getParameter("kakaoId");
		String userEmail = request.getParameter("kakaoMail");
		String userPhone = request.getParameter("kakaoPhone");
		
		//임시비밀번호 생성
		int result = logService.sendPw(userId,userEmail,userPhone);
		
		if (result == 1) {
			String sendEmail = sfc.maskingMail(userEmail);
			request.setAttribute("sendEmail", sendEmail);
			return "/login/UserFindPwSendEmail";
		} else {//에러가 발생한경우
			return "/testwaiting/kakaoerror";
		}	
	}
	
	//비밀번호 찾기 : 임시비번 -> 비밀번호 변경
	@RequestMapping(value = "/userRedefinedPw.action", method = { RequestMethod.POST })
	public String userPwRedefined(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");//인코딩 타입 설정
		
		int result = logService.remodiftUserPw(request);
		
		if(result == 1) {
			return "/login/UserRedefinedPwSuccess";
			//return "redirect:/login.action";//메인페이지로 보내준다.
		} else {
			return "/testwaiting/kakaoerror";
		}
			
	}
	
	
	
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------비밀번호 찾기--------------------------------------------------------------------*/
	
	
	
	//타일즈 테스트
	@RequestMapping(value = "/tilestest.action", method = { RequestMethod.GET })
	public String tilestest(HttpServletRequest request, HttpServletResponse response) {
		
		//기존 ViewResolver : JSP 페이지를 찾는다
		//return "member/info"; //"/WEB-INF/views/" + "member/info" + ".jsp"

		//새로운 Tiles ViewResolver : tiles.xml 에 가서-> <definition> 의 name 을 찾는다.(****)
		return "/tiles/main";
	
	}
	
	
	//메인화면 타일즈 테스트
	@RequestMapping(value = "/mainTiles.action", method = { RequestMethod.GET })
	public String mainTiles(HttpServletRequest request, HttpServletResponse response) {
		
		//기존 ViewResolver : JSP 페이지를 찾는다
		//return "member/info"; //"/WEB-INF/views/" + "member/info" + ".jsp"

		//새로운 Tiles ViewResolver : tiles.xml 에 가서-> <definition> 의 name 을 찾는다.(****)
		return "/tiles/main.top";
	
	}
	
	
	
	
	
}

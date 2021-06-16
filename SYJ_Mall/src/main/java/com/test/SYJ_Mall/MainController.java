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

import com.common.utill.RSAalgorithm;
import com.test.SYJ_Mall.login.ILoginService;
import com.test.SYJ_Mall.login.LoginDTO;
/**
 * 메인 컨트롤러 역할
 * @author shin
 *
 */
@Controller
public class MainController {
	
	@Autowired
	private ILoginService logService;

	/*---------------------------------------------------로그인 페이지------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	// 처음에 로그인 페이지로 보내주는 곳
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET })
	public String login(HttpServletRequest request, HttpServletResponse response) {


		int result = logService.firstLoginStep(request,0);
		
		if (result == 0) return "/login/UserLogin";
		else return "/login/UserLogin";
		
	}
	
	
	//로그인페이지에서 정보를 넘겨주는곳
	@RequestMapping(value = "/loginVerification.action", method = { RequestMethod.POST })
	public String loginVerification(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			request.setCharacterEncoding("UTF-8");//인코딩 타입 설정
			
			Map<String,String> map = logService.getRSAkey(request);
			
			String id = map.get("id");//아이디
			String pw = map.get("pw");//비밀번호
			
			String ip = logService.ipCheck(request);
			String encPw = logService.pwEnc(pw);//상대방이 입력한 pw를 암호화작업해준다.
		
			
			List<LoginDTO> loginResult = logService.loginResult(ip, id, encPw);
			int userSeq = loginResult.get(0).getUserSeq();//유저 고유 코드
			int loginCode = loginResult.get(0).getLoginCode();//로그인 결과
			
			
			if (loginCode == 0) {// 로그인 성공
				System.out.println("로그인 성공");
				
				logService.loginSuccess(request,userSeq,1);//로그인 인증티켓 발급
				
				return "/testwaiting/waiting";//테스트페이지 
				
			} else if (loginCode == 1 || loginCode == -1) {//로그인 실패 : 잘못된 로그인 정보 and 벤당한 아이피 들어오는경우
				System.out.println("잘못된 로그인 정보");
				
				int result = logService.firstLoginStep(request,-1);

				
				if (result == 0) return "/login/UserLogin";
				else return "/login/UserLogin";
				
				
			} else {//보안정책을 따라야하는 경우 --> 사진을 골라야한다. --> 보안정책 실패하는 경우도 넣어줘야 하는데
				System.out.println("보안정책을 따라야한다.");
				
				logService.loginSuccess(request,userSeq,0);//로그인 인증티켓 발급
				request = logService.AutoLoginBanned(request);
				
				logService.logUserTrace(userSeq,ip);//로그인 기록 남겨주기
				
				return "/login/UserAutoLoginCheck";
				
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
				
		
		HttpSession session = request.getSession();

		System.out.println(session.getAttribute("userinfo"));
		return "/testwaiting/waiting";
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
			
		//비밀번호를 암호하하기 위해서 RSA 대칭키를 써줄것이다.
		try {
			int result = logService.setRSAkey(request);//rsa대칭키 생성
		} catch(Exception e) {
			e.getMessage();
		}
		
		return "/login/usersignup";
	}	
	
	//회원가입 페이지 - main
	@RequestMapping(value = "/userSignUpGo.action", method = { RequestMethod.POST })
	public String signUpGo(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		
		try {
			int result = logService.userSignUp(request);
		} catch(Exception e) {
			e.printStackTrace();
		}
				
		return "result";
	}
	
	
	//회원가입 페이지 - 아이디 검증(ajax)
	@RequestMapping(value = "/userSignUpIdCheck.action", method = { RequestMethod.GET })
	public void idVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		int result = logService.userSignUpIdVerify(request);
		
		out.print(result);
	}
	
	//회원가입 페이지 - 비밀번호 검증(ajax)
	@RequestMapping(value = "/userSignUpPwCheck.action", method = { RequestMethod.GET })
	public void pwVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		int result = logService.userSignUpPwVerify(request);
		
		out.print(result);
	}
	
	
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*---------------------------------------------------회원가입 페이지------------------------------------------------------------------*/
	
	//사용자(구매자) 메인 화면
	@RequestMapping(value = "/main.action", method = { RequestMethod.GET })
	public String UserMain(HttpServletRequest request, HttpServletResponse response) {

		return "/main/UserMain";

	}

}

package com.test.SYJ_Mall;

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

	
	// 처음에 로그인 페이지로 보내주는 곳
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET })
	public String login(HttpServletRequest request, HttpServletResponse response) {

		// 광고관련 넘겨야 한다. & 아이디 비밀번호 오류관련
		Map<String, String> adverMap = logService.adverShow();
		request.setAttribute("adverMap", adverMap);

		//asd
		return "/login/UserLogin";
	}
	
	
	//로그인페이지에서 정보를 넘겨주는곳
	@RequestMapping(value = "/loginVerification.action", method = { RequestMethod.POST })
	public String loginVerification(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
			
			request.setCharacterEncoding("UTF-8");//인코딩 타입 설정
		
			String id = (String)request.getParameter("id");//아이디
			String pw = (String)request.getParameter("pw");//비밀번호
			
			String ip = logService.ipCheck(request);
			String encPw = logService.pwEnc(pw);//상대방이 입력한 pw를 암호화작업해준다.
		
			
			List<LoginDTO> loginResult = logService.loginResult(ip, id, encPw);
			int userSeq = loginResult.get(0).getUserSeq();//유저 고유 코드
			int loginCode = loginResult.get(0).getLoginCode();//로그인 결과
			
			
			if (loginCode == 0) {// 로그인 성공
				System.out.println("로그인 성공");
				//session에 유저객체를 넘겨줘야한다.
				logService.loginSuccess(request,userSeq,1);
				//HttpSession userSession = request.getSession();
				
				//System.out.println(userSession.getAttribute("userinfo"));
				
				return "/testwaiting/waiting";
			} else if (loginCode == 1 || loginCode == -1) {//로그인 실패 : 잘못된 로그인 정보 and 벤당한 아이피 들어오는경우
				System.out.println("잘못된 로그인 정보");
				
				//아래에서 광고정보를 쇄신해준다. & 아이디 비밀번호 오류관련
				Map<String,String> adverMap = logService.adverShow();
				request.setAttribute("adverMap", adverMap);
				request.setAttribute("loginError", 404);
				
				return "/login/UserLogin";
			} else {//보안정책을 따라야하는 경우 --> 사진을 골라야한다.
				System.out.println("보안정책을 따라야한다.");
				
				logService.loginSuccess(request,userSeq,0);
				request = logService.AutoLoginBanned(request);
				//여기서 보안정책에 대해 성공한 경우는 또 로그인기록등을 남겨줘야 한다. --> 일단보류
				
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

		//확인해줄곳 --> 세션이 끊긴건가 뭐지;?;;
		System.out.println(session.getAttribute("userinfo"));
		return "/testwaiting/waiting";
	}
	
	//회원가입 페이지로 보내주는 곳
	@RequestMapping(value = "/userSignUp.action", method = { RequestMethod.GET })
	public String signUp(HttpServletRequest request, HttpServletResponse response) {
			
			
		return "/login/usersignup";
	}	
	
	//회원가입 페이지
	@RequestMapping(value = "/userSignUpGo.action", method = { RequestMethod.POST })
	public String signUpGo(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
	
		
		//int result = logService.userSignUp(request);
		
		//System.out.println(result);
						
		return "result";
	}
	


	//사용자(구매자) 메인 화면
	@RequestMapping(value = "/main.action", method = { RequestMethod.GET })
	public String UserMain(HttpServletRequest request, HttpServletResponse response) {

		return "/main/UserMain";

	}

}

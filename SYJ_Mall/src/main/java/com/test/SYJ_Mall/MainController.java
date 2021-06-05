package com.test.SYJ_Mall;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.login.ILoginService;


@Controller
public class MainController {
	
	@Autowired
	private ILoginService logService;
	
	
	//처음에 로그인 페이지로 보내주는 곳
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET })
	public String login(HttpServletRequest request, HttpServletResponse response) {
		
		
		//System.out.println("asd");
		//광고관련 넘겨야 한다. & 아이디 비밀번호 오류관련
		Map<String,String> adverMap = logService.adverShow();
		request.setAttribute("adverMap", adverMap);

		
		return "/login/UserLogin";
	}
	
	
	//처음에 로그인 페이지로 보내주는 곳
	@RequestMapping(value = "/loginVerification.action", method = { RequestMethod.POST })
	public String loginVerification(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
			
			request.setCharacterEncoding("UTF-8");
		
			String id = (String)request.getParameter("id");//아이디
			String pw = (String)request.getParameter("pw");//비밀번호
			
			String ip = logService.ipCheck(request);
			String encPw = logService.pwEnc(pw);//상대방이 입력한 pw를 암호화작업해준다.
			
			//String ip = logService.ipCheck(request);//ip check를 해준다.
			//String encPw = logService.pwEnc(pw);//상대방이 입력한 pw를 암호화작업해준다.
			
			int loginResult = logService.loginResult(ip, id, encPw);
			
			
			if (loginResult == 0) {// 로그인 성공
				System.out.println("로그인 성공");
				return "/login/UserLogin";
			} else if (loginResult == 1 || loginResult == -1) {//로그인 실패 : 잘못된 로그인 정보 and 벤당한 아이피 들어오는경우
				System.out.println("잘못된 로그인 정보");
				
				//아래에서 광고정보를 쇄신해준다. & 아이디 비밀번호 오류관련
				Map<String,String> adverMap = logService.adverShow();
				request.setAttribute("adverMap", adverMap);
				request.setAttribute("loginError", 404);
				
				return "/login/UserLogin";
			} else {//보안정책을 따라야하는 경우
				System.out.println("보안정책을 따라야한다.");
				
				//request = logService.AutoLoginBanned(request);
				//여기서 보안정책에 대해 성공한 경우는 또 로그인기록등을 남겨줘야 한다.
				
				
				
				//return "autologin";
				return "/login/UserLogin";
			}	
	}
	
	
	
	
}

package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	
	
	//처음에 로그인 페이지로 보내주는 곳
	@RequestMapping(value = "/login.action", method = { RequestMethod.GET })
	public String login(HttpServletRequest request, HttpServletResponse response) {
		
		
		System.out.println("asd");
		//광고관련 넘겨야 한다. & 아이디 비밀번호 오류관련
		//Map<String,String> adverMap = logService.adver();
		//request.setAttribute("adverMap", adverMap);

		
		return "/login/UserLogin";
	}
	
	
	
	
}

package com.test.SYJ_Mall.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

public interface ILoginService {
	
	String ipCheck(HttpServletRequest request);//접속자의 아이피를 체크함.
	
	String pwEnc(String password);//고객 비밀번호 암호화
	
	List<LoginDTO> loginResult(String userIp,String id, String pw);//로그인 결과
	
	void loginSuccess(HttpServletRequest request, int userSeq);//로그인 성공
	
	HashMap<String,String> adverShow();//광고관련 로직
	
	HttpServletRequest AutoLoginBanned(HttpServletRequest request);//자동로그인 방지를 위함
	
	JSONObject picCheck(HttpServletRequest request);//자동로그인 방지를 위함

	
	int userSignUp(HttpServletRequest request);//회원가입 해주는 로직

	
	
}
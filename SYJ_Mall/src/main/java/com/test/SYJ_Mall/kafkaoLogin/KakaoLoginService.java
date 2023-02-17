package com.test.SYJ_Mall.kafkaoLogin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.IpCheck;
import com.common.utill.KakaoCookies;

@Service
public class KakaoLoginService implements IKakaoLoginService {
	@Autowired
	private IKakaoLoginDAO dao;
	
	
	@Override
	public String getUserLoginCookieInfo(HttpServletRequest request, HttpServletResponse response, KakaoCookies kc, IpCheck ic) throws Exception {
		
		Map<String,String> loginMaintainMap = kc.getCookiesMaps(request, "loginMaintainInfos");
		
		String loginSaveUserId = loginMaintainMap.get("loginSaveUserId");
		String loginSaveUserPw = loginMaintainMap.get("loginSaveUserPw");
		String loginSaveUserSeq = loginMaintainMap.get("loginSaveUserSeq");
		
		
		return null;
	}
}

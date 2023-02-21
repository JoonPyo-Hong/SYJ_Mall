package com.test.SYJ_Mall.kakaoLogin;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.IpCheck;
import com.common.utill.KakaoCookies;
import com.common.utill.KakaoError;
import com.common.utill.KakaoRSA;
import com.common.utill.KakaoRecapCha;

@Service
public class KakaoLoginService implements IKakaoLoginService {
	@Autowired
	private IKakaoLoginDAO dao;
	
	
	@Override
	public String getUserLoginCookieInfo(HttpServletRequest request, HttpServletResponse response, KakaoCookies kc, IpCheck ic) throws Exception {
		
		Map<String, String> loginMaintainMap;

		loginMaintainMap = kc.getCookiesMaps(request, "loginMaintainInfos");
		
		
		if (loginMaintainMap != null) {
			
		}
		
		//String loginSaveUserId = loginMaintainMap.get("loginSaveUserId");
		//String loginSaveUserPw = loginMaintainMap.get("loginSaveUserPw");
		//String loginSaveUserSeq = loginMaintainMap.get("loginSaveUserSeq");
		
		
		return null;
	}

	
	
	@Override
	public String againLoginCheck(HttpServletRequest request, IpCheck ic, KakaoCookies kc) {
		
		String redirectUrl = null;
		
		HttpSession userSession = request.getSession();
		KakaoUserDTO userDto = (KakaoUserDTO)userSession.getAttribute("kakaoUserInfo");
		
		if (userDto != null) {
			// If user object information exists, return the last visit page.
			Cookie lastUrlInfo = kc.getCookies(request, "kakaoUserLastUrl");
			
			if (lastUrlInfo == null) redirectUrl = "http://byeanma.kro.kr:9081/SYJ_Mall/main.action";
			else redirectUrl = lastUrlInfo.getValue();
			
		}
		
		return redirectUrl;
	}



	@Override
	public String setUserRsaInfo(HttpServletRequest request) {
		
		try {
			KakaoRSA krsa = new KakaoRSA();
			
			krsa.setRSA(request);
			return "/kakaoLogin/kakaoLoginGo";
			
		} catch (Exception e) {
			KakaoError ea = new KakaoError(request, e);
			return ea.basicErrorException();
		}
		
	}



	@Override
	public int kakaoCapchaCheck(HttpServletRequest request) {
		
		KakaoRecapCha krc = new KakaoRecapCha();
		
		String siteKey = request.getParameter("recaptcha");
		String secureKey = dao.getCapchaSecureKey(request);
		
		
		if ( siteKey != null && secureKey != null) {
			
			krc.setPublicKey(siteKey); 
			krc.setSecretKey(secureKey);
			
			return krc.verifyCapcha(request);
		} else return -2;
		
	}



	@Override
	public int loginPreCheck(HttpServletRequest request, HttpServletResponse response) {
		
		int returnVal = 0;
		
		KakaoRSA krsa = new KakaoRSA();
		
		try {
			
			Map<String,String> rsaMap = krsa.getRSAuserInfoSessionMaintain(request);
			
			if (rsaMap == null) returnVal = -1;
			else {
				
				String decodeId = rsaMap.get("id");
				String decodePw = rsaMap.get("pw");
				
				String hashedPassword = BCrypt.hashpw(decodePw, BCrypt.gensalt());
				
				System.out.println(hashedPassword);
				//System.out.println(decodeId);
				//System.out.println(decodePw);
				
			}
			
			
		} catch (Exception e) {
			KakaoError ea = new KakaoError(request, e);
			returnVal = ea.basicErrorExceptionReturnInt();
		}
		
		
		
		return returnVal;
	}
}

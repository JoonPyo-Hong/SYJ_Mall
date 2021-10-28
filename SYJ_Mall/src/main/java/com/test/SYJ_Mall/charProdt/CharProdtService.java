package com.test.SYJ_Mall.charProdt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.KakaoCookie;
import com.test.SYJ_Mall.login.UserDTO;

/**
 * 
 * @author shin
 *
 */
@Service
public class CharProdtService implements ICharProdtService{
	
	@Autowired
	private ICharProdtDAO dao;
	
	//캐릭터별 상품 시작.
	@Override
	public int setCharProdtStart(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");// 유저객체
			//String charSeq = request.getParameter("charSeq");//어떤 캐릭터인지 정해준다.
			String charSeq = "3";//어떤 캐릭터인지 정해준다. <test>
			String charPicUrl = dao.getCharPicUrl(charSeq);
			
			request.setAttribute("charPicUrl", charPicUrl);
			// 마지막 페이지 정보 쿠키에 넘기는 작업
			KakaoCookie ck = new KakaoCookie();
			ck.generateCookie(response, "lastPage", "/SYJ_Mall/charAtProdtStart.action?charSeq=" + charSeq);// 마지막페이지
			
			if (userInfo == null) {
				// 로그인 되지 않은 경우
				
				
			} else {
				// 로그인이 된 경우
			}
			
			return 1;
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
	}

	
	
	
	
}

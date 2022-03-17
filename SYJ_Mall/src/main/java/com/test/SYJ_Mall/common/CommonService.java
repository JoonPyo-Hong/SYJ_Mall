package com.test.SYJ_Mall.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.test.SYJ_Mall.login.UserDTO;

/**
 * 공통기능 서비스
 * @author shin
 *
 */
@Service
public class CommonService implements ICommonService{
	@Autowired
	private ICommonDAO dao;
	
	//고객이 로그인 해줬는지 안해줬는지 확인해주는 메소드
	@Override
	public int getUserLoginChecking(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		try {
			
			HttpSession session = request.getSession();// 로그인 상태인지 아닌지 체크해준다.

			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			if (userInfo == null) return -1;
			else return 1;
			
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}

		
	}
}

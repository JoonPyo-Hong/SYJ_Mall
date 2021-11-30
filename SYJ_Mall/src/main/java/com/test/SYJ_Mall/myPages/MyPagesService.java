package com.test.SYJ_Mall.myPages;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.StringFormatClass;

@Service
public class MyPagesService implements IMyPagesService {
	@Autowired
	private IMyPagesDAO dao;

	// 마이페이지 진입 페이지
	@Override
	public int getMyPageSelect(HttpServletRequest request, HttpServletResponse response) {
		try {

			request.setAttribute("seleted", "my");// 상단-> 오늘/신규/인기/마이 중에서 인기를 선택해주는 로직
			StringFormatClass sfc = new StringFormatClass();
			int myPageNum = 1;

			if (request.getParameter("myPageNum") != null) {
				if (sfc.isStringDigit(request.getParameter("myPageNum"))) {
					int num = Integer.parseInt(request.getParameter("myPageNum"));

					if (num > 4 || num < 1)
						myPageNum = 1;
					else
						myPageNum = num;
				}
			}
			
			request.setAttribute("myPageNum",myPageNum);
			
			return myPageNum;
		} catch (Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);
				
			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}

	}
}

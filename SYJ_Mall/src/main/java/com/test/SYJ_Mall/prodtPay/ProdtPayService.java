package com.test.SYJ_Mall.prodtPay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
/**
 * 상품결제 Service
 * @author shin
 *
 */
@Service
public class ProdtPayService implements IProdtPayService {
	@Autowired
	private IProdtPayDAO dao;
	
	//결제화면 메인
	@Override
	public int getProdtPayStart(HttpServletRequest request, HttpServletResponse response, KakaoCookie kc, ErrorAlarm ea, StringFormatClass sf) {
		try {
			
			int test = dao.getTest();
			
			return 1;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
}

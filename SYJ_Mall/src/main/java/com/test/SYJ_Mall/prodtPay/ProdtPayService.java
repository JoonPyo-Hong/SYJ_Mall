package com.test.SYJ_Mall.prodtPay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
import com.test.SYJ_Mall.login.UserDTO;
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
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			//로그인이 안된 경우에는 접근 불가 처리 해준다.
			//if (userInfo == null) return -1;
		
			String prodtId = request.getParameter("product_obj_id");
			String prodtCnt = request.getParameter("product_obj_cnt");
			
			Integer[] prodtIdArr = (Integer[]) sf.stringSplitList(prodtId,"#");
			Integer[] prodtCntArr = (Integer[]) sf.stringSplitList(prodtCnt,"#");
			
			//개수가 안맞으면 오류발생시킨다.
			if (prodtIdArr.length != prodtCntArr.length) return -1;
			
			
			//1. 주문제품 관련 객체 가져오기 => 마이페이지에서 넘긴 정보로 가야한다.
			
			
			
			
			
			
			
			return 1;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
}

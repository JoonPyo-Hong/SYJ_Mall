package com.test.SYJ_Mall.prodtPay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			
			//리프레시 한 경우에 오류가 발생하므로 세션에 넣어주는 방법을 모색해야 한다.
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			//로그인이 안된 경우에는 접근 불가 처리 해준다.
			if (userInfo == null) return -1;
		
			String prodtId = request.getParameter("product_obj_id");
			String prodtCnt = request.getParameter("product_obj_cnt");
			
			String[] prodtIdArr = sf.stringSplitList(prodtId,"#");//아이디
			String[] prodtCntArr = sf.stringSplitList(prodtCnt,"#");//해당 아이디에 대한 물품 구매개수
			
			//개수가 안맞으면 오류발생시킨다.
			if (prodtIdArr.length != prodtCntArr.length) return -1;
			
			Map<String,Integer> prodtCntMap = new HashMap<String, Integer>();
			
			for (int i = 0; i < prodtIdArr.length; i++) {
				prodtCntMap.put(prodtIdArr[i],Integer.parseInt(prodtCntArr[i]));
			}
			
			//1. 주문제품 관련 객체 가져오기 => 마이페이지에서 넘긴 정보로 가야한다.
			List<ProdtPayDTO> prodtList = dao.getProdtPayList(prodtId);
			
			//배송비 지정
			int shipFee = 3000;//향후에 다시 지정해도됨-기본 3000원 지정
			
			//총 상품가 지정
			int totalProdtPay = 0;
			
			if (prodtList.size() != 0) {
				//고객이 몇개주문을 원하는지 값을 넘겨준다.
				for (int i = 0; i < prodtList.size(); i++) {
					ProdtPayDTO pdto = prodtList.get(i);
					int prodtSeq = pdto.getProdtSeq();
					pdto.setProdtBuyCnt(prodtCntMap.get(Integer.toString(prodtSeq)));
					
					//일단 갑자기 재고가 없어질 경우에 생각해줘야 될 로직임
					//if (pdto.getPossibleProdtCnt() != 0) pdto.setProdtBuyCnt(prodtCntMap.get(Integer.toString(prodtSeq)));
					int pdtosPrice = Integer.parseInt(pdto.getProdtPrice()) * pdto.getProdtBuyCnt();
					pdto.setProdtPrice(sf.moneyDotString(pdtosPrice));
					
					totalProdtPay += pdtosPrice;
				}
				
				request.setAttribute("prodtList", prodtList);
			}
			
			//상품가 + 배송비 지정
			int totalProdtPayShip = shipFee + totalProdtPay;
			
			
			//2. 주문고객 정보 객체 가져오기
			List<ProdtPayUserDTO> userDtoList = dao.getProdtPayUserInfo(userInfo.getUserSeq());
			
			if (userDtoList.size() != 0) request.setAttribute("userDtoList", userDtoList.get(0));
			
			
			request.setAttribute("shipFee", sf.moneyDotString(shipFee));//배송비
			request.setAttribute("totalProdtPay", sf.moneyDotString(totalProdtPay));//총상품 비용
			request.setAttribute("totalProdtPayShip", sf.moneyDotString(totalProdtPayShip));//총상품 비용 + 배송비용
			
			return 1;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
}

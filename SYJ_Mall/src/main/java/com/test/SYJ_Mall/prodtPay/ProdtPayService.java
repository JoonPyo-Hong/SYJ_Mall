package com.test.SYJ_Mall.prodtPay;

import java.util.ArrayList;
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
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			//로그인이 안된 경우에는 접근 불가 처리 해준다.
			if (userInfo == null) return -1;
			
			List<ProdtInstDTO> pidtoList = (List<ProdtInstDTO>) session.getAttribute("pidtoList");//세션에 존재하는 유저의 주문관련 제품정보들
			Map<String,Integer> prodtCntMap = new HashMap<String,Integer>();//해당 주문제품 map 에 넣어주기
			
			//마이페이지에서 넘어온 경우는 세션을 없애주고 시작해야한다.
			String prodtId = request.getParameter("product_obj_id");
			String prodtCnt = request.getParameter("product_obj_cnt");
			
			/*==================1. 주문제품 관련 객체 가져오기 => 마이페이지에서 넘긴 정보로 가야한다.==================*/
			List<ProdtPayDTO> prodtList;
			String prodtDbInfoList = null;//디비로 넘길 물품번호 개체들
			
			//마이페이지에서 넘어온 경우
			if (prodtId != null && prodtCnt != null) {
				
				//기존세션 지워준다.
				session.removeAttribute("pidtoList");
				prodtDbInfoList = prodtId;
				
				String[] prodtIdArr = sf.stringSplitList(prodtId,"#");//아이디
				String[] prodtCntArr = sf.stringSplitList(prodtCnt,"#");//해당 아이디에 대한 물품 구매개수
				
				//개수가 맞지 않으면 종료 시킨다.
				if (prodtIdArr.length != prodtCntArr.length) return -1;
				
				//세션에 회원이 주문할 물품정보 넣어주기
				pidtoList = new ArrayList<ProdtInstDTO>();
				
				for (int i = 0; i < prodtIdArr.length; i++) {
					pidtoList.add(new ProdtInstDTO(prodtIdArr[i],Integer.parseInt(prodtCntArr[i])));
				}
				
				session.setAttribute("pidtoList", pidtoList);	
			} 
			//마이페이지에서 넘어온 경우가 아니고 세션이 존재하는 경우
			else if (pidtoList != null) {
				StringBuffer sb = new StringBuffer();
				
				for (ProdtInstDTO dto : pidtoList) {
					sb.append(dto.getProdtId());
					sb.append("#");
				}
				
				prodtDbInfoList = sb.toString();
			} else {
				return -1;
			}
			
			//좀더 빠르게 찾기 위해 map 객체에 넣어주기
			for (int i = 0; i < pidtoList.size(); i++) {
				String prodtSeq = pidtoList.get(i).getProdtId();
				int prodtCnts = pidtoList.get(i). getProdtCnt();
				
				prodtCntMap.put(prodtSeq,prodtCnts);
			}
			
			prodtList = dao.getProdtPayList(prodtDbInfoList);
						
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
			

			/*==================2. 주문고객 정보 객체 가져오기==================*/
			List<ProdtPayUserDTO> userDtoList = dao.getProdtPayUserInfo(userInfo.getUserSeq());
			
			if (userDtoList.size() != 0) {
				ProdtPayUserDTO udl = userDtoList.get(0);
				String hasCoin =  sf.moneyDotString(udl.getUserHasCoin());
				
				request.setAttribute("userDtoList", udl);
				request.setAttribute("userHasCoin", hasCoin);
			}
				
			
			request.setAttribute("shipFee", sf.moneyDotString(shipFee));//배송비
			request.setAttribute("totalProdtPay", sf.moneyDotString(totalProdtPay));//총상품 비용
			request.setAttribute("totalProdtPayShip", sf.moneyDotString(totalProdtPayShip));//총상품 비용 + 배송비용
			
			////총상품 비용 + 배송비용 session
			session.removeAttribute("totalProdtPayShipSession");
			session.setAttribute("totalProdtPayShipSession", totalProdtPayShip);
			
			return 1;
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return -1;
		}
	}
	
	//고객의 기본 배송정보 가져오기
	@Override
	public ProdtPayUserDTO getProdtPayUserInfos(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea) {
		
		try {
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			List<ProdtPayUserDTO> userDtoList = dao.getProdtPayUserInfo(userInfo.getUserSeq());
			
			if (userDtoList.size() == 0) return null;
			
			return userDtoList.get(0);
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return null;
		}
	}
	
	//체크박스에서 해당 물품의 갯수를 선택할 경우 해당 제품의 정보를 다시 가져와주는 로직
	@Override
	public List<ProdtPayDTO> getProdtCheckedInfos(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea, StringFormatClass sf) {
		
		try {
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			//로그인이 안된 경우에는 접근 불가 처리 해준다.
			if (userInfo == null) return null;
			
			
			String selectProdtSeq = request.getParameter("selectProdtSeq");
			int selectProdtCnt = Integer.parseInt(request.getParameter("selectProdtCnt"));
			
			List<ProdtInstDTO> pidtoList = (List<ProdtInstDTO>) session.getAttribute("pidtoList");//세션에 존재하는 유저의 주문관련 제품정보들
			Map<String,Integer> prodtCntMap = new HashMap<String,Integer>();//해당 주문제품 map 에 넣어주기
			
			/*================== 1. 주문제품 관련 객체 가져오기 ==================*/
			List<ProdtPayDTO> prodtList;//제품 정보 객체
			String prodtDbInfoList;//디비로 넘길 물품번호 개체들
			
			//회원 장바구니 정보 세션이 존재하는 경우
			if (pidtoList != null) {
				StringBuffer sb = new StringBuffer();
				
				for (ProdtInstDTO dto : pidtoList) {
					sb.append(dto.getProdtId());
					sb.append("#");
				}
				
				prodtDbInfoList = sb.toString();
			} else {
				prodtDbInfoList = "";
			}
			
			
			//좀더 빠르게 찾기 위해 map 객체에 넣어주기 -> 이부분에서 특정 물픔을 어떤수량으로 바꿨는지 체크를 해줘야한다.
			for (int i = 0; i < pidtoList.size(); i++) {
				ProdtInstDTO pidto = pidtoList.get(i);
				String prodtSeq = pidto.getProdtId();
				int prodtCnt; 
				
				if (pidto.getProdtId().equals(selectProdtSeq)) {
					pidto.setProdtCnt(selectProdtCnt);
					prodtCnt = pidto.getProdtCnt();
					
				} else prodtCnt = pidtoList.get(i).getProdtCnt();
				
				prodtCntMap.put(prodtSeq,prodtCnt);
			}
			
			
			
			prodtList = dao.getProdtPayList(prodtDbInfoList);
			
			int totalProdtPayShip = 3000;
			
			//고객이 몇개주문을 원하는지 값을 넘겨준다.
			for (int i = 0; i < prodtList.size(); i++) {
				ProdtPayDTO pdto = prodtList.get(i);
				int prodtSeq = pdto.getProdtSeq();
				pdto.setProdtBuyCnt(prodtCntMap.get(Integer.toString(prodtSeq)));
				
				//일단 갑자기 재고가 없어질 경우에 생각해줘야 될 로직임
				//if (pdto.getPossibleProdtCnt() != 0) pdto.setProdtBuyCnt(prodtCntMap.get(Integer.toString(prodtSeq)));
				int pdtosPrice = Integer.parseInt(pdto.getProdtPrice()) * pdto.getProdtBuyCnt();
				totalProdtPayShip += pdtosPrice;
				pdto.setProdtPrice(sf.moneyDotString(pdtosPrice));
				
			}
			
			
			//session 새롭게 update
			session.removeAttribute("pidtoList");
			session.setAttribute("pidtoList", pidtoList);
			
			//총상품 비용 + 배송비용 session
			session.removeAttribute("totalProdtPayShipSession");
			session.setAttribute("totalProdtPayShipSession", totalProdtPayShip);
			
			
			return prodtList;
			
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return null;
		}
		
	}
	
	//회원의 기프트 카드 조회 -> 가용가능한 기프트 카드 금액을 보여준다.
	@Override
	public String getProdtUserGiftCard(HttpServletRequest request, HttpServletResponse response,ErrorAlarm ea, StringFormatClass sf) {
		try {
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			if (userInfo == null) return null;
			
			String userGiftBalance = sf.moneyDotString(dao.getProdtUserGiftMoney(userInfo.getUserSeq()));
			
			//현재 기프트 카드 조회했다는걸 세션정보에 유지시켜줘야 한다.
			session.removeAttribute("userGiftBalance");
			session.setAttribute("userGiftBalance", userGiftBalance);
			
			
			return userGiftBalance;
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return null;
		}
	}
	
	// 회원이 가용할 수 있는 최대 카카오포인트 or 기프트 카드 금액 체크
	@Override
	public List<Integer> getProdtUserBalance(HttpServletRequest request, HttpServletResponse response, ErrorAlarm ea,StringFormatClass sf) {
		
		try {
			
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			String useCostStr = request.getParameter("useCost");
			
			int INTMAX = Integer.MAX_VALUE;
			int useCost = Integer.parseInt(request.getParameter("useCost"));
			
			//리스트는 고객 포인트, 고객 기프트 , 총가격으로 구성할것
			List<Integer> resultArr = new ArrayList<Integer>();
			
			int totalProdtPayShip = (Integer) session.getAttribute("totalProdtPayShipSession");//현재 물품 전체 금액
			
			if (userInfo == null || !sf.isStringDigit(useCostStr) || useCost > INTMAX) {
				resultArr.add(0);// 고객 포인트
				resultArr.add(0);// 고객 기프트
				resultArr.add(totalProdtPayShip);// 총 가격
				
				return resultArr;
			}
			
			
			int checkNum = Integer.parseInt(request.getParameter("checkNum"));
			
			if (checkNum == 1) {
				//카카오 포인트 조회
				int userKakaoBalance = dao.getProdtUserKakaoPoint(userInfo.getUserSeq());
				int resultBalance = useCost > userKakaoBalance ? userKakaoBalance : useCost;
				
				int kakaoHasGift = Integer.parseInt(request.getParameter("kakaoHasGift"));
				
				if (kakaoHasGift != 0) {
					int dbUserGift = dao.getProdtUserGiftMoney(userInfo.getUserSeq());
					kakaoHasGift = dbUserGift >= kakaoHasGift ? kakaoHasGift : 0;
				}
				
				int totalUserCostPay = totalProdtPayShip - (resultBalance + kakaoHasGift);
				
				// 회원의 기프트카드 사용과 포인트 사용량이 현재 모든 물품의 총합보다 더 큰 경우
				if (totalUserCostPay >= 0) {
					
					resultArr.add(resultBalance);
					resultArr.add(kakaoHasGift);
					resultArr.add(totalUserCostPay);
					
					return resultArr;
				} else {
					
					resultBalance = totalProdtPayShip - kakaoHasGift;
					
					resultArr.add(resultBalance);
					resultArr.add(kakaoHasGift);
					resultArr.add(0);
					
					return resultArr;
				}

			} else if (checkNum == 2) {
				//기프트 카드 조회
				int userGiftBalance = dao.getProdtUserGiftMoney(userInfo.getUserSeq());
				int resultBalance = useCost > userGiftBalance ? userGiftBalance : useCost;
				
				int kakaoHasPoint = Integer.parseInt(request.getParameter("kakaoHasPoint"));
				
				if (kakaoHasPoint != 0) {
					int dbUserPoint = dao.getProdtUserKakaoPoint(userInfo.getUserSeq());
					kakaoHasPoint = dbUserPoint >= kakaoHasPoint ? kakaoHasPoint : 0;
				}
				
				int totalUserCostPay = totalProdtPayShip - (resultBalance + kakaoHasPoint);
			
				
				// 회원의 기프트카드 사용과 포인트 사용량이 현재 모든 물품의 총합보다 더 큰 경우
				if (totalUserCostPay >= 0) {
					
					resultArr.add(kakaoHasPoint);
					resultArr.add(resultBalance);
					resultArr.add(totalUserCostPay);
					
					return resultArr;
				} else {
					
					resultBalance = totalProdtPayShip - kakaoHasPoint;
					
					resultArr.add(kakaoHasPoint);
					resultArr.add(resultBalance);
					resultArr.add(0);
					
					return resultArr;
				}
				
			} else return null;
			
			
			
		} catch(Exception e) {
			ea.basicErrorException(request, e);
			return null;
		}
	}
}

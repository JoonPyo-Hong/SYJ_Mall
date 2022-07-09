package com.test.SYJ_Mall.newProduct;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.CommonDAO;
import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.KakaoCookie;
import com.test.SYJ_Mall.login.UserDTO;

@Service
public class NewproductService implements INewProductService {
	@Autowired
	private INewProductDAO dao;
	private CommonDAO cdao;

	// 맨 처음 신규 페이지 로딩
	@Override
	public int getNewProductInfo(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");// 유저객체

			int themeNum = 2;// 테마 번호--> 지정해주면 바뀐다.(2번을 기본으로 한다.)
			
			
			// 상단에 표시될 페이지
			request.setAttribute("seleted", "new");// 상단-> 오늘/신규/인기/마이 중에서 인기를 선택해주는 로직
			
			// 마지막 페이지 정보 쿠키에 넘기는 작업
			KakaoCookie ck = new KakaoCookie();
			ck.generateUrlCookie(response,"newProductMain",60 * 60 * 24 * 7);
			//ck.generateCookie(response, "lastPage", "newProductMain");// 마지막페이지

			// 공통부분 - 상단 물품 배너 리스트
			List<RecommendTopProdDTO> recTopPrdList = dao.getRecommendTopProdDTOList();
			request.setAttribute("recommendThemeTop", recTopPrdList);
			
			//새로나온 친구들 상품 목록
			double newFriendsCount = dao.getNewFriendsCount() / 8.0;//총갯수 에서 페이징 변수를 만들어준다.
			request.setAttribute("newFriendsCount", (int)Math.ceil(newFriendsCount));
			
			int firstPaging = 1;//처음 페이징
			
			List<RecommendThemeDTO> rtp;//신규테마물품
			List<NewFriendsProdDTO> newFdtoList;//새로운 친구들
			String themeSubject;// 테마 이름
			
			if (userInfo == null) {
				// 로그인 되지 않은 경우
				String basketList = getCookieBasket(request, response);
				rtp = dao.getNewRecommendThemeNoLogin(basketList, themeNum);//신규테마물품
				newFdtoList = dao.getNewFriendDtosNologin(basketList,firstPaging);//새로운 친구들
				
				themeSubject = rtp.get(0).getCategoryNm();// 테마 이름

			} else {
				// 로그인이 된 경우
				rtp = dao.getNewRecommendTheme(userInfo.getUserSeq(), themeNum);//신규테마물품
				newFdtoList = dao.getNewFriendDtos(userInfo.getUserSeq(),firstPaging);//새로운 친구들
				
				themeSubject = rtp.get(0).getCategoryNm();// 테마 이름
			}
			
			request.setAttribute("recommendTheme", rtp);// 추천테마 관련 객체들
			request.setAttribute("themeSubject", themeSubject);// 추천테마 주제
			request.setAttribute("newFdtoList", newFdtoList);//새로운 친구들 상품 객체

			return 1;
		} catch (Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();

			return -1;
		}
	}

	// 쿠키에 존재하는 장바구니 내역 가져오기
	@Override
	public String getCookieBasket(HttpServletRequest request, HttpServletResponse response) {

		KakaoCookie kc = new KakaoCookie();

		String basketList = (String) kc.getCookieInfo(request, "basketList");

		// 쿠키내에 장바구니 내역이 없는경우
		if (basketList == null) {

			kc.generateCookie(response, "basketList", "", 60 * 60 * 24 * 7);// 쿠키생성 7 일동안 유지
			String newBasketList = (String) kc.getCookieInfo(request, "basketList");

			return newBasketList;

		} else {
			// 쿠키내에 장바구니 내역이 있는경우

			if (basketList.length() != 0) {
				basketList = basketList.substring(0, basketList.length() - 1);
				return basketList;// 기존쿠키 넘기기
			} else {// basketList 에 지금 아무런 정보가 존재하지 않는경우
				return basketList;// 기존쿠키 넘기기
			}
		}
	}

	// 장바구니 처리 기능
	@Override
	public int setnewProductBasket(HttpServletRequest request, HttpServletResponse response) {

		try {
			int prodtId = Integer.parseInt(request.getParameter("productId"));
			HttpSession session = request.getSession();// 로그인 상태인지 아닌지 체크해준다.

			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");

			// 1. 로그인 되어 있지 않은 경우
			if (userInfo == null) {
				KakaoCookie kc = new KakaoCookie();
				String basketList = (String) kc.getCookieInfo(request, "basketList");

				// 이미 장바구니에 담긴 번호인지 체크해준다.--> null check 해줘야한다.
				String[] basketLists;
				
				if (basketList == null) basketLists = new String[0];
				else basketLists = basketList.split("#");

				// 장바구니 쿠키 객체에서 해당물품번호가 있는지 찾아준다. 없으면 -1을 리턴할것
				int index = Arrays.asList(basketLists).indexOf(Integer.toString(prodtId));

				// 해당 물품이 없는 경우 -> 상품 쿠키 객체에 물품 아이디를 추가해준다.
				if (index == -1) {

					StringBuffer sb = new StringBuffer();
					
					if (basketList != null) sb.append(basketList);
					
					sb.append(Integer.toString(prodtId));
					sb.append("#");

					kc.modifyCookie(request, response, "basketList", sb.toString(), 60 * 60 * 24 * 7);

					return 1;// 장바구니 추가
				} else {
					// 해당 물품이 존재하는경우 -> 장바구니에서 빼주기
					StringBuffer sb = new StringBuffer();

					for (int i = 0; i < basketLists.length; i++) {
						// 빼려고하는 상품 번호는 그냥 안넣으면 된다.
						if (!basketLists[i].equals(Integer.toString(prodtId))) {
							sb.append(basketLists[i]);
							sb.append("#");
						}
					}

					kc.modifyCookie(request, response, "basketList", sb.toString(), 60 * 60 * 24 * 7);

					return 2;// 장바구니 해제
				}
			}
			// 2. 로그인 되어 있는 경우
			else {
				int userSeq = userInfo.getUserSeq();// 유저 고유번호
				cdao = new CommonDAO();
				int result = cdao.setBasketProdt(userSeq, prodtId);
				cdao.close();

				//System.out.println(result);
				return result;

			}

		} catch (Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -100;
		}

	}

	// 물품알림 기능 관련
	@Override
	public int setnewProductAlarm(HttpServletRequest request) {
		try {

			int productId = Integer.parseInt(request.getParameter("productId"));// 상품번호
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");

			// --- 알람 서비스는 로그인이 되어야만 진행이 될수 있는 서비스이다.

			// 1. 로그인이 안되어있는 경우
			if (userInfo == null) {

				return -2;// 로그인이 되어있지 않으면 알람서비스를 이용할 수 없음. -> 로그인 유도
			}
			// 2. 로그인이 되어있는 경우
			else {
				int userSeq = userInfo.getUserSeq();// 유저 고유번호
				cdao = new CommonDAO();
				int result = cdao.setAlarmProdt(userSeq, productId);
				cdao.close();

				return result;
			}

		} catch (Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
	}
	
	//새로나온 친구들 물품 무한스크롤
	@Override
	public List<NewFriendsProdDTO> getNewFriendsProdts(HttpServletRequest request,HttpServletResponse response) {
		
		try {
			int presentPaging = Integer.parseInt(request.getParameter("newFriendsPaging"));//현재페이지 숫자
			
			//로그인 상태인지 아닌지 체크를 해줘야한다.
			HttpSession session = request.getSession();// 로그인 상태인지 아닌지 체크해준다.
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");
			
			//로그인 하지 않은 경우
			if (userInfo == null) {
				String basketList = getCookieBasket(request, response);
				return dao.getNewFriendDtosNologin(basketList,presentPaging);
			} 
			//로그인 한 경우
			else {
				return dao.getNewFriendDtos(userInfo.getUserSeq(),presentPaging);
			}
			
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return null;
		}
		
		
		
	}
	
	//새로나온 친구들 더보기 옵션-테마 지정 => 재설계 필요
	@Override
	public int getNewProdcutAddInfo(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");// 유저객체
			
			int sortedOption,themeNum,prodtCatgr,paging;//정렬옵션,테마(대분류) 번호,소분류 번호, 페이징 변수
			
			if (request.getParameter("sortedOption") == null) sortedOption = 1;
			else sortedOption = Integer.parseInt(request.getParameter("sortedOption"));
			
			if (request.getParameter("themeNum") == null) themeNum = 2;
			else themeNum = Integer.parseInt(request.getParameter("themeNum"));
			
			if (request.getParameter("prodtCatgr") == null) prodtCatgr = 0;//0으로 하면 전체목록 아닐경우에 소분류 목록 -> 소분류 필터링
			else prodtCatgr = Integer.parseInt(request.getParameter("prodtCatgr"));
			
			if (request.getParameter("paging") == null) paging = 1;
			else paging = Integer.parseInt(request.getParameter("paging"));
			
			List<RecommendThemeDTO> rtp;// 추천테마 관련 객체들
			List<SmallCategoryDTO> prodtCategory = dao.getNewRecommendProdtCategory(themeNum);//소분류 목록 가져오기
			List<BigCategoryInfoDTO> themeSubjectList = dao.getBigCategoryNm(themeNum);//추천테마 dto -> 전체 토이 등등....
			
			BigCategoryInfoDTO selectBcDto = null;//선택된 추천테마 주제와 배경
			
			//선택된 추천테마 주제와 배경을 픽하기 위한 로직
			for (BigCategoryInfoDTO bcidto : themeSubjectList) {
				if (bcidto.getSelected().equals("Y")) {
					selectBcDto = bcidto;
				}
			}
			
			int prodtCount = 0;//제품 총갯수
			int perProdtCount;//제품 총갯수에서 8을 나눈것 => 총 페이징 변수 지정하기 위함
			
			if (userInfo == null) {
			//로그인 안한 경우
				String basketList = getCookieBasket(request, response);
				
				//1.상품 대분류 전체인 경우 -> 즉 대분류 필터가 없다는 뜻이다.
				if (themeNum == 1) {
					
					//소분류의 필터유무
					//1-1 소분류 필터가 없는경우 : 전체 -> 애는 갯수를 좀 다르게 설정할것 pending issue 로 인해서
					if (prodtCatgr == 0) {
						//상품의 총 갯수.
						prodtCount = dao.getNoBigCategoryCount();
						perProdtCount =  (int)Math.ceil(prodtCount/16.0);
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						rtp = dao.getNoBigCategoryNoSmallCategory(basketList,sortedOption,paging);
					}
					//1-2 소분류 필터가 있는 경우 : 필터링
					else {
						//상품의 총 갯수. 전체중 소분류 필터
						prodtCount = dao.getSmallCategoryCountFilter(prodtCatgr,themeNum);
						perProdtCount =  (int)Math.ceil(prodtCount/8.0);
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						rtp = dao.getNoBigCategoryExistSmallCategory(basketList,prodtCatgr,sortedOption,paging);
					}
				}
				//2.상품 대분류 전체가 아닌 경우 -> 대분류 필터가 존재
				else {
					//소분류의 필터유무
					//2-1 소분류 필터가 없는경우 : 전체
					if (prodtCatgr == 0) {
						//상품의 총 갯수.
						prodtCount = dao.getBigCategoryCount(themeNum);
						perProdtCount =  (int)Math.ceil(prodtCount/16.0);
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						rtp = dao.getBigCategoryNoSmallCategory(basketList,themeNum,sortedOption,paging);
						
					}
					//2-2 소분류 필터가 있는 경우 : 필터링
					else {
						//상품의 총 갯수.
						prodtCount = dao.getSmallCategoryCountFilter(prodtCatgr,themeNum);//지워줘야함
						perProdtCount =  (int)Math.ceil(prodtCount/8.0);//지워줘야함
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						rtp = dao.getBigCategoryExistSmallCategory(basketList,themeNum,prodtCatgr,sortedOption,paging);
					}
				}
				
			} else {
			//로그인 한 경우
				//1.상품 대분류 전체인 경우 -> 즉 대분류 필터가 없다는 뜻이다.
				if (themeNum == 1) {
					//소분류의 필터유무
					//1-1 소분류 필터가 없는경우 
					if (prodtCatgr == 0) {
						//상품의 총 갯수.
						prodtCount = dao.getNoBigCategoryCount();
						perProdtCount =  (int)Math.ceil(prodtCount/16.0);
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						rtp = dao.getNoBigCategoryNoSmallCategory(userInfo.getUserSeq(),sortedOption,paging);
					}
					//1-2 소분류 필터가 있는 경우 : 필터링
					else {
						//상품의 총 갯수. 전체중 소분류 필터
						prodtCount = dao.getSmallCategoryCountFilter(prodtCatgr,themeNum);
						perProdtCount =  (int)Math.ceil(prodtCount/8.0);
						
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						rtp = dao.getNoBigCategoryExistSmallCategoryLogin(userInfo.getUserSeq(),prodtCatgr,sortedOption,paging);
					}
					
					
				}
				//2.상품 대분류 전체가 아닌 경우 -> 대분류 필터가 존재
				else {
					//소분류의 필터유무
					//2-1 소분류 필터가 없는경우 : 전체
					if (prodtCatgr == 0) {
						//상품의 총 갯수.
						prodtCount = dao.getBigCategoryCount(themeNum);
						perProdtCount =  (int)Math.ceil(prodtCount/16.0);
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						rtp = dao.getBigCategoryNoSmallCategoryLogin(userInfo.getUserSeq(),themeNum,sortedOption,paging);
						
					}
					//2-2 소분류 필터가 있는 경우 : 필터링
					else {
						//상품의 총 갯수.
						prodtCount = dao.getSmallCategoryCountFilter(prodtCatgr,themeNum);
						perProdtCount =  (int)Math.ceil(prodtCount/8.0);
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						rtp = dao.getBigCategoryExistSmallCategoryLogin(userInfo.getUserSeq(),themeNum,prodtCatgr,sortedOption,paging);
					}
				}
			}
			
			
			request.setAttribute("recommendTheme", rtp);// 추천테마 관련 객체들
			request.setAttribute("perProdtCount", perProdtCount);// 총몇번의 무한스크롤 해야하는지
			request.setAttribute("paging", paging);// 현재 페이지(무한스크롤 관련)
			request.setAttribute("selectBcDto", selectBcDto);// 대분류 선택옵션 중 선택된 dto 객체
			request.setAttribute("themeSubjectList", themeSubjectList);// 대분류 선택옵션들
			request.setAttribute("sortedOption", sortedOption);// 정렬옵션
			request.setAttribute("prodtCount", prodtCount);// 상품갯수
			request.setAttribute("prodtCategory", prodtCategory);// 추천테마 소분류 항목
			request.setAttribute("prodtCatgr", prodtCatgr);// 추천테마 소분류 번호
			request.setAttribute("themeNum", themeNum);// 추천테마 대분류 번호

			
			return 1;
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return -1;
		}
		
		
	}
	
	//신규테마 무한스크롤
	@Override
	public List<RecommendThemeDTO> getnewProductMainAddAjaxInfo(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			HttpSession session = request.getSession();
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");// 유저객체
			
			int	sortedOption	= Integer.parseInt(request.getParameter("sortedOption"))// 정렬옵션
			,	themeNum     	= Integer.parseInt(request.getParameter("themeNum"))//대분류 번호
			,	prodtCatgr		= Integer.parseInt(request.getParameter("prodtCatgr"))//소분류 번호
			,	paging			= Integer.parseInt(request.getParameter("paging"));//페이징 번호
			
			
			if (userInfo == null) {
			//로그인 하지 않은 경우
				String basketList = getCookieBasket(request, response);
				//1.상품 대분류 전체인 경우 -> 즉 대분류 필터가 없다는 뜻이다.
				
				if (themeNum == 1) {
					//소분류의 필터유무
					//1-1 소분류 필터가 없는경우 : 전체
					if (prodtCatgr == 0) {
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						return dao.getNoBigCategoryNoSmallCategory(basketList,sortedOption,paging);
					}
					//1-2 소분류 필터가 있는 경우 : 필터링
					else {
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						return dao.getNoBigCategoryExistSmallCategory(basketList,prodtCatgr,sortedOption,paging);
					}

				}
				//2.상품 대분류 전체가 아닌 경우 -> 대분류 필터가 존재
				else {
					//소분류의 필터유무
					//2-1 소분류 필터가 없는경우 : 전체
					if (prodtCatgr == 0) {
						//상품의 총 갯수.
						return dao.getBigCategoryNoSmallCategory(basketList,themeNum,sortedOption,paging);
					}
					//2-2 소분류 필터가 있는 경우 : 필터링
					else {
						//상품의 총 갯수.
						return dao.getBigCategoryExistSmallCategory(basketList,themeNum,prodtCatgr,sortedOption,paging);
					}
				}
				
				
			} else {
			//로그인 한 경우
				
				if (themeNum == 1) {
					//소분류의 필터유무
					//1-1 소분류 필터가 없는경우 : 전체
					if (prodtCatgr == 0) {
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						return dao.getNoBigCategoryNoSmallCategory(userInfo.getUserSeq(),sortedOption,paging);
					}
					//1-2 소분류 필터가 있는 경우 : 필터링
					else {
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						return dao.getNoBigCategoryExistSmallCategoryLogin(userInfo.getUserSeq(),prodtCatgr,sortedOption,paging);
					}

				}
				//2.상품 대분류 전체가 아닌 경우 -> 대분류 필터가 존재
				else {
					//소분류의 필터유무
					//2-1 소분류 필터가 없는경우 : 전체
					if (prodtCatgr == 0) {
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						return dao.getBigCategoryNoSmallCategoryLogin(userInfo.getUserSeq(),themeNum,sortedOption,paging);
					}
					//2-2 소분류 필터가 있는 경우 : 필터링
					else {
						//상품 상세목록 가져오기(필터링 포함 : 가격순 필터링과 같은 필터링)
						return dao.getBigCategoryExistSmallCategoryLogin(userInfo.getUserSeq(),themeNum,prodtCatgr,sortedOption,paging);
					}
				}
			}
			
			
		} catch(Exception e) {
			IpCheck ic = new IpCheck();
			String ip = ic.getClientIP(request);

			ErrorAlarm ea = new ErrorAlarm(e, ip);
			ea.errorDbAndMail();
			return null;
		}	
	}

}

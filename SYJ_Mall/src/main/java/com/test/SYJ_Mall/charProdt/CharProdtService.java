package com.test.SYJ_Mall.charProdt;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.ErrorAlarm;
import com.common.utill.IpCheck;
import com.common.utill.KakaoCookie;
import com.common.utill.StringFormatClass;
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
			UserDTO userInfo = (UserDTO) session.getAttribute("userinfo");//유저객체
			String charSeq = request.getParameter("charSeq");//어떤 캐릭터인지 정해준다.
			String sortedOption = request.getParameter("sortedOption");
			StringFormatClass sfc = new StringFormatClass();
			
			//캐릭터 번호 지정
			if ((charSeq == null) || (!(sfc.isStringDigit(charSeq) && sfc.stringToDigitTerm(charSeq,1,15)))) {
				charSeq = "1";//이상한값이 넘어오면 그냥 0으로 초기화해줌
			}
			
			//정렬옵션 지정
			if ((sortedOption == null) || (!(sfc.isStringDigit(sortedOption) && sfc.stringToDigitTerm(sortedOption,1,4)))) {
				sortedOption = "1";
			}
			
			List<CharHeadTitleDTO> headDto = dao.getCharHeadData(charSeq);//상단 캐릭터이름과 사진 불러오는곳
			String charHeadName = headDto.get(0).getCharName();//캐릭터 이름
			String charHeadPicUrl = headDto.get(0).getCharImg();//캐릭터 사진
			int charHeadCount = headDto.get(0).getCharCount();//캐릭터 품목 갯수
			int pageAjaxCount = (int) Math.ceil(charHeadCount / 6.0);// 6개씩 끊어서 출력해주기
			
			request.setAttribute("charSeq", charSeq);
			request.setAttribute("charHeadName", charHeadName);
			request.setAttribute("charHeadPicUrl", charHeadPicUrl);
			request.setAttribute("charHeadCount", charHeadCount);
			request.setAttribute("sortedOption", sortedOption);
			request.setAttribute("pageAjaxCount", pageAjaxCount);
			
			// 마지막 페이지 정보 쿠키에 넘기는 작업
			KakaoCookie ck = new KakaoCookie();
			ck.generateCookie(response, "lastPage", "/SYJ_Mall/charAtProdtStart.action?charSeq=" + charSeq);// 마지막페이지
			
			List<CharProdtDTO> charProdts;
			
			if (userInfo == null) {
				// 로그인 되지 않은 경우
				String basketList = (String)ck.getCookieInfo(request, "basketList");// 12#45# 이와 같은형식의 상품번호정보가 존재함
				int paging = 1;
				charProdts = dao.getCharProdts(charSeq,sortedOption,paging,basketList);
				
				
				for (CharProdtDTO dtos : charProdts) {
					System.out.println(dtos.getProdId() + " , " + dtos.getProdNm());
				}
				System.out.println("=============================");
				 
				request.setAttribute("charProdts", charProdts);//임시
				
				
			} else {
				// 로그인이 된 경우 -- 아래는 임시
				
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

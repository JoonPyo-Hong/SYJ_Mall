package com.test.SYJ_Mall.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.AdverDTO;
import com.common.utill.AutoLoginPic;
import com.common.utill.Encryption;
import com.common.utill.IpCheck;

@Service
public class LoginService implements ILoginService {
	
	@Autowired
	private LoginDAO dao;

	@Override
	public String ipCheck(HttpServletRequest request) {//접속자의 아이피를 체크함
		
		IpCheck ip = new IpCheck();
		
		return ip.getClientIP(request);
	}
	
	@Override
	public String pwEnc(String password) {//접속자의 비밀번호를 변환
		
		Encryption enc = new Encryption();
		
		return enc.returnEncVoca(password);
	}
	
	@Override
	public HashMap<String,String> adverShow() {//db 로부터 광고 데이터를 가져와서 어떤식으로 광고를 뿌릴지 정의해준다.
		
		
		Random rnd = new Random();
		List<AdverDTO> dtoList = dao.getAdvertiseInfo();
		
		//금액에 맞춰서 내보내야 하지만 -> 이건 후에 지금은 "랜덤"으로 처리해준다.
		AdverDTO dto = dtoList.get(rnd.nextInt(dtoList.size()));
		String picName = dto.getAdpPcUrl();
		String url = dto.getAdUrl();
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("picName", picName);
		map.put("url", url);
		
		return map;
	}
	
	@Override
	public int loginResult(String userIp,String id, String pw) {//로그인 결과
		
		return dao.loginResult(userIp,id, pw);
	}

	@Override
	public HttpServletRequest AutoLoginBanned(HttpServletRequest request) {//과거로그인 기록을 조회하여 마지막 로그인기록 아이피와 다른경우 자동로그인 방지 페이지로 이동한다.
		
		HttpSession userSession = request.getSession();//유저의 세션객체를 만들어준다.
		int sucessCount = 0;//사용자가 몇번 정답을 맞췄는지 알려줄것이다.
		userSession.setAttribute("sucessCount", sucessCount);//세션객체에 대입
		
		AutoLoginPic autoLogin = new AutoLoginPic();
		String[] picNameKorEng = autoLogin.picName();//어떤 사진을 줄건지 생각을 해야한다.
		List<String> picList = autoLogin.firstCall(9,picNameKorEng[1]);//처음으로 가져와서 넘겨줄 사진
		
		
		userSession.setAttribute("selectPicName", picNameKorEng[1]);//사진이름 넘긴다. -> 영어이름 넘길것이다.
		
		request.setAttribute("picList", picList);
		request.setAttribute("picName", picNameKorEng[0]);//한글이름만 넘겨준다. -> 애는 requst 객체로 그림 한글이름만 넘겨준다.
		
		
		return request;
	}
	
	@Override
	public JSONObject picCheck(HttpServletRequest request) {
		
		HttpSession userSession = request.getSession();
		int sucessCount = (Integer) userSession.getAttribute("sucessCount");
		
		String selectPicName = (String)userSession.getAttribute("selectPicName");//정답 그림이름 -> 영어이름
	
		
		String throwPicName = request.getParameter("picName");//ajax 를 통해서 넘어온 그림의 이름 
		String clickNum = request.getParameter("clickNum");//ajax 를 통해서 넘어온 태그 id명
		
		
		if (selectPicName.equals("airplane")) {
			if (throwPicName.contains("airplane")) sucessCount++; 
		} else if (selectPicName.equals("apartment")) {
			if (throwPicName.contains("apartment")) sucessCount++; 
		} else if (selectPicName.equals("car")) {
			if (throwPicName.contains("car")) sucessCount++;
		} else if (selectPicName.equals("cat")) {
			if (throwPicName.contains("cat")) sucessCount++; 
		} else if (selectPicName.equals("dog")) {
			if (throwPicName.contains("dog")) sucessCount++; 
		} else if (selectPicName.equals("laptop")) {
			if (throwPicName.contains("laptop")) sucessCount++; 
		} else if (selectPicName.equals("phone")) {
			if (throwPicName.contains("phone")) sucessCount++; 
		} else if (selectPicName.equals("sea")) {
			if (throwPicName.contains("sea")) sucessCount++; 
		}
			
		userSession.setAttribute("sucessCount", sucessCount);//카운트를 넣어주기
		
		JSONObject obj = new JSONObject();
		AutoLoginPic al = new AutoLoginPic();
		String selectPic = al.imgMakers();//두번째로 불러올 이미지
		
		Map<Integer,String[]> map = al.picAnother(clickNum,selectPicName);
		obj.put("ansImg_1",map.get(0)[0]);
		obj.put("ansImg_1_value",map.get(0)[1]);
		obj.put("ansImg_2",map.get(1)[0]);
		obj.put("ansImg_2_value",map.get(1)[1]);
		obj.put("ansImg_3",map.get(2)[0]);
		obj.put("ansImg_3_value",map.get(2)[1]);

		
		
		obj.put("clickNum", clickNum);//클릭한 태그명
		obj.put("selectPic", selectPic);//클릭한 태그명에 새로운 사진 업데이트
		obj.put("sucessCount",sucessCount);
		
		return obj;
	}	
	
	

}


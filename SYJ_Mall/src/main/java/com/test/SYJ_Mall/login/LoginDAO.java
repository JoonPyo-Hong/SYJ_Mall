package com.test.SYJ_Mall.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.common.utill.AdverDTO;
import com.test.SYJ_Mall.popularItem.UserProductDTO;

@Repository
public class LoginDAO implements ILoginDAO {
	
	
	@Autowired
	private SqlSessionTemplate template;
	
	//로그인 결과
	public List<LoginDTO> loginResult(String userIp,String id,String encpw) {
			
		Map<String, String> loginCheckMap = new HashMap<String, String>();
			
		loginCheckMap.put("userIp", userIp);
		loginCheckMap.put("id", id);
		loginCheckMap.put("encpw", encpw);
			
		List<LoginDTO> resultList = new ArrayList<LoginDTO>();
		resultList = template.selectList("SYJDB.loginVerification", loginCheckMap);
		
		return resultList;
	}
	
	
	//광고 넣기
	public List<AdverDTO> getAdvertiseInfo() {
		
		List<AdverDTO> dtoList = new ArrayList<AdverDTO>();//광고로 지정되어 있는 모든 리스트를 가져와주는 작업을 수행한다
		
		dtoList = template.selectList("SYJDB.advertiseShow");
		
		return dtoList;
	}

	
	//해당번호 유저 정보 가져오기
	public List<UserDTO> userInfo(int userSeq) {
		
		List<UserDTO> dtoList = new ArrayList<UserDTO>();
		
		dtoList = template.selectList("SYJDB.userInfoDetail",userSeq);
		
		return dtoList;
	}

	
	//자동로그인 방지 인증 후 고객의 로그인정보 저장
	@Override
	public void autoLoginPassTrace(int userSeq,String ipaddress) {
		

		Map<String,String> userMap = new HashMap<String, String>();
		userMap.put("userSeq", ""+userSeq);
		userMap.put("ipaddress", ipaddress);
		
		template.update("SYJDB.autoAfterTrace",userMap);
		
	}

	
	//회원이 기입한 정보를 토대로 insert 작업 진행
	@Override
	public int signUp(SignUpDTO dto) {
		
		template.selectOne("SYJDB.qooSignUpsp", dto);
		
		return 0;
	}

	
	//회원이 회원으로 쓸 아이디에 대한 검증과정
	@Override
	public int signUpIdVerifyCheck(String inputId) {

		return template.selectOne("SYJDB.userSignUpIdCheck",inputId);
		
	}

	//회원이 사용할 이메일 아이디 검증과정
	@Override
	public int emailVerifyCheck(String fullEmail) {
		
		return template.selectOne("SYJDB.userEmailIdCheck",fullEmail);
	}

	//에러요인 디비에 넣어주기
	@Override
	public void errorIntoDb(String errormsg, String ip) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("errormsg", errormsg);
		map.put("ip", ip);
		
		template.insert("SYJDB.errorMsgInput", map);
		
	}

	//고객 아이디 찾아주기
	@Override
	public String findUserId(String email, String phone) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("phone", phone);
		
		return template.selectOne("SYJDB.findUserId",map);
	}

	//비밀번호 찾기전 해당 아이디 존재하는지 확인해주는 작업
	@Override
	public int findUserPwExist(String userId, String userEmail, String userPhone) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userEmail", userEmail);
		map.put("userPhone", userPhone);
		
		return template.selectOne("SYJDB.findUserPwExist",map);
	}
	
	
	//유저의 비밀번호를 임시비밀번호로 변경해준다.
	@Override
	public int modifyUserPw(String userId, String userEmail, String userPhone, String encInstPw) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userEmail", userEmail);
		map.put("userPhone", userPhone);
		map.put("encInstPw", encInstPw);
		
		return template.selectOne("SYJDB.modifyUserPw",map);
	}

	//회원가입 - 고객이 입력한 핸드폰번호가 중복되는지 체크
	@Override
	public int phoneVerifyCheck(String userPhoneNum) {
		
		return template.selectOne("SYJDB.userPhoneNumCheck",userPhoneNum);
	}

	//고객의 새로운 비밀번호 지정
	@Override
	public int modifyUserPwReal(int userSeq, String userPw, String userId, String userIp) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userSeq", ""+userSeq);
		map.put("userPw", userPw);
		map.put("userId", userId);
		map.put("userIp", userIp);
		
		return template.selectOne("SYJDB.modifyUserPwReturn",map);
		
	}

	//프론트단 로그인 처리
	@Override
	public int firstLoginCheck(String ip, String id, String pw) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("userId", id);
		map.put("userPw", pw);
		map.put("userIp", ip);
		
		
		return template.selectOne("SYJDB.firstLoginCheck",map);
	}

	
	//고객의 새로운 비밀번호 지정
	@Override
	public int modifyUserPwRealNew(int userSeq, String userPw) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userSeq", ""+userSeq);
		map.put("userPw", userPw);
		
		
		return template.selectOne("SYJDB.modifyUserPwReturnNew",map);
	}

	//새로추가해야할 상품번호 리스트 반환
	@Override
	public List<UserProductDTO> getCookieProductId(int userSeq) {
		
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("userSeq",userSeq);
		
		return template.selectList("SYJDB.getCookieProductId", map);
	}

	
	@Override
	public int setCookieToDbBasketListNondeleted(int userSeq, String newBasketList) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("userSeq",Integer.toString(userSeq));
		map.put("productId",newBasketList);
		
		
		return template.selectOne("SYJDB.setCookieToDbBasketListNondeleted", map);
	}

	
	@Override
	public int setCookieToDbBasketListDeleted(int userSeq, String newBasketList) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("userSeq",Integer.toString(userSeq));
		map.put("productId",newBasketList);
		
		return template.selectOne("SYJDB.setCookieToDbBasketListDeleted", map);
	}

	
	@Override
	public int saveRsaPrivateKey(int userSeq, String saveRsaPrivateKey) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("userSeq",Integer.toString(userSeq));
		map.put("saveRsaPrivateKey",saveRsaPrivateKey);
		
		return template.selectOne("SYJDB.intoDBUserRsa", map);
	}


	@Override
	public String getUserSecureKey(int loginSaveUserSeq) {
		
		return template.selectOne("SYJDB.getDBUserRsa", loginSaveUserSeq);
	}

	
	//qr 관련 정보 테이블에 넣어주기
	@Override
	public int insertQrCheck(String uuid) {
		
		return  template.selectOne("SYJDB.setQrUrl", uuid);
	}

	//QR 관련 로직 - 모바일 기기에서 아이디 체킹
	@Override
	public int checkingQrUserInfo(String qruuid, String decodeQrSeqCode) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("qruuid",qruuid);
		map.put("decodeQrSeqCode",decodeQrSeqCode);
		
		return template.selectOne("SYJDB.qrMobileIngoChecking", map);
	}
	
	
}


package com.test.SYJ_Mall.kafkaoLogin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KakaoLoginService implements IKakaoLoginService {
	@Autowired
	private IKakaoLoginDAO dao;
}

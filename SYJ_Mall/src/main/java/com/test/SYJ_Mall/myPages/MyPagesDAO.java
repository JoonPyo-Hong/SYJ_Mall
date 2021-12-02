package com.test.SYJ_Mall.myPages;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPagesDAO implements IMyPagesDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	//마이페이지 - 최근본 상품 객체들 가져오기
	@Override
	public List<MyPageSeenDTO> getMyPageSeenList(String seenList) {
		
		return template.selectList("MyPages.myPageSeenDatas",seenList);
	}
	
}

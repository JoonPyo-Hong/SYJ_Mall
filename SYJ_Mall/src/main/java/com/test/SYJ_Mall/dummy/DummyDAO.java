package com.test.SYJ_Mall.dummy;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * DummyDAO 객체
 * @author shin
 *
 */
@Repository
public class DummyDAO implements IDummyDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int generateDummy(DummyDTO dto) {
		
		return template.selectOne("Dummy.generateDummy",dto);
	}
	
	
	//유저명수 알아오기
	@Override
	public int getuserCount() {
		
		return template.selectOne("Dummy.getUserCount");
	}

	//상품 갯수 알아오기
	@Override
	public int getProductCount() {
		
		return template.selectOne("Dummy.getProductCount");
	}
	

	@Override
	public int putBuyDummy(DummyProductDTO dpdto) {
		
		return template.selectOne("Dummy.setProductBuyInfo",dpdto);
	}


	
	
	
	
}

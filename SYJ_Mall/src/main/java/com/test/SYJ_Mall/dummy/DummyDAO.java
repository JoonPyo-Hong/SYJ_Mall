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
		
		System.out.println(dto.getCategory());
		System.out.println(dto.getProdName());
		System.out.println(dto.getProdCount());
		System.out.println(dto.getProdPrice());
		System.out.println(dto.getProdDiscounts());
		System.out.println(dto.getProdRepYns());
		System.out.println(dto.getProdCharFirsts());
		System.out.println(dto.getProdCharSeconds());
		System.out.println(dto.getProdRepImgs());
		System.out.println(dto.getProdHeads());
		
		

		
		return template.selectOne("Dummy.generateDummy",dto);
	}
	
	
	
	
}

package com.test.SYJ_Mall.charProdt;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/**
 * 
 * @author shin
 *
 */
@Repository
public class CharProdtDAO implements ICharProdtDAO{
	@Autowired
	private SqlSessionTemplate template;
	
	//캐릭터 url 가져오기
	@Override
	public String getCharPicUrl(String charSeq) {
		
		return template.selectOne("prodtCharSort.prodtCharSortImg",Integer.parseInt(charSeq));
	}
	
	
}

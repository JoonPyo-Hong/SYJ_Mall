package com.test.SYJ_Mall.charProdt;

import java.util.List;

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
	
	//캐릭터 상단 객체 가져오기
	@Override
	public List<CharHeadTitleDTO> getCharHeadData(String charSeq) {

		return template.selectList("prodtCharSort.prodtCharSortImg",Integer.parseInt(charSeq));
	}
	

	
	
}

package com.test.SYJ_Mall.charProdt;

import java.util.HashMap;
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
	
	//캐릭터 해당 세부상품 가져와주기
	@Override
	public List<CharProdtDTO> getCharProdts(String charSeq, String sortedOption, int paging, String basketList) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("charSeq", charSeq);
		map.put("sortedOption", sortedOption);
		map.put("paging", Integer.toString(paging));
		map.put("basketList", basketList);
		
		return template.selectList("prodtCharSort.prodtsChars",map);
	}
	

	
	
	
}

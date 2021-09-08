package com.test.SYJ_Mall.search;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAO implements ISearchDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//검색한 단어 포함한 품목정보 가져오기
	@Override
	public List<SearchNameDTO> getProdInfo(String inputWord) {
		
		return template.selectList("SYJSearch.searchLittleProd",inputWord);
	}
	

}

package com.test.SYJ_Mall.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//검색조건에 맞는 상품정보를 가져와준다
	@Override
	public List<SearchProductDTO> getSearchResultProds(String inputName, String productSeq,int pagingCount) {
		
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("inputName",inputName);
		map.put("productSeq",productSeq);
		map.put("pagingCount",Integer.toString(pagingCount));
		
		return template.selectList("SYJSearch.searchProdDetil",map);
	}
	
	//검색정보에 맞는 총 상품의 갯수를 가져와준다.
	@Override
	public int getSearchResultProdsCount(String inputName, String productSeq) {
		
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("inputName",inputName);
		map.put("productSeq",productSeq);
		
	
		return template.selectOne("SYJSearch.searchProdCount",map);
	}
	
	
	

}

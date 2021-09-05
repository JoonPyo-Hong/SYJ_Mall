package com.test.SYJ_Mall.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchService implements ISearchService {

	@Autowired
	ISearchDAO dao;
	
	//단어를 포함하는 상품정보 가져와주기
	@Override
	public List<SearchNameDTO> getProdLittelInfo(String inputWord) {
		
		List<SearchNameDTO> dtoList = dao.getProdInfo(inputWord);
		
		
		return dtoList;
	}
}

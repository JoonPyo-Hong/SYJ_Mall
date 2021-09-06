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
		
		//상품에 해당하는 단어를 span 태그로 묶어서 빨간색으로 표시해줄것
		for (SearchNameDTO dto : dtoList) {
			//StringBuffer sb = new StringBuffer();
			String name = dto.getProductName();
			String repName = name.replaceAll(inputWord, "<span style='color: red;'>"+inputWord+"</span>");
			
			dto.setProductName(repName);
		}
		
		
		return dtoList;
	}
}

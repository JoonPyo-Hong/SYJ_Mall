package com.test.SYJ_Mall.newProduct;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NewProductDAO implements INewProductDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	//추천 신규 테마 가져오기
	@Override
	public List<RecommendThemeDTO> getNewRecommendThemeNoLogin(HttpServletRequest request, String basketList,int themeNum) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("basketList",basketList);
		map.put("themeNum",Integer.toString(themeNum));//추천물품 번호
		
		System.out.println(basketList);
		System.out.println(themeNum);
		
		return template.selectList("newProducts.newProductRecommendTheme",map);
	}
	
	
}

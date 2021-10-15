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
	
	//추천 신규 테마 가져오기-로그인 되지 않은 경우
	@Override
	public List<RecommendThemeDTO> getNewRecommendThemeNoLogin(String basketList,int themeNum) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("basketList",basketList);
		map.put("themeNum",Integer.toString(themeNum));//추천물품 번호
		
		return template.selectList("newProducts.newProductRecommendTheme",map);
	}
	
	
	//추천 신규 테마 가져오기-로그인 된 경우
	@Override
	public List<RecommendThemeDTO> getNewRecommendTheme(int userSeq, int themeNum) {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("userSeq",userSeq);
		map.put("themeNum",themeNum);//추천물품 번호
		
		return template.selectList("newProducts.newProductRecommendThemeLogin",map);
	}

	
	//최상단 신규물품 리스트 가져오기
	@Override
	public List<RecommendTopProdDTO> getRecommendTopProdDTOList() {
		
		return template.selectList("newProducts.newProductRecommendTop");
	}

	//새로나온 친구 물품 갯수
	@Override
	public int getNewFriendsCount() {
		
		return template.selectOne("newProducts.newFriendsProductCount");
	}

	//새로나온 친구들 물품 - 로그인 하지 않은 경우
	@Override
	public List<NewFriendsProdDTO> getNewFriendDtosNologin(String basketList, int paging) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("basketList",basketList);
		map.put("paging",Integer.toString(paging));
		
		return template.selectList("newProducts.newFriendsProductNotLogin",map);
	}

	//새로나온 친구들 물품 - 로그인 한 경우
	@Override
	public List<NewFriendsProdDTO> getNewFriendDtos(int userSeq, int paging) {
		
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("userSeq", userSeq);
		map.put("userSeq", paging);
		
		return template.selectList("newProducts.newFriendsProduct",map);
	}



	
	
}

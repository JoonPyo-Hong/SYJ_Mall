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
		map.put("paging", paging);
		
		return template.selectList("newProducts.newFriendsProduct",map);
	}

	//추천 신규 테마 더보기 - 로그인 안한 경우
	@Override
	public List<RecommendThemeDTO> getNewRecommendThemeNoLoginAdd(String basketList, int themeNum,int sortedOption) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("basketList",basketList);
		map.put("themeNum",Integer.toString(themeNum));
		map.put("sortedOption",Integer.toString(sortedOption));
		
		
		return template.selectList("newProducts.newProductRecommendThemeAdd",map);
	}
	
	//추천 신규 테마 더보기 - 로그인 안한 경우 - 소분류 필터링
	@Override
	public List<RecommendThemeDTO> getNewRecommendThemeNoLoginAdddetail(String basketList,int sortedOption, int prodtCatgr) {
			
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("basketList",basketList);
		map.put("sortedOption",Integer.toString(sortedOption));
		map.put("prodtCatgr",Integer.toString(prodtCatgr));
			
		return template.selectList("newProducts.newProductRecommendThemeAdd",map);
	}


	//추천 신규 테마 더보기 - 로그인 한 경우
	@Override
	public List<RecommendThemeDTO> getNewRecommendThemeAdd(int userSeq, int themeNum, int sortedOption, int sortedCharOption) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("userSeq",Integer.toString(userSeq));
		map.put("themeNum",Integer.toString(themeNum));
		map.put("sortedOption",Integer.toString(sortedOption));
		map.put("sortedCharOption",Integer.toString(sortedCharOption));
		
		return template.selectList("newProducts.newProductRecommendThemeLoginAdd",map);
	}

	//추천신규테마 - 소분류 목록 가져오기
	@Override
	public List<SmallCategoryDTO> getNewRecommendProdtCategory(int themeNum) {
		
		return template.selectList("newProducts.newProductRecommendProdtCategory",themeNum);
	}

	
	//대분류가 존재하지 않는 상품의 갯수  - 총 갯수라고 생각하면 된다.
	@Override
	public int getNoBigCategoryCount() {
		
		return template.selectOne("newProducts.getNoBigCategoryCount");
	}

	//대분류가 존재하지 않고 소분류도 존재하지 않는 상품
	@Override
	public List<RecommendThemeDTO> getNoBigCategoryNoSmallCategory(String basketList, int sortedOption, int paging) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("basketList",basketList);
		map.put("sortedOption",Integer.toString(sortedOption));
		map.put("paging",Integer.toString(paging));
		
		return template.selectList("newProducts.getNoBigCategoryNoSmallCategory",map);
	}

	
	//소분류가 존재하는 상품의 갯수
	@Override
	public int getSmallCategoryCountFilter(int prodtCatgr) {
		
		return template.selectOne("newProducts.getNoBigCategoryCountFilter",prodtCatgr);
	}

	//대분류가 존재하지 않고 소분류만 존재하는 상품
	@Override
	public List<RecommendThemeDTO> getNoBigCategoryExistSmallCattegory(String basketList, int prodtCatgr,int sortedOption, int paging) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("basketList",basketList);
		map.put("prodtCatgr",Integer.toString(prodtCatgr));
		map.put("sortedOption",Integer.toString(sortedOption));
		map.put("paging",Integer.toString(paging));
		
		return template.selectList("newProducts.getNoBigCategoryExistSmallCattegory",map);
	}

	
	// 대분류 이름
	@Override
	public List<BigCategoryInfoDTO> getBigCategoryNm(int themeNum) {
		return template.selectList("newProducts.getBigCategoryNm",themeNum);
	}

	//대분류는 존재하지만 소분류는 존재하지 않는 상품의 총 갯수
	@Override
	public int getBigCategoryCount(int themeNum) {
		
		return template.selectOne("newProducts.getBigCategoryCountFilter",themeNum);
	}

	//대분류가 존재하고 소분류가 존재하지 않는 상품
	@Override
	public List<RecommendThemeDTO> getBigCategoryNoSmallCategory(String basketList, int themeNum, int sortedOption, int paging) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("basketList",basketList);
		map.put("themeNum",Integer.toString(themeNum));
		map.put("sortedOption",Integer.toString(sortedOption));
		map.put("paging",Integer.toString(paging));
		
		
		return template.selectList("newProducts.getBigCategoryNoSmallCategory",map);
	}


	
	

	
	
}

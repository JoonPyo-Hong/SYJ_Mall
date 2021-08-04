package com.test.SYJ_Mall.newGoods;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * NewGoodDAO 객체
 * @author shin
 *
 */
@Repository
public class NewGoodDAO implements INewGoodDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	//신규 목록 가장 위에있는 배너 어떤 상품과 그에관련된 어떤 사진을 가져올것인지 정해준다.
	@Override
	public List<PdtBannerDTO> bringNewTopImg() {
		
		List<PdtBannerDTO> dtoList = new ArrayList<PdtBannerDTO>();
		dtoList = template.selectList("newGoods.newProductBannerImg");
		
		return dtoList;
	}
	
	//캐릭터 이름 가져오기
	@Override
	public String bringCharName(int charNum) {
		
		return template.selectOne("newGoods.bringcharName",charNum);
	}
	
	//신규목록 - 추천신규테마
	@Override
	public List<PdtRecommedDTO> bringNewRecommendInfo(int userSeq, int charNum) {
		
		List<PdtRecommedDTO> pdtoList = new ArrayList<PdtRecommedDTO>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userSeq", userSeq);
		map.put("charNum", charNum);
		
		pdtoList = template.selectList("newGoods.newProductRecommentInfo",map);
		
		//System.out.println(pdtoList.get(0).getProduct_nm());
		
		return pdtoList;
	}


	
}

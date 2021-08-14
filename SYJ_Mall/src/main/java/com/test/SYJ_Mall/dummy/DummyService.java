package com.test.SYJ_Mall.dummy;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.utill.CommonDate;

/**
 * DummyService 객체
 * @author shin
 *
 */
@Service
public class DummyService implements IDummyService{
	
	@Autowired
	private IDummyDAO dao;
	
	
	@Override
	public int putInfo(List<Integer> categories, List<String> names, List<Integer> counts, List<Integer> prices,
			List<Integer> discounts, List<String> rep_yns, List<Integer> char_firsts, List<Integer> char_seconds,
			List<String> rep_imgs, List<String> heads1, List<String> heads2, List<String> heads3, List<String> heads4) {
		
		try {
			
			int size = categories.size();
			
			for (int i = 0; i < size; i++) {
				
				StringBuffer sb = new StringBuffer();
				String[] headList = {heads1.get(i),heads2.get(i),heads3.get(i),heads4.get(i)};//헤드이미지 셋트
				
				int headCount = 0;
				sb.append("");
				
				for (String heads : headList) {
					
					if (heads.equals("none")) break;
					
					sb.append(heads);
					sb.append("#");	
					headCount++;
				}
				
				if (headCount > 0) {
					sb.delete(sb.length()-1, sb.length());
				}
				String prodHeads = sb.toString();//헤드이미지 묶음
				
				DummyDTO dto = new DummyDTO(categories.get(i), names.get(i), counts.get(i), prices.get(i), discounts.get(i), 
						rep_yns.get(i), char_firsts.get(i), char_seconds.get(i), rep_imgs.get(i), prodHeads);
				
				
				int result = dao.generateDummy(dto);

				
//				System.out.println("============================");
//				System.out.println("categories : " + categories.get(i));
//				System.out.println("names : " + names.get(i));
//				System.out.println("counts : " + counts.get(i));
//				System.out.println("prices : " + prices.get(i));
//				System.out.println("discounts : " + discounts.get(i));
//				System.out.println("rep_yns : " + rep_yns.get(i));
//				System.out.println("char_firsts : " + char_firsts.get(i));
//				System.out.println("char_seconds : " + char_seconds.get(i));
//				System.out.println("rep_imgs : " + rep_imgs.get(i));
//				System.out.println("heads : " + prodHeads);
			}
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	//구매 더미데이터 넣어주기
	@Override
	public int putBuyInfo() {
		
		try {
			
			int userCount = dao.getuserCount();//회원명수
			int productCount = dao.getProductCount();//제품갯수
			
			Random rnd = new Random();
			CommonDate c = new CommonDate();
			
			for (int i = 0; i < 10000000; i++) {
				
				int productId = rnd.nextInt(productCount) + 1;
				int qoouserSeq = rnd.nextInt(userCount) + 1;
				int starScore = rnd.nextInt(6);
				int productBuyCount = rnd.nextInt(30) + 1;
				String productBuyDt = c.dateCreateDummy();
				
//				확인용 주석 지우기 X
//				System.out.println("==================================");
//				System.out.println("productId : " + productId);
//				System.out.println("qoouserSeq : " + qoouserSeq);
//				System.out.println("starScore : " + starScore);
//				System.out.println("productBuyCount : " + productBuyCount);
//				System.out.println("productBuyDt : " + productBuyDt);
				
				DummyProductDTO dpdto = new DummyProductDTO(productId,qoouserSeq,starScore,productBuyCount,productBuyDt);
				
				int result = dao.putBuyDummy(dpdto);
				
				if (result == -1) break;
			}
			
			return 1;
			
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	
	

	
}

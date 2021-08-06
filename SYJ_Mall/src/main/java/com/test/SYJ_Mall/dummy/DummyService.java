package com.test.SYJ_Mall.dummy;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
				
				//int category = categories.get(i);//소분류 코드
				//String prodName = names.get(i);//상품 이름
				//int prodCount = counts.get(i);//상품 갯수
				//int prodPrice = prices.get(i);//상품가격
				//int prodDiscounts = discounts.get(i);//할인율
				//String prodRepYns = rep_yns.get(i);//추천상품 여부
				//int prodCharFirsts = char_firsts.get(i);//연관 캐릭터번호1
				//int prodCharSeconds = char_seconds.get(i);//연관 캐릭터번호2
				//String prodRepImgs = rep_imgs.get(i);//대표이미지
				
				StringBuffer sb = new StringBuffer();
				String[] headList = {heads1.get(i),heads2.get(i),heads3.get(i),heads4.get(i)};
				
				int headCount = 0;
				sb.append("");
				
				for (String heads : headList) {
					
					if (heads.equals("none")) break;
					sb.append(heads);
					headCount++;
					sb.append("#");	
				}
				
				if (headCount > 0) {
					sb.delete(sb.length()-1, sb.length());
				}
				String prodHeads = sb.toString();//헤드이미지 묶음
				
				DummyDTO dto = new DummyDTO(categories.get(i), names.get(i), counts.get(i), prices.get(i), discounts.get(i), 
						rep_yns.get(i), char_firsts.get(i), char_seconds.get(i), rep_imgs.get(i), prodHeads);
				
				
				int result = dao.generateDummy(dto);

				
//				System.out.println("============================");
//				System.out.println("categories : " + category);
//				System.out.println("names : " + prodName);
//				System.out.println("counts : " + prodCount);
//				System.out.println("prices : " + prodPrice);
//				System.out.println("discounts : " + prodDiscounts);
//				System.out.println("rep_yns : " + prodRepYns);
//				System.out.println("char_firsts : " + prodCharFirsts);
//				System.out.println("char_seconds : " + prodCharSeconds);
//				System.out.println("rep_imgs : " + prodRepImgs);
//				System.out.println("heads : " + prodHeads);
			}
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
		
	}
	
	
	

	
}

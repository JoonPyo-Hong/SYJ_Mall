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
				
				DummyDTO dto = new DummyDTO(categories.get(i), names.get(i), counts.get(i), prices.get(i), 
						discounts.get(i), rep_yns.get(i), char_firsts.get(i), char_seconds.get(i), rep_imgs.get(i), 
						heads1.get(i), heads2.get(i), heads3.get(i), heads4.get(i));
				
				
				
				
				
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
//				System.out.println("heads1 : " + heads1.get(i));
//				System.out.println("heads2 : " + heads2.get(i));
//				System.out.println("heads3 : " + heads3.get(i));
//				System.out.println("heads4 : " + heads4.get(i));
			}
			
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		
		
		
	}
	
	
	

	
}

package com.test.SYJ_Mall;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JpaController {
	
	@RequestMapping(value = "/jpaTest.action", method = { RequestMethod.GET })
	public String jpaTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("sqlserver");
		
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction tx = em.getTransaction();
		
		tx.begin();
		
		
		try {
			
			MEMBER member = new MEMBER();
			member.setId(1L);
			member.setName("test");
			
			em.persist(member);
			
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			em.close();
		}
		
		return "";	
	}
}

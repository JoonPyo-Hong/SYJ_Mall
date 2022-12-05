package com.test.SYJ_Mall;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class JpaMain {
	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("sqlserver");
		
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction tx = em.getTransaction();
		
		tx.begin();
		
		
		try {
			
			MEMBER member = new MEMBER();
			member.setId(1L);
			member.setName("test");
			
			em.persist(member);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			em.close();
		}
	}
}

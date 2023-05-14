package com.test.SYJ_Mall.sqlServerJpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.stereotype.Service;

@Service
public class SqlServerService implements ISqlServerService {

	@Override
	public List<String> getSearchData(String keyword) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("sqlserver");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();
		
		List<String> resultList = new ArrayList<>();
		
		tx.begin();
		
		try {
			
			String queryString = "SELECT e.dispNm FROM MongoDwDTO e WHERE e.dispNm LIKE :keyword";
			
			resultList = em.createQuery(queryString, String.class)
			        .setParameter("keyword", "%" + keyword + "%")
			        .getResultList();
			
			tx.commit();
			
			
		} catch (Exception e) {			
			e.printStackTrace();
			tx.rollback();
		} finally {
			em.close();
		}
		
		emf.close();
		
		return resultList;
		
	}

}

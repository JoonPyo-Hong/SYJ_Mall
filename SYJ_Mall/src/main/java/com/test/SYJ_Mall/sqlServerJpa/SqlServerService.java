package com.test.SYJ_Mall.sqlServerJpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Service;

import com.test.SYJ_Mall.elasticsearchDw.SqlUser;

@Service
public class SqlServerService implements ISqlServerService {

	@Override
	public int getUserCount(String tableName) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("sqlserver");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();
		
		int result = -1;
		
		
		try {
		
			String queryString = String.format("SELECT COUNT(*) from dbo.%s with(nolock)", tableName);
			
			Query query = em.createNativeQuery(queryString);
			
			result = (int) query.getSingleResult();
			
			
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			em.close();
		}
		
		emf.close();
		
		return result;
	}

	@Override
	public List<SqlUser> getSqlUserData(int startIndex, int batchPerSize) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("sqlserver");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();
		
		List<SqlUser> userList = new ArrayList<>();
		
		
		try {
			
			String queryString = String.format("SELECT user_seq, user_id, user_birthday, user_gender FROM dbo.ELASTIC_USER with(nolock) WHERE user_seq BETWEEN %d AND %d", startIndex, batchPerSize);
			
			Query query = em.createNativeQuery(queryString, SqlUser.class);
			
			userList = query.getResultList();
			
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			em.close();
		}
		
		emf.close();
		
		return userList;
	}

}

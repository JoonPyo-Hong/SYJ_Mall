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
import com.test.SYJ_Mall.mongodb.MongoDwDTO;

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
			
			//String queryString = String.format("SELECT brand_no, benefit_price, link_info, disp_nm FROM dbo.MONGO_ELASTIC with(nolock) WHERE class_id BETWEEN %d AND %d", startIndex, batchPerSize);
			
			Query query = em.createNativeQuery(queryString, MongoDwDTO.class);
			
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


	@Override
	public void insertData(List<MongoDwDTO> mongoDto) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("sqlserver");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();
		
		try {
			
			for (MongoDwDTO dto : mongoDto) {
				em.persist(dto);
			}
			
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			em.close();
		}
		
		emf.close();
		
	}


	@Override
	public List<MongoDwDTO> getMongoUserData(int startIndex, int batchPerSize) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("sqlserver");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();
		
		List<MongoDwDTO> userList = new ArrayList<>();
		
		
		try {
			
			String queryString = String.format("SELECT class_id, brand_no, benefit_price, link_info, disp_nm FROM dbo.MONGO_ELASTIC with(nolock) WHERE class_id BETWEEN %d AND %d", startIndex, batchPerSize);
			
			Query query = em.createNativeQuery(queryString, MongoDwDTO.class);
			
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

	
	
	@Override
	public List<String> getSearchData(String keyword) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("sqlserver");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();
		
		//List<MongoDwDTO> resultList = new ArrayList<>();
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

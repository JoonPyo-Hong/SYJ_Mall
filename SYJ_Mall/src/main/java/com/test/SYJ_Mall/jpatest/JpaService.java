package com.test.SYJ_Mall.jpatest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.StatelessSession;


@Service
public class JpaService implements IJpaService {

	@Override
	public void jpaTest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {

			Member member = new Member();
			member.setId(1);
			member.setName("wowo rian");

			// insert
			em.persist(member);

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
	public void jpaFind(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {

			Member findMember = em.find(Member.class, 1);

			System.out.println("findMember = " + findMember.getId());
			System.out.println("findMember = " + findMember.getName());

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
	public void jpaFindDelete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {

			Member findMember = em.find(Member.class, 1);

			System.out.println("findMember = " + findMember.getId());
			System.out.println("findMember = " + findMember.getName());

			em.remove(findMember);

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
	public void jpaUpdate(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {

			Member findMember = em.find(Member.class, 1);

			findMember.setName("what the fu");
			
			// 저장 없이도 변경이 된다.
			
			
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
	public void jpaSelect(HttpServletRequest request, HttpServletResponse response) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			/*
			 * JPQL
			 * 
			 * - JPA 를 사용하면 엔티티 중심으로 개발해야한다.
			 * - 문제가 되는 것은 검색 쿼리이다.
			 * - 검색을 할 때도 테이블이 아닌 엔티티 객체를 대상으로 검색한다.
			 * - 모든 DB 데이터를 객체로 변환해서 검색하는 것을 불가능하다.
			 * - 애플리케이션이 필요한 데이터만 DB 에서 불러오려면 결국 검색 조건이 포함된 SQL이 필요하다.
			 * 
			 * 결국 SQL 은데이터베이스 테이블을 대상으로 쿼리하는 것이고, JPQL 은 엔티티 객체를 대상으로 쿼리하는 것이다.
			 * 
			 * */
			
			// 쿼리와 비슷하게 만들수 있지만 약간 다른 문법을 지원한다.
			// 대상이 테이블이 아니라 객체가 된다.
			// 현재 db 에는 Member 테이블이 아니고 USER 테이블로 정의되어 있는데, 아래 쿼리에서 USER 로 써주지 않아도 된다는 뜻이 된다.
			//List<Member> result = em.createQuery("select m from Member as m",Member.class).getResultList();
			
			
			// 아래와 같이 몇개의 데이터를 가져올지 지정해줄 수 도 있다.
			// pagenation 과 비슷한 개념이라고 생각하면 된다.
			// 아래와 같이 쓰게 되면 2번째 데이터부터 4개를 가져오게 된다. (2번째는 0,1,.... 번째를 의미한다.)
			List<Member> result = em.createQuery("select m from Member as m",Member.class)
					.setFirstResult(2)
					.setMaxResults(4)
					.getResultList();
			
			
			
			
			for (Member mem : result) {
				System.out.println(mem.getId());
				System.out.println(mem.getName());
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
	public void permanencConcept(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			// 객체를 생성한 상태이지만 JPA 와 아무상관 없으므로 비영속 상태라고 볼 수 있다.
			Member member = new Member();
			member.setId(10);
			member.setName("Hello JPA");
			
			
			// -------- 비영속 상태
			
			// 객체를 저장한 상태 (영속) -- 영속상태가 시작된다.
			// 사실은 이구문이 시작되자마자 디비에 저장되는 것은 아니다.
			//System.out.println("========BEFORE===========");
			//em.persist(member);
			//em.detach(member);// 영속성 컨텍스트에서 분리하게 된다 => 준속상태가 된다.
			//System.out.println("========AFTER===========");
			
			
			// 언제 쿼리가 날라가느냐? -> 아래에서 commit하는 시점에 쿼리가 날라가게 된다.
			
			/*
			 
			  영속성 컨텍스트의 이점
			  - 1차 캐시
			  - 동일성 보장
			  - 트랜잭션을 지원하는 쓰기 지연
			  - 변경 감지
			  - 지연 로딩
			 
			*/
			
			
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
	public void permanenceAdvantage(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			// 객체를 생성한 상태이지만 JPA 와 아무상관 없으므로 비영속 상태라고 볼 수 있다.
			//Member member = new Member();
			//member.setId(10);
			//member.setName("Hello JPA");
			
			/*
			 
			  영속성 컨텍스트의 이점
			  - 1차 캐시
			  - 동일성 보장
			  - 트랜잭션을 지원하는 쓰기 지연
			  - 변경 감지
			  - 지연 로딩
			 
			*/
			
			// 1차 캐시에 저장됨
			//em.persist(member);
			
			// 1차 캐시에서 조회 -> 디비에서 먼저 가져오는 개념이 아님.
			// 아래와 같이 같은 객체를 두번가져오게 되면 SQL 쿼리를 두번 쏘지 않고 한번 쏘고 캐시에 저장한다.
			Member findMember1 = em.find(Member.class, 10);
			Member findMember2 = em.find(Member.class, 10);
			
			
			
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
	public void permanenceIdentity(HttpServletRequest request, HttpServletResponse response) {
		
		/*
		 
		 영속 엔티티의 동일성 보장
		 
		 
		 */
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			Member findMember1 = em.find(Member.class, 10);
			Member findMember2 = em.find(Member.class, 10);
			
			
			System.out.println(findMember1 == findMember2);// 같다고 나오게 된다.
			
			// JPA 가 영속엔티티에 동일성을 보장해줘서 같은 객체는 같다고 봐준다.
			// JAVA Collecton 에서 꺼내서 같은지 비교하는것과 같다고 보면 된다.
			// 1차 캐시로 반복 가능한 읽기 등급(REPEATABLE READ)의 트랜잭션 격리 수준을 데이터베이스가 아닌 애플리케이션 차원에서 제공한다.
			
			
			
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
	public void permanenceWrite(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			Member member1 = new Member(11,"hala1");
			Member member2 = new Member(12,"hala2");
			
			
			
			em.persist(member1);
			em.persist(member2);
			System.out.println("==============");
			// 위의 순간까지는 영속성 컨텍스트에 차곡차곡 쌓이게 된다. 그리고 sql 쿼리문도 각각일단 만들어주게 된다.
			// 쿼리를 만들때마다 날리면 최적화가 어렵다.
			// xml에서 배치사이즈를 조절해서도 비슷한 결과를 얻을 수 있다.
			// 오히려 옵션하나로 성능을 높일 수 있다.
			
			
			
			
			// 그러다가 commit 시점에서 데이터베이스에 쿼리가 날라가게 된다.
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
	public void permanenceUpdateCheck(HttpServletRequest request, HttpServletResponse response) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			Member member = em.find(Member.class, 10);
			
			member.setName("lalala");
			System.out.println("====================");
			
			// 위에서 딱히 update 구문을 날리지 않았는데도 자연스럽게 update 구문이 날라가서 데이터가 갱신된다.
			// 더티체킹 => 변경감지 기능을 지원한다.
			// 엔티티의 값을 바꾸려면 뭔가 업데이트 쳐줘야할것 같은데. 자바 컬렉션에서 바꾸는 것처럼 update 하지 않아도 갱신이 된다.
			
			
			// 아래의 쿼리도 딱히 delete 구문을 날려주지 않아도 삭제가 진행된다.
			//em.remove(member);
			
			
			
			
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
	public void flushTesting(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			Member member = new Member(21,"member123");
			
			em.persist(member);
			
			em.flush();// 강제적으로 쿼리를 날려준다.
			
			// 먼저 인서트 쿼리가 호출이 된다.
			// 쿼리가 바로 발사된다는 의미로 보면 된다. => 바로 디비에 반영이 된다.
			// flush 를 한다고 1차 캐시를 지우지는 않는다.
			System.out.println("==========================");
			
			
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
	public void flushJpql(HttpServletRequest request, HttpServletResponse response) {
		
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			Member member1 = new Member(1,"apple");
			Member member2 = new Member(2,"samsung");
			Member member3 = new Member(3,"hanhwa");
			
			em.persist(member1);
			em.persist(member2);
			em.persist(member3);
			
			// 원래는 여기서 flush 가 안되는게 맞지만 기본옵션에 의해서 먼저 flush 를 진행해준다.
			// flush 를 강제적으로적어주지도 않았고 아직 커밋에 도달하지도 않았는데 디비에 쿼리를 쏜것이다.
			
			
			List<Member> result = em.createQuery("select m from Member as m",Member.class).getResultList();
			
			
			for (Member mem : result) {
				System.out.println(mem.getId());
				System.out.println(mem.getName());
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
	public void detachTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			// 영속 상태
			Member member = em.find(Member.class, 1);
			member.setName("AAAA");
			
			// 준영속 상태로 전환 -> 영속성 컨텍스트에서 관리하지 말라고 꺼내버리는 행위가 된다.
			// 직접 쓸일은거의 없다.
			// 특정 데이터만 지워버린다.
			//em.detach(member);
			
			// 영속성 컨텍스트 내부를 통째로 다 지우는 행위이다.
			em.clear();
			
			// clear() 행위로 1차 캐시를 통으로 지워버리므로 캐싱하지 못하고 다시 db에 다녀오는 수고로움을 수반한다.
			Member member1 = em.find(Member.class, 1);
			
			
			System.out.println("====================");
			
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
	public void EntityTableTest(HttpServletRequest request, HttpServletResponse response) {
		
		
		//SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		
//		//Current Session - no need to close
//		Session currentSession = sessionFactory.getCurrentSession();
//		
//		//open new session
//		Session newSession = sessionFactory.openSession();
//		//perform db operations
//		
//		//close session
//		newSession.close();
//		
//		//open stateless session
//		StatelessSession statelessSession = sessionFactory.openStatelessSession();
//		//perform stateless db operations
//		
//		//close session
//		statelessSession.close();
//		
//		//close session factory
//		sessionFactory.close();
		
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			// 영속 상태
			//Member member = em.find(Member.class, 1);
			Member member = em.find(Member.class, 1);
			member.setName("AAAA");
			
			
			
			
			
			
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			em.close();
		}
		
		emf.close();
		
		
	}
	
	
	
	

}

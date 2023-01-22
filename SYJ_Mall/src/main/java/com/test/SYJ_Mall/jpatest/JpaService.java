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

			Members member = new Members();
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

			Members findMember = em.find(Members.class, 1);

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

			Members findMember = em.find(Members.class, 1);

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

			Members findMember = em.find(Members.class, 1);

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
			List<Members> result = em.createQuery("select m from Member as m",Members.class)
					.setFirstResult(2)
					.setMaxResults(4)
					.getResultList();
			
			
			
			
			for (Members mem : result) {
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
			Members member = new Members();
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
			Members findMember1 = em.find(Members.class, 10);
			Members findMember2 = em.find(Members.class, 10);
			
			
			
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
			
			Members findMember1 = em.find(Members.class, 10);
			Members findMember2 = em.find(Members.class, 10);
			
			
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
			
			Members member1 = new Members(11,"hala1");
			Members member2 = new Members(12,"hala2");
			
			
			
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
			
			Members member = em.find(Members.class, 10);
			
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
			
			Members member = new Members(21,"member123");
			
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
			
			Members member1 = new Members(1,"apple");
			Members member2 = new Members(2,"samsung");
			Members member3 = new Members(3,"hanhwa");
			
			em.persist(member1);
			em.persist(member2);
			em.persist(member3);
			
			// 원래는 여기서 flush 가 안되는게 맞지만 기본옵션에 의해서 먼저 flush 를 진행해준다.
			// flush 를 강제적으로적어주지도 않았고 아직 커밋에 도달하지도 않았는데 디비에 쿼리를 쏜것이다.
			
			
			List<Members> result = em.createQuery("select m from Member as m",Members.class).getResultList();
			
			
			for (Members mem : result) {
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
			Members member = em.find(Members.class, 1);
			member.setName("AAAA");
			
			// 준영속 상태로 전환 -> 영속성 컨텍스트에서 관리하지 말라고 꺼내버리는 행위가 된다.
			// 직접 쓸일은거의 없다.
			// 특정 데이터만 지워버린다.
			//em.detach(member);
			
			// 영속성 컨텍스트 내부를 통째로 다 지우는 행위이다.
			em.clear();
			
			// clear() 행위로 1차 캐시를 통으로 지워버리므로 캐싱하지 못하고 다시 db에 다녀오는 수고로움을 수반한다.
			Members member1 = em.find(Members.class, 1);
			
			
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
		
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			// 영속 상태
			//Member member = em.find(Member.class, 1);
			//Member member = em.find(Member.class, 1);
			//member.setName("AAAA");
			
			Members member = new Members();
			member.setId(1);
			member.setName("B");
			member.setRoleType(RoleType.GUEST);
			
			
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
	public void identityTableTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
			User user = new User();
			//user.setName("test");
			
			em.persist(user);
			
			System.out.println("======================");
			
			
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
	public void example01(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void relationMapping01(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
		
			Team team = new Team();
			team.setName("TeamA");
			em.persist(team);//영속상태가 되었으므로 pk가 할당된 상태이므로 pk 값을 받을 수 있다.
			
			User user = new User();
			user.setUserName("member1");
			//user.setTeamId(1L);// 디비 지향 모델링
			user.setTeam(team);
			em.persist(user);
			
			em.flush();
			em.clear();
			
			
			//외래키 식별자를 직접 다루다보니 객체간의 관계가 아닌 테이블에 맞춘 모델링이라고 볼 수 있다.
			User findUser = em.find(User.class, user.getId());
//			
//			Long findTeamId = findUser.getTeamId(); // 애도 아래처럼 바꿀 수 있다.
			Team findTeamInfo = findUser.getTeam();
			
			System.out.println(findTeamInfo.getName());
			
			
//			Team findTeam = em.find(Team.class, findTeamId);
//			
//			System.out.println(findTeam.getName());
			
			
			//객체를 테이블에 맞추어 데이터 중심으로 모델링 하면, 협력 관계를 만들 수 없다.
			/*
			 
			 - 테이블은 외래 키로 조인을 사용해서 연관된 테이블을 찾는다.
			 - 객체는 참조를 사용해서 연관된 객체를 찾는다.
			 - 테이블과 객체 사이에는 위와 같은 큰 간격이 존재한다.
			
			 
			 
			 
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
	public void relationMapping02(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
		
			Team findTeam = em.find(Team.class, 1L);
			
			//User findUser = em.find(User.class, 2L);
			
			//Team findTeamInfo = findUser.getTeam();
			
			//List<User> userList = findTeamInfo.get
			
			List<User> userList = findTeam.getUsers();
			
			System.out.println(userList.size());
			
			
			for (User users : userList) {
				System.out.println(users.getUserName());
				System.out.println(users.getId());
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
	public void relationMappingMistake(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
		
//			User user = new User();
//			user.setUserName("member10");
//			em.persist(user);
//			
//			Team team = new Team();
//			team.setName("Team G");
//			team.getUsers().add(user);
//			em.persist(team);
			
			//em.flush();
			//em.clear();
			
			// 위와 같이 사용하게 되면 연관관계의 주인인 User 에 Team 객체의 정보를 넣지 않았기 때문에,
			// User 테이블에 Team 정보가 들어가지 않게 된다.
			// 아래와 같이 진행해주는게 맞다.
//			Team team = new Team();
//			team.setName("Team H");
//			em.persist(team);
//			
//			
//			User user = new User();
//			user.setUserName("member10");
//			user.setTeam(team);
//			em.persist(user);
			
//			
//			em.flush();
//			em.clear();		
			
			// 즉 연관관계의 주인에 값을 집어넣어줘야 한다.!
			// 그래도 양방향에 넣어주는게 권장된다. 이유는 아래와 같다.
			
//			Team team = new Team();
//			team.setName("Team F");
//			em.persist(team);
//			
//			
//			
//			User user = new User();
//			user.setUserName("member8");
//			user.setTeam(team);
//			em.persist(user);
			
			//team.getUsers().add(user); // 애를 해주는걸 권장한다.
			
			
			// 이 부분에서 em.flush(), em.clear() 를 해주면 상관없지만,
			// clear를 해주지 않으면 디비에 날아가지 않는다.
			// 그리고 위에서 이미 Team 을 만든경우에는 영속성 컨텍스트 1차 캐시에 저장된다.
			// 그런데 team 에는 현재 users 를 넣어주지 않았기 때문에, 리스트를 조회해보면 유저가 없다고나오게 된다.
			
//			Team findTeam = em.find(Team.class, team.getId());
//			List<User> users = findTeam.getUsers();
//			
//			
//			for (User u : users) {
//				System.out.println(u.getUserName());
//			} 
			
			
			// 즉 양방향 연관관계에서는 양쪽에 값을 다 셋팅해주는게 맞다.
			// 아니면 생성자로 만들어줘서 연관관계를 맵핑을 해주는 방법도 있다.
			
			
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
	public void infinityLoop(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
			Team findTeam = em.find(Team.class, 1L);
			
			findTeam.getUsers().toString();
			
			
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
	public void oneToOne(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
			
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

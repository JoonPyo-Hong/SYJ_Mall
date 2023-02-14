package com.test.SYJ_Mall.jpatest;

import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.common.utill.CommonDateFormat;
import com.test.SYJ_Mall.jpashop.Book;
import com.test.SYJ_Mall.jpqltest.JpqlMember;
import com.test.SYJ_Mall.jpqltest.JpqlMemberDTO;
import com.test.SYJ_Mall.jpqltest.JpqlMemberType;
import com.test.SYJ_Mall.jpqltest.JpqlTeam;


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

	@Override
	public void inheritanceTypeJoin(HttpServletRequest request, HttpServletResponse response) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
			Movie movie = new Movie();
			movie.setDirector("a2");
			movie.setActor("b2");
			movie.setName("harry potter2");
			movie.setPrice(10000);
			
			em.persist(movie);
			em.flush();
			em.clear();
			
			Movie findMove = em.find(Movie.class, movie.getId());
			System.out.println("movie : " + findMove.getName());
			
			
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
	public void inheritanceTypeSingle(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
//			Movie movie = new Movie();
//			movie.setDirector("a2");
//			movie.setActor("b2");
//			movie.setName("harry potter2");
//			movie.setPrice(10000);
//			
//			em.persist(movie);
//			em.flush();
//			em.clear();
//			
//			Movie findMove = em.find(Movie.class, movie.getId());
//			System.out.println("movie : " + findMove.getName());
			
			
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
	public void mappedSuperClass(HttpServletRequest request, HttpServletResponse response) {
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

	
	
	@Override
	public void addTesting(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			Book book = new Book();
			
			//Book book = new Book();
			book.setName("JPA");
			book.setAuthor("test");
			
			em.persist(book);
			
			
			
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
	public void proxyTesting(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {

//			User user = new User();
//			user.setUserName("test11");
//			user.setTeam(team);
//			
//			em.persist(user);
//			team.getUsers().add(user);
//			
//		
//			User userFind = em.find(User.class, user.getId());
//			Team teamFind = userFind.getTeam();
//		
//			System.out.println(userFind.getUserName());
//			System.out.println(teamFind.getName());
			
			
			//User userFind = em.find(User.class, 8L);
			
			// User 정보만 가져오고 싶은데 Team 까지 조인해주고 있다.
			//System.out.println(userFind.getUserName());
			
			
			User user = new User();
			user.setUserName("testName");
			
			em.persist(user);
			
			em.flush();
			em.clear();
			
			
			// em.find 로 찾은 경우
			User findUser = em.getReference(User.class, user.getId());
			
			System.out.println(findUser.getClass());
			
			em.detach(findUser);
			
			System.out.println(findUser.getId());
			
			//System.out.println(findUser.getId());
			//System.out.println(findUser.getUserName());
			
//			User findUser2 = em.find(User.class, user.getId());
//			System.out.println(findUser2.getId());
//			System.out.println(findUser2.getUserName());
//			
			
			
			// em.getReference() 로 찾는 경우
			//User findUser = em.getReference(User.class, user.getId()); // getReference 호출하는 시점에는 데이터베이스에 쿼리를 하지는 않는다.
			//System.out.println(findUser.getClass()); // proxy class -> 가짜 클래스
			//System.out.println(findUser.getId());// 애까지는 디비에 쿼리를 날리지 않아도 된다.
			
			//System.out.println(findUser.getUserName());// jpa가 애는 없는것을 인지하고 디비에 쿼리를 날려서 가져오게 된다.
			//System.out.println(findUser.getUserName());// 두번째는 이미 값이 지정되어 있으므로 디비에 쿼리를 날려서 정보를 가져올 필요가 없다.
			
			
			// 프록시가 교체된다는 의미가 아니고 프록시를 통해서 엔티티에 접근해준다는 뜻이다.
//			System.out.println("before : " + findUser.getClass());
//			System.out.println(findUser.getUserName());
//			System.out.println("after : " + findUser.getClass()); 
			
			
			
			
			
			
//			User user1 = new User();
//			user1.setUserName("testName1");
//			
//			em.persist(user1);
//			
//			User user2 = new User();
//			user2.setUserName("testName2");
//			
//			em.persist(user2);
//			
//			em.flush();
//			em.clear();
//			
//			
//			User u1 = em.find(User.class, user1.getId());
//			//User u2 = em.find(User.class, user2.getId());
//			User u2 = em.getReference(User.class, user2.getId());
//			
//			
//			System.out.println("m1, m2" + (u1.getClass() == u2.getClass()));
//			System.out.println("m1, m2" + (u1 instanceof User));
			
			
			
			
			
			//User user1 = new User();
			//user1.setUserName("testName31");
			//em.persist(user1);
			
//			User user2 = new User();
//			user2.setUserName("testName111");
			
			
			
//			System.out.println("=======");
//			System.out.println(user1.getClass() == user2.getClass());
//			
//			
			// 먼저 프록시를 호출하면 뒤에서 find 로 써도 프록시가 호출되긴 한다.
//			User refUser = em.getReference(User.class, user1.getId());
//			System.out.println(refUser.getClass());
//
//			User findUser = em.find(User.class, user1.getId());
//			System.out.println(findUser.getClass());
//			
//			
//			System.out.println(refUser == findUser);
			
			
			//em.flush();
			//em.clear();
			
			
			// 프록시 강제초기화 방법
			//User refUser = em.getReference(User.class, user1.getId());
			//System.out.println(refUser.getClass());
			//System.out.println(refUser.getClass());
			//refUser.getUserName();//이렇게 쓰면 강제로 초기화 되긴하지만 매우 무식해보이는 방법이다.
			
			//초기화 하는 정석적인 방법
			//Hibernate.initialize(refUser);
			//System.out.println("isLoaded= " + emf.getPersistenceUnitUtil().isLoaded(refUser));
			
			
			
			
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
	public void lazyTesting(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			

			Team team = new Team();
			team.setName("LAZY TEAM");
			em.persist(team);
			
			User user = new User();
			user.setUserName("lazyUser");
			user.setTeam(team);
			em.persist(user);
			
			
			em.flush();
			em.clear();
			
			//@ManyToOne(fetch = FetchType.LAZY) -> 옵션을 주게 되면 위에처럼 User 정보만 알고싶은데 굳이 Team을 조회해주진 않는다.
			User m = em.find(User.class, user.getId());
			
			// com.test.SYJ_Mall.jpatest.Team$HibernateProxy User 를 조회할때는 Team 은 Proxy 로 가져오게 된다.
			System.out.println("m = " + m.getTeam().getClass());
			
			System.out.println("=====================");
			m.getTeam().getName();
			//team.getName();
			System.out.println("=====================");
			System.out.println("m = " + m.getTeam().getClass());
			
			
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
	public void cascadeTesting(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			Child child1 = new Child();
			child1.setName("test1");
			
			Child child2 = new Child();
			child2.setName("test2");
			
			Parent parent = new Parent();
			parent.addChild(child1);
			parent.addChild(child2);
			
			
			// 원래는 아래와 같이 3개의 persist 를 넘겨줘야 정상적으로 디비에 저장이 된다.
			//em.persist(parent);
			//em.persist(child1);
			//em.persist(child2);
			
			
			// 근데 위와 같이 세개씩 하면 너무 귀찮다...
			// 이럴때 써주는 옵션이 cascade 옵션이 된다. => parent 객체에 넣어주면 parent 만 persist 해도 문제없이 디비에 데이터를 밀어넣는 것을 볼 수 있다.
			em.persist(parent);
			
			
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
	public void orphanTest(HttpServletRequest request, HttpServletResponse response) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			Child child1 = new Child();
			child1.setName("test1");
			
			Child child2 = new Child();
			child2.setName("test2");
			
			Parent parent = new Parent();
			parent.addChild(child1);
			parent.addChild(child2);
			
		
			em.persist(parent);
			em.flush();
			em.clear();
			
			
			Parent findParent = em.find(Parent.class, parent.getId());
			findParent.getChildList().remove(0);
			
			
			
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
	public void jpaDataValueTest(HttpServletRequest request, HttpServletResponse response) {
		
		
		int a = 10;
		int b = a;
		
		a = 20;
		
		
		System.out.println("a = " + a);
		System.out.println("b = " + b);
		// 위에 처럼 값이 공유가 되지 않다는걸 볼 수 있다.
		
		
		// 클래스는 레퍼런스를 긁어가므로 공유가 된다.
		Integer a1 = 10;
		Integer b1 = a;
		
		a1 = 20;
		
		System.out.println("a1 = " + a1);
		System.out.println("b1 = " + b1);
		
		
		
		
		
	}

	@Override
	public void embededValueTest(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			UserTest user = new UserTest();
			
			
			user.setUserName("test1");
			user.setWorkAddress(new Address("seoul","sopngpa","123-123"));
			user.setWorkPeriod(new Period(cd.getPresentTimeUTC(),cd.getPresentTime()));
			
			
			em.persist(user);
			
			
			
			

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
	public void valueAndEmmutableTest(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
//			Address address = new Address("seoul","sopngpa","123-123");
//			
//			UserTest user1 = new UserTest();
//			user1.setUserName("test1");
//			user1.setWorkAddress(address);
//			user1.setWorkPeriod(new Period(cd.getPresentTimeUTC(),cd.getPresentTime()));
//			
//			em.persist(user1);
//			
//			
//			UserTest user2 = new UserTest();
//			user2.setUserName("test1");
//			user2.setWorkAddress(address);
//			user2.setWorkPeriod(new Period(cd.getPresentTimeUTC(),cd.getPresentTime()));
//			
//
//			em.persist(user2);
			
			// 나는 user1 의 데이터만 바꾸고 싶어서 아래와 같이 메서드를 작성하였다. -> 하지만 두개 다 바뀌어 버린다...
//			user1.getWorkAddress().setCity("Busan");
			
			
			// 그럼 위와 같은 문제를 어떤식으로 해결해야 할까? => 아래와 같이 해결할 수 있다.
			
//			Address address = new Address("seoul","sopngpa","123-123");
//			
//			UserTest user1 = new UserTest();
//			user1.setUserName("test1");
//			user1.setWorkAddress(address);
//			user1.setWorkPeriod(new Period(cd.getPresentTimeUTC(),cd.getPresentTime()));
//			
//			em.persist(user1);
//			
//			
//			Address address2 = new Address(address.getCity(),address.getStreet(), address.getZipCode());//이런식으로 복사를 해야한다. 공유참조의 부작용을 피할 수 는 있으나...
//			
//			UserTest user2 = new UserTest();
//			user2.setUserName("test1");
//			user2.setWorkAddress(address2);
//			user2.setWorkPeriod(new Period(cd.getPresentTimeUTC(),cd.getPresentTime()));
//			
//
//			em.persist(user2);
//			
//			user1.getWorkAddress().setCity("Busan");
			
			//즉 갹체의 공유참조는 피할 수 없다....
			
			/*
			 
			  그래서 부작용을 원천 차단하려면 
			 
			  값 타입은 불변 객체(immutable object)로 설계해야 한다.
			  
			  불변객체 : 생성 시점 이후 절대 값을 변경할 수 없는 객체
			  
			  즉 생성자로만 값을 설정하고 수정자를 만들지 않으면 된다.(*****) => setter 를 지워줘버린다!
			  
			  참고 => Integer, String 은 자바가 제공하는 대표적인 불변객체
			  
			  
			  
			 */
			
			
			// 그럼 실제로 값을 바꾸고 싶을 때는 어떤식으로 할 수 있을까?
			
			Address address = new Address("seoul","sopngpa","123-123");
			
			UserTest user1 = new UserTest();
			user1.setUserName("test1");
			user1.setWorkAddress(address);
			user1.setWorkPeriod(new Period(cd.getPresentTimeUTC(),cd.getPresentTime()));
			
			Address newAddress = new Address("Busan","sopngpa","123-123"); //아예 새로 할당해서 아래처럼 셋팅 자체를 통으로 다시 해주면 된다!
			user1.setWorkAddress(newAddress);
			
			em.persist(user1);
			
			

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
	public void valueVersusTest(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {

		
		int a = 10;
		int b = 10;
		
		System.out.println("a == b : " + (a==b));
		
		Address address1 = new Address("seoul","sopngpa","123-123");
		Address address2 = new Address("seoul","sopngpa","123-123");
		
		//System.out.println("address1 == address1 : " + (address1==address2));
		
		System.out.println("address1 == address1 : " + (address1.equals(address2)));
		
		System.out.println(address1.hashCode());
		System.out.println(address2.hashCode());
		
		
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
//
//		EntityManager em = emf.createEntityManager();
//
//		EntityTransaction tx = em.getTransaction();
//
//		tx.begin();
//
//		try {
//			
//			
//
//			tx.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//			tx.rollback();
//		} finally {
//			em.close();
//		}
//		
//		emf.close();
	}
	
	
	@Override
	public void valueCollection(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			UserTest user = new UserTest();
			user.setUserName("user 1");
			user.setWorkAddress(new Address("seoul","sopngpa","123-123"));
			
			user.getFavoriteFoods().add("apple");
			user.getFavoriteFoods().add("banana");
			user.getFavoriteFoods().add("kiwi");
			
			user.getAddressHistory().add(new Address("seoul123","kangnam","12345-12345"));
			user.getAddressHistory().add(new Address("seoul345","kangnam","12345-12345"));
			
			em.persist(user);
			
			
			em.flush();
			em.clear();
			
			
			//em.find(UserTest.class, user.getId());
			System.out.println("============ start ============");
			UserTest findUser = em.find(UserTest.class, user.getId());
			
			// 멤버만 가지고 온다 즉 위에서 쓰인 컬렉션들은 모두 지연 로딩이라고 보면 된다.
			
			// select 
//			List<Address> addList = findUser.getAddressHistory();
//		
//			for (Address add : addList) {
//				System.out.println(add);
//			}
			
			
			
			// update
			// 아래와 같은 방식으로 진행하면 update 문은 나가게 되지만 -> side effect가 무조건 발생하게 된다.
			//findUser.getWorkAddress().setCity("public");
			
			//아래와 같이 그냥 새로 넣어야 한다.
			Address addr = findUser.getWorkAddress();
			findUser.setWorkAddress(new Address("public",addr.getStreet(),addr.getZipCode()));
			
			
			// 만약 위에서 food를 apple -> mango 로 바꾸고 싶다면?
			findUser.getFavoriteFoods().remove("apple");
			findUser.getFavoriteFoods().add("mango");
			
			
			// 주소를 바꿔보고 싶다
			// Equals 가 제대로 구현이 되어 있다면 잘 작동할 것이다.
			findUser.getAddressHistory().remove(new Address("seoul123","kangnam","12345-12345"));
			findUser.getAddressHistory().add(new Address("seoul123!!!","kangnam","12345-12345"));
			
			
			// 그런데 위에서 리무브를 해주면 전체다 테이블을 삭제하고 다시 데이터 하나하나 넣어준다
			/*
			 
			  값 타입 컬렉션의 제약사항
			  - 값 타입은 엔티티와 다르게 식별자 개념이 없다.
			  - 값은 변경하면 추적이 어렵다.
			  - 값 타입 컬렉션에 변경 사항이 발생하면, 주인 엔티티와 연관된 모든 데이터를 삭제하고,
			  값 타입 컬렉션에 있는 현재 값을 모두 다시 저장한다. -> 즉 그래서 쓰면 안된다...
			  - 값 타입 컬렉션을 매핑하는 테이블은 모든 컬럼을 묶어서 기본키를 구성해야 한다.
			  
			  
			  - 실무에서는 값타입 컬렉션을 쓰지 말고 그냥 테이블 로 사용하라 일대다 관계를 사용해서 서비스를 제공해야 한다.
			  
			  단순한거에만 사용해야 한다 값타입컬렉션은....
			  
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
	public void jpaQueryTesting(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
//			List<UserTest> userList = em.createQuery("select u From UserTest u where u.userName like '%er%'",UserTest.class).getResultList();
//			
//			for (UserTest user : userList) {
//				System.out.println(user.getUserName());
//			}
			
			
			// 동적 쿼리와 같이 문자열을 다뤄주는게 너무 힘들다 보니 <Criteria> 가 나오게 된다.
			// 실무에서는 어려워서 잘 안쓰긴 한다.
			
//			CriteriaBuilder cb = em.getCriteriaBuilder();
//			CriteriaQuery<UserTest> query = cb.createQuery(UserTest.class);
//			
//			Root<UserTest> u = query.from(UserTest.class);
//			
//			CriteriaQuery<UserTest> cq = query.select(u).where(cb.equal(u.get("userName"), "user 1"));
//			
//			List<UserTest> userList = em.createQuery(cq).getResultList();
//			
//			
//			for (UserTest user : userList) {
//				System.out.println(user.getUserName());
//			}
			
			
			
			// 그래서 대안으로 나온건 -> ***Query DSL*** 이 나오게 된다.
			
			
			// 네이티브 SQL -> 진짜 디비마다의 문법으로 적어줄 수 있다.
			
			List<UserTest> userList = em.createNativeQuery("select * from USER_TEST",UserTest.class).getResultList();
		
			for (UserTest user : userList) {
				System.out.println(user.getUserName());
			}
			
			
			// 영속성 컨텍스트를 적절한 시점에 강제로 플러시 필요하다.
			
			
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
	public void jpqlStartTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
			/*
			 
			  TypeQuery: 반환 타입이 명확할 때 사용
			  Query: 반환 타입이 명확하지 않을 때 사용
			  
			 */
			
			JpqlMember member = new JpqlMember();
			member.setUserName("member135");
			member.setAge(30);
			em.persist(member);
			
			//반환타입이 명확한 경우
			TypedQuery<JpqlMember> query1 = em.createQuery("select u from JpqlMember u",JpqlMember.class);
			TypedQuery<String> query2 = em.createQuery("select u.userName from JpqlMember u",String.class);
			
			// 위에 두개는 타입정보가 명확하니까 TypedQuery 로 받아와주면 되고 아래와 같이 타입이 섞여있을 경우에는 TypedQuery로 받지 않는다.
			Query query3 = em.createQuery("select u.userName, u.age from JpqlMember u");
			
			
			//결과조회
			
			// 여러개의 결과가 나오는 경우
			List<JpqlMember> memberList = query1.getResultList();
			
			for (JpqlMember mem : memberList) {
				System.out.println(mem.getUserName());
			}
			
			
			// 단일의 결과가 나오는 경우
			TypedQuery<JpqlMember> query4 = em.createQuery("select u from JpqlMember u where u.id = 1",JpqlMember.class);
			
			JpqlMember singleMem = query4.getSingleResult();
			
			System.out.println(singleMem.getUserName());
			
			//getSingleResult -> 결과가 정확하게 하나여야함 없거나 둘 이상이면 에러를 도출한다.
			
			
			//파라미터 바인딩
			TypedQuery<JpqlMember> query5 = em.createQuery("select u from JpqlMember u where u.userName = :username",JpqlMember.class);
			query5.setParameter("username", "member13");
			
			JpqlMember singleMem2 = query5.getSingleResult();
			
			System.out.println(singleMem2.getUserName());
			
			
			
			// 위처럼 사용하지 않고 아래와 같이 메서드 체인을 사용한다.
			JpqlMember singleMem3 = em.createQuery("select u from JpqlMember u where u.userName = :username",JpqlMember.class)
			.setParameter("username", "member13")
			.getSingleResult();
			
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
	public void projectionTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");

		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
//			JpqlMember member = new JpqlMember();
//			member.setUserName("member999");
//			member.setAge(30);
//			em.persist(member);
//			
//			
//			em.flush();
//			em.clear();
			
			
			//1. 엔티티 프로젝션 -> 영속성 컨텍스트 관리가 된다.
			//List<JpqlMember> userList = em.createQuery("select u from JpqlMember u",JpqlMember.class).getResultList();
			
			//JpqlMember userSelect = userList.get(0);
			
			//userSelect.setAge(1000); // 만약에 값이 바뀌면 영속성 컨텍스트에서 관리가 되는 것이다. -> 값이 바뀌므로 영속성 컨텍스트 관리가 된다는 의미가 된다.
			
			
			//2. 엔티티 프로젝션 -> join
			// List<JpqlTeam> teamList = em.createQuery("select u.team from JpqlMember u",JpqlTeam.class).getResultList();
			
			// teamList.get(0).setName("wowowowowowow");
			
			
			
			
			
			//만약에 특정 컬럼만 가져오고 싶다 그럼 타입을 어떤식으로 맵핑해야하지?
			
			//1) 첫번째 방법 -> Object 로 선언
//			List<Object> resultList = em.createQuery("select u.userName, u.age from JpqlMember u").getResultList();
//			
//			Object o = resultList.get(0);
//			Object[] result = (Object[])o;
//			
//			System.out.println(result[0]);
//			System.out.println(result[1]);
//			
			
			//2) generic 을 통한 방법
//			List<Object[]> resultList = em.createQuery("select u.userName, u.age from JpqlMember u").getResultList();
//			
//			
//			System.out.println(resultList.get(0)[0]);
//			System.out.println(resultList.get(0)[1]);
			
			
			//3) new 명령어로 조회 -> dto 로 조회
			// 주의점 : 패키지 명을 포함한 전체 클래스 명을 입력해줘야한다.
			List<JpqlMemberDTO> resultList = em.createQuery("select new com.test.SYJ_Mall.jpqltest.JpqlMemberDTO(u.userName, u.age) from JpqlMember u",JpqlMemberDTO.class).getResultList();
			
			System.out.println(resultList.get(0).getAge());
			System.out.println(resultList.get(0).getUserName());
			
			
			
			
			
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
	public void jpqlPagingTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
			
			List<JpqlMember> result =  em.createQuery("select u from JpqlMember u order by u.age",JpqlMember.class)
											.setFirstResult(2)
											.setMaxResults(10)
											.getResultList();
			
			for (JpqlMember mem : result) {
				System.out.println(mem.getUserName() + " " + mem.getAge());
				
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
	public void jpqlJoinTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			
//			JpqlTeam team = new JpqlTeam();
//			team.setName("prince song");
//			em.persist(team);
//			
//			JpqlMember member = new JpqlMember();
//			member.setUserName("member1999");
//			member.setAge(30);
//			member.setTeam(team);
//			em.persist(member);
//			
//			
//			// 1. 내부조인
//			
//			String query = "select jm from JpqlMember jm inner join jm.team t ";
//			
//			List<JpqlMember> result =  em.createQuery(query,JpqlMember.class).getResultList();
//			
//			for (JpqlMember mem : result) {
//				System.out.println(mem.getUserName() + " " + mem.getAge());
//				
//			}
//			
//			
//			
//			// 2. 외부조인
//			String query2 = "select jm from JpqlMember jm left outer join jm.team t ";
//			
//			List<JpqlMember> result2 =  em.createQuery(query2,JpqlMember.class).getResultList();
//			
//			for (JpqlMember mem : result2) {
//				System.out.println(mem.getUserName() + " " + mem.getAge());
//				
//			}
//			
//			
//			// 3. 셋타조인 -> 애는 위처럼 뭐 연관관계 맵핑을 해주지 않아도알아서 실행된다. => Cross join 이 실행된 다음에 where 절로 필터링 한다.
//			String query3 = "select jm from JpqlMember jm, JpqlTeam jt where jm.userName = jt.name";
//			
//			List<JpqlMember> result3 =  em.createQuery(query3,JpqlMember.class).getResultList();
//			
//			for (JpqlMember mem : result3) {
//				System.out.println(mem.getUserName() + " " + mem.getAge());
//				
//			}
			
			
			
			//4. JPA 2.1 부터 on을 사용해서 조인이 되게할 수 있다. && 연관관계 없는 엔티티 외부 조인이 가능해진다. => 연관관계 맵핑이 필요없이 조인이 가능
			String anyQuery = "select jm from JpqlMember jm inner join JpqlTeam jt on jm.teamId = jt.id";
			
			List<JpqlMember> queryResult =  em.createQuery(anyQuery,JpqlMember.class).getResultList();
			
//			for (JpqlMember mem : queryResult) {
//				System.out.println(mem.getUserName() + " " + mem.getAge() + " " + mem.getTeamId());
//				
//			}
			
			
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
	public void subQueryTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			String query1 = "select jm from JpqlMember jm where exists (select t from jm.team t where t.name = 'wowowowowowow')";
			
			List<JpqlMember> queryResult =  em.createQuery(query1,JpqlMember.class).getResultList();
			
			for (JpqlMember mem : queryResult) {
				System.out.println(mem.getUserName() + " " + mem.getAge() + " " + mem.getTeam().getId());
				
			}
			
			
//			String query2 = "select jm from JpqlMember jm where exists (select t from jm.team t where t.name = 'wowowowowowow')";
//			
//			List<JpqlMember> queryResult2 =  em.createQuery(query2,JpqlMember.class).getResultList();
//			
//			for (JpqlMember mem : queryResult2) {
//				System.out.println(mem.getUserName() + " " + mem.getAge() + " " + mem.getTeam().getId());
//				
//			}
			
			
			
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
	public void jpqlTypeTest(HttpServletRequest request, HttpServletResponse response) {
		
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			JpqlTeam team = new JpqlTeam();
			team.setName("prince ali123");
			em.persist(team);
			
			JpqlMember member = new JpqlMember();
			member.setUserName("member3123999");
			member.setAge(320);
			member.setTeam(team);
			member.setType(JpqlMemberType.USER);
			em.persist(member);
			
			em.flush();
			em.clear();
			
			
			//String query1 = "select jm.userName, 'HELLO', true, FALSE from JpqlMember jm where jm.type = com.test.SYJ_Mall.jpqltest.JpqlMemberType.ADMIN";
			
			//List<Object[]> queryResult =  em.createQuery(query1).getResultList();
			
			//System.out.println(queryResult.get(0)[0]);
			
			// 근데 위처럼 쓰면 패키지 명부터 쓰고 너무 복잡해지니까 아래와 같이 사용해줄 수 있다.
			
			
			String query2 = "select jm.userName, 'HELLO', true, FALSE from JpqlMember jm where jm.type = :userType";
			
			List<Object[]> queryResult =  em.createQuery(query2)
					.setParameter("userType", JpqlMemberType.USER)
					.getResultList();
			
			System.out.println(queryResult.get(0)[0]);
			
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
	public void jpqlCaseTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			JpqlTeam team = new JpqlTeam();
			team.setName("prince ali123");
			em.persist(team);
			
			JpqlMember member = new JpqlMember();
			member.setUserName("member3123999");
			member.setAge(11);
			member.setTeam(team);
			member.setType(JpqlMemberType.USER);
			em.persist(member);
			
			em.flush();
			em.clear();
			
			
			String selectQuery = 
					"select " +
							"case when jm.age <= 10 then 'student' " +
							"	  when jm.age >= 60 then 'adult' " +
							"	  else 'normal' " +
							"end " +
					"from JpqlMember jm";
			
			List<String> resultList = em.createQuery(selectQuery).getResultList();
			
			
			for (int i = 0; i < resultList.size(); i++) {
				System.out.println(resultList.get(i));
			}
			
			
//			for (JpqlMember mem : resultList) {
//				System.out.println(mem.getUserName() + " " + mem.getAge() + " " + mem.getTeam().getId());
//				
//			}
			
 			
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
	public void jpqlFunctionTest(HttpServletRequest request, HttpServletResponse response) {
		
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
//			JpqlTeam team = new JpqlTeam();
//			team.setName("prince ali123");
//			em.persist(team);
//			
//			JpqlMember member = new JpqlMember();
//			member.setUserName("member3123999");
//			member.setAge(11);
//			member.setTeam(team);
//			member.setType(JpqlMemberType.USER);
//			em.persist(member);
//			
//			em.flush();
//			em.clear();
			
			
			
			// 1. concat
			String query1 = "select concat('a','b') from JpqlMember jm";
			
			List<String> resultList1 = em.createQuery(query1).getResultList();
			
			for (int i = 0; i < resultList1.size(); i++) {
				System.out.println(resultList1.get(i));
			}
 			
			
			// 2. locate
			String query2 = "select locate('de','abcde') from JpqlMember jm";
			
			List<Integer> resultList2 = em.createQuery(query2,Integer.class).getResultList();
			
			for (int i = 0; i < resultList2.size(); i++) {
				System.out.println(resultList2.get(i));
			}
			
			
			// 3. size(??)
			String query3 = "select size(jt.members) from JpqlTeam jt";
			
			List<Integer> resultList3 = em.createQuery(query3,Integer.class).getResultList();
			
			
			for (int i = 0; i < resultList3.size(); i++) {
				System.out.println(resultList3.get(i));
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
	public void jpaPathTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			// 1. 상태필드 : 이런식으로 상태필드를 만나게 되면 userName 에 . 을 찍어서 또 내부로 들어갈 수 있는 것이 아니므로 경로탐색의 끝이라고 볼 수 있다.
			String query1 = "select jm.userName from JpqlMember jm"; 
			
			
			// 2. 단인 값 연관 경로 : 묵시적 내부 조인 발생한다. => JpqlMember, team 조인해서 가져온다. => 쿼리 튜닝할때 정말 어렵게 된다. : 묵시적 조인이 발생하므로
			String query2 = "select jm.team.name from JpqlMember jm"; 
			
//			List<String> resultList1 = em.createQuery(query2,String.class).getResultList();
//			
//			
//			for (String s : resultList1) {
//				System.out.println(s);
//			}
			
			
			// 3. 컬렉션 값 연관 경로 : 컬렉션을 가리키기 때문에 사실 . 을 찍어서 가져올 수 있는건 size 정도 밖에 없다고 볼 수 있다.
			String query3 = "select jt.members from JpqlTeam jt"; 
			String query4 = "select jm.userName from JpqlTeam jt join jt.members jm"; //이런식으로 써야한다.
			
			//Collection resultList = em.createQuery(query3,Collection.class).getResultList();
			
			//System.out.println(resultList);
			
			List<String> resultList1 = em.createQuery(query4,String.class).getResultList();
			
			for (String s : resultList1) {
				System.out.println(s);
			}
			
			
			// 사실은 묵시적 조인은 다 쓰면 안되고 1번만 쓰는것을 권장한다.
			
			
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
	public void fetchJoinTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
//			JpqlTeam teamA = new JpqlTeam();
//			teamA.setName("teamA");
//			em.persist(teamA);
//			
//			JpqlTeam teamB = new JpqlTeam();
//			teamB.setName("teamB");
//			em.persist(teamB);
//			
//			
//			JpqlMember memberA = new JpqlMember();
//			memberA.setUserName("memberA");
//			memberA.setAge(11);
//			memberA.setTeam(teamA);
//			em.persist(memberA);
//			
//			JpqlMember memberB = new JpqlMember();
//			memberB.setUserName("memberB");
//			memberB.setAge(21);
//			memberB.setTeam(teamA);
//			em.persist(memberB);
//			
//			
//			JpqlMember memberC = new JpqlMember();
//			memberC.setUserName("memberA");
//			memberC.setAge(31);
//			memberC.setTeam(teamB);
//			em.persist(memberC);
			
			
			
//			em.flush();
//			em.clear();
//			
//			
//			String query = "select jm from JpqlMember jm";
//			
//			List<JpqlMember> memList = em.createQuery(query,JpqlMember.class).getResultList();
//			
//			
//			
//			for (JpqlMember mem : memList) {
//				System.out.println(mem.getUserName());
//				System.out.println(mem.getTeam().getName());
//				// 회원1, 팀A (SQL 로 가져온다 영속성컨텍스트에 없기 때문에)
//				// 회원2, 팀A (영속성 컨텍스트에 있기 때문에 SQL 쿼리 날릴필요 없다 -> 1차캐시에서 가져옴)
//				// 회원3, 팀B (영속성 컨텍스트에 없기 때문에 SQL 로 가져온다.)
//				
//				// 즉 위에서 쿼리가 매우 많이 나가게 된다...
//				// 회원 100명 조회하는데 쿼리 100방 나가면.... N+1
//				
//			}
			
			// 즉 위와같은 경우에는 fetch join 으로 풀어야만 한다.
			
			
			String query = "select jm from JpqlMember jm join fetch jm.team";
			
			List<JpqlMember> memList = em.createQuery(query,JpqlMember.class).getResultList();
			
			
			for (JpqlMember mem : memList) {
				System.out.println(mem.getUserName());
				System.out.println(mem.getTeam().getName());				
			}
			
			System.out.println("========================");
			
			// fetch join으로 풀어야 쿼리가 한방에 날라가게 된다.
			
			
			// 컬렉션 페치 조인의 경우 -> 주의해야한다.
			String query2 = "select jt from JpqlTeam jt join fetch jt.members";
			
			List<JpqlTeam> teamList = em.createQuery(query2,JpqlTeam.class).getResultList();
			
			for (JpqlTeam team : teamList) {
				System.out.println(team.getName());
				System.out.println(team.getMembers().size());				
			
				/*
				 	teamA
					2
					teamA
					2
					teamB
					1 
				 
				 * */
				// 컬렉션일때는 위의 현상을 조심해야 한다.
				
				
				
				
				
			}
			
			
			// 중복은 distinct로 제거하고 싶지만 사실 distinct 로 구분이 되려면 진짜 행에 모든 열의 데이터가 같아야 한다 -> 하지만 지금 그런상황은 아님.
			// 물론 DB 입장에서는 위의 말이 맞지만, JPA 에서는 같은 식별자를 가진 엔티티 자체를 제거해버린다. -> 애플리케이션단에서 필터링 해주는 것이다.
			String query3 = "select distinct jt from JpqlTeam jt join fetch jt.members";
			
			List<JpqlTeam> teamList2 = em.createQuery(query3,JpqlTeam.class).getResultList();
			
			
			for (JpqlTeam team : teamList2) {
				System.out.println(team.getName());
				System.out.println(team.getMembers().size());			
				
			}
			
			
			
			// 일반조인과 패치조인의 차이점!! -> 일반조인은 실행 시 연관된 엔티티를 함께 조회하지 않는다.
			String query4 = "select jt from JpqlTeam jt join jt.members jm";
			
			List<JpqlTeam> teamList3 = em.createQuery(query4,JpqlTeam.class).getResultList();
			
			
			for (JpqlTeam team : teamList3) {
				System.out.println(team.getName());
				System.out.println(team.getMembers().size());			
				
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
	public void fetchJoinLimitTest(HttpServletRequest request, HttpServletResponse response) {
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql");
		
		EntityManager em = emf.createEntityManager();

		EntityTransaction tx = em.getTransaction();

		tx.begin();

		try {
			
			// fetch join 의 한계 
			
			// 1. fetch join 의 대상이 되는 엔티티에는 alias를 줄 수 없다.
			// -> 중간에 몇개를 가져오고 싶다? -> fetch 조인을 쓰면 안된다.
			String query = "select jt from JpqlTeam jt join fetch jt.members as jm"; // 이런식으로 as 로 쓸 수 없다.
			
			
			// 2. 둘이상의 컬렉션은 페치 조인할 수 없다.
			
			
			// 3. 컬렉션을 페치 조인하면 페이징 API를 사용할 수 없다.
			// - 데이터가 뻥튀기가 되므로 페이징이 어렵다.
			String warnQuery = "select jt from JpqlTeam jt join fetch jt.members";
			
			List<JpqlTeam> teamList = em.createQuery(warnQuery,JpqlTeam.class)
										.setFirstResult(0)
										.setMaxResults(1)
										.getResultList();
			
			System.out.println(teamList.size());
			
			// 쿼리를 보면 알겠지만 데이터를 한번에 다 긁어와서 잘라주는 방식이다 -> 장애나기에 딱 좋은 로직임.
			// 위의 쿼리를 장애가 안나가게 하면 1 -> M 으로 방향을 바꿔주면 된다.
			
			String goodQuery = "select jm from JpqlMember jm join fetch jm.team";
			
			List<JpqlMember> memList = em.createQuery(goodQuery,JpqlMember.class)
					.setFirstResult(0)
					.setMaxResults(1)
					.getResultList();
			
			System.out.println(memList.size());
			// -> limit 쿼리가 나가게 된다.
			
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

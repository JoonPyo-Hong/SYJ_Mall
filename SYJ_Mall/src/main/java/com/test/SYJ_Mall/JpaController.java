package com.test.SYJ_Mall;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.jpatest.IJpaService;
import com.test.SYJ_Mall.jpatest.Member;

@Controller
public class JpaController {
	
	@Autowired
	private IJpaService service;
	
	
	// JPA 시작
	@RequestMapping(value = "/jpaTest.action", method = { RequestMethod.GET })
	public String jpaTest(HttpServletRequest request, HttpServletResponse response) {
		
		
		//service.jpaTest(request,response);
		//service.jpaFind(request,response);
		//service.jpaFindDelete(request,response);
		//service.jpaUpdate(request,response);
		
		
		
		// 엔티티 매니저 팩토리는 하나만 생성해서 애플리케이션 전체에서 공유해야 한다.
		// 엔티티 매니저는 쓰레드간에 공유할수 없다 (사용하고 버려야 한다)
		// JPA의 모든 데이터 변경은 트랜잭션 안에서 실행된다.
		// RDB 는 결국 트랜잭션 안에서 모든 작업들이 발생하게 되는 것이다. => db 는 내부적으로 모두 트랜잭션을 걸고 있다.
		
		
		service.jpaSelect(request,response);
		
		
		return "";
	}
	
	
	// JPA 영속성 관리
	@RequestMapping(value = "permanenceTest.action", method = { RequestMethod.GET })
	public String permanenceTest(HttpServletRequest request, HttpServletResponse response) {
		
		/*
		  
		 JPA 에서 가장 중요한 2가지
		 1. 객체와 관계형 데이터베이스 매핑하기
		 2. 영속성 컨텍스트
		  
		 * */
		
		
		/*
		 
		 영속성 컨텍스트란 무엇인가?
		 - JPA 를 이해하는데 가장 중요한 용어(***)
		 - "엔티티를 영구 저장하는 환경" 이라는 뜻이다. 
		 
		 - 영속성 컨텍스트는 논리적인 개념이다.
		 - 눈에 보이는 개념이 아니다.
		 - 엔티티 매니저를 통해서 영속성 컨텍스트에 접근한다.
		  
		 
		 엔티티 생명주기
		 
		 1. 비영속(new/transient)
		 - 영속성 컨텍스트와 전혀 관계가 없는 새로운 상태
		  
		 2. 영속
		 - 영속성 컨텍스트에 관리되는 상태
		 
		 3. 준영속
		 - 영속성 컨텍스트에 저장되었다가 분리된 상태
		 
		 4. 삭제
		 - 삭제된 상태
		 
		 
		 * */
		
		
		//service.permanencConcept(request,response);
		//service.permanenceAdvantage(request,response);
		//service.permanenceIdentity(request,response);
		//service.permanenceWrite(request,response);
		service.permanenceUpdateCheck(request,response);
		
		
		return "";
	}
	
	
	
	@RequestMapping(value = "flushTest.action", method = { RequestMethod.GET })
	public String flushTest(HttpServletRequest request, HttpServletResponse response) {
		
		/*
		 
		 Flush : 영속성 컨텍스트의 변경내용을 데이터베이스에 반영
		 
		 영속성 컨텍스트의 변경내용과 데이터베이스를 비교해서 일관성을 유지해주는 것이다.
		 
		 
		 ** 플러시 발생
		 - 변경감지 발생
		 - 수정된 엔티티 쓰기 지연 SQL 저장소에 등록
		 - 쓰기 지연 SQL 저장소의 쿼리를 데이터베이스에 전송
		 
		 
		 ** 영속성 컨텍스트를 직접 플러시 하는법
		 - em.flush() : 직접 호출
		 - 트랜잭션 커밋 : 플러시 자동 호출
		 - JPQL 쿼리 실행 : 플러시 자동 호출
		 
		 
		 ** 플러시(Flush) 개념
		 - 영속성 컨텍스트를 비우지 않는다.
		 - 영속성 컨텍스트의 변경내용을 데이터베이스에 동기화 하는것을 말한다,
		 - 트랜잭션이라는 작업 단위가 중요하다 -> 커밋 직전에만 동기화 하면 된다.
		 
		 
		*/
		
		
		//service.flushTesting(request,response);
		service.flushJpql(request,response);
		
		return "";
	}
	
	
	@RequestMapping(value = "zunPermanenceTest.action", method = { RequestMethod.GET })
	public String zunPermanenceTest(HttpServletRequest request, HttpServletResponse response) {
		
		/*
		 
		 준영속 상태
		 - 영속 상태의 엔티티가 영속성 컨텍스트에서 분리되는 것
		 - 영속성 컨텍스트가 제공하는 기능을 사용할 수 없다.
		 
		 
		*/
		
		
		service.detachTest(request,response);
	
		
		return "";
	}
	
	
	
	@RequestMapping(value = "emtityMappingTest.action", method = { RequestMethod.GET })
	public String emtityMappingTest(HttpServletRequest request, HttpServletResponse response) {
		
		/*
		 
		 엔타티 매핑
		 - 객체와 테이블 매핑 @Entity, @Table
		 - 필드와 컬럼 매핑 : @Column
		 - 기본 키 매핑 : @Id
		 - 연관관계 매핑 : @ManyToOne, @JoinColumn
		
		
		@Entity 가 붙은 클래스는 JPA 가 관리, 엔티티라고 한다.
		JPA 를 사용하여 테이블과 매핑할 클래스는 @Entity 가 필수요건이다.
		
		
		
		데이터베이스 스키마 자동 생성
		- DDL 을 애플리케이션 실행 시점에 자동 생성(운영에서는 쓰면 안된다.)
		- 테이블 중심 -> 객체 중심
		- 데이터베이스 방언을 활용해서 데이터베이스에 맞는 적절한 DDL을 생성해준다.
		
		*/
		
		service.EntityTableTest(request,response);
		
		
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

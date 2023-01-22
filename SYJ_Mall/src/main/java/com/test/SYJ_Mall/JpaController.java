package com.test.SYJ_Mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.jpatest.IJpaService;

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
	
	@RequestMapping(value = "identityMappingTest.action", method = { RequestMethod.GET })
	public String identityMappingTest(HttpServletRequest request, HttpServletResponse response) {
	
		
		service.identityTableTest(request,response);
		
		
		return "";
	}
	
	
	
	@RequestMapping(value = "Example01.action", method = { RequestMethod.GET })
	public String example01(HttpServletRequest request, HttpServletResponse response) {
	
		
		
		/*
		 
		  회원은 상품을 주문할 수 있다.
		  주문 시 여러 종류의 상품을 선택할 수 있다.
		  
		  - 회원 기능 : 등록,조회
		  - 상품 기능 : 상품등록 , 상품수정, 상품조회
		  - 주문 기능 : 상품주문, 주문내역 조회, 주문 취소
		  
		  
		  
		 */
		
		service.example01(request,response);
		
		
		return "";
	}
	
	
	//연관관계 mapping
	@RequestMapping(value = "relationshipMapping.action", method = { RequestMethod.GET })
	public String relationshipMapping(HttpServletRequest request, HttpServletResponse response) {
	
		
		
		/*
		 
		 예제 시나리오
		 - 회원과 팀이 있다.
		 - 회원은 하나의 팀에만 소속될 수 있다.
		 - 회원과 팀은 다대일 관계이다. 회원이 N이고 팀이 1이다.
		 
		 
		 */
		
		service.relationMapping01(request,response);
		
		
		return "";
	}
	
	
	//양방향 연관관계 mapping
	@RequestMapping(value = "relationshipHostMapping.action", method = { RequestMethod.GET })
	public String relationshipHostMapping(HttpServletRequest request, HttpServletResponse response) {
	
		
		
		/*
		
		양방향 연관관계와 연관관계의 주인
		 
		- 객체의 두 관계중 하나를 연관관계의 주인으로 지정한다.
		- 연관관계의 주인만이 외래 키를 관리 (등록,수정)
		- 주인이 아니쪽은 읽기만 가능하다.
		- 주인은 mappedBy 속성을 사용할 수 없다.
		- 주인이 아니면 mappedBy 속성으로 주인을 지정한다.
		 
		누구를 주인으로? => 외래키가 존재하는 테이블을 기준으로 주인으로 만들자!
		*/
		//service.relationMapping02(request,response);
		
		
		/*  
		  양방향 맵핑시 가장 많이 하는 실수
		  - 연관관계 주인이 아닌 객체에 값을 넣는 경우 -> db 연동이 안된다.
		  
		 권장은 두개의 객체 모두에 데이터를 저장해주는게 맞다.
		*/
		service.relationMappingMistake(request,response);
		
		/*
		 
		 lombok 을 적용하면 toString 도 그냥 만들어주게 되는데
		 해당 방법이 무한루프를 야기할 수 있다.
		 
		 
		 lombok 에서는 그러므로 toString 생성은 제외하는 편이 좋다.
		 
		 */
		
		//service.infinityLoop(request,response);
		
		
		
		return "";
	}
	
	
	
	// 여러가지 연관관계
	@RequestMapping(value = "relationshipMappings.action", method = { RequestMethod.GET })
	public String relationshipMappings(HttpServletRequest request, HttpServletResponse response) {
	
		
		
		/*
		
		
		다중성 
		- 다대일 : @ManyToOne
		- 일대다 : @OneToOne
		- 일대일 : @OneToOne
		- 다대다 : @ManyToMany -> 실무에서 쓰면 안되는 어노테이션이라고 생각하면 된다.
		
		
		
		테이블
		- 외래 키 하나로 양쪽을 조인이 가능하다.
		- 사실 방향이라는 개념이 없다고 보면 된다.
		
		
		
		객체
		- 참조용 필드가 있는 쪽으로만 참조가 가능하다.
		- 한쪽만 참조하면 단방향
		- 양쪽이 서로 참조하면 양방향
		
		
		*/
		
		
		
		/*
		 
		  일대일 [1:1]
		  
		  
		  
		*/
		
		service.oneToOne(request,response);
		
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

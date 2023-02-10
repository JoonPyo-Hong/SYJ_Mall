package com.test.SYJ_Mall;

import javax.persistence.CascadeType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.utill.CommonDateFormat;
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
	
	
	// 상속관계 매핑
	@RequestMapping(value = "inheritanceMapping.action", method = { RequestMethod.GET })
	public String inheritanceMapping(HttpServletRequest request, HttpServletResponse response) {
	
		
		
		/*
		
		조인전략
		- 테이블이 정규화가 되어있음
		- 저장공간의 효율화를 가짐
		- 조회할때 쿼리가 복잡해질 수 있다
		- 데이터 저장시 insert 쿼리 2번 호출된다.
		
		
		단일테이블 전략
		- 조인이 필요없으므로 일반적으로 조회 성능이 좋다.
		- 조회 쿼리가 엄청 단순하다.
		- 자식 엔티티가 매핑한 컬럼은 모두 null 허용되어야 한다. 예를들어 item 객체에 movie, album 이 상속되어 있는데 한 테이블에 정보가 있으므로 각 테이블의 유일한 정보는 null 값을 가질수밖에 없다.
		- 단일 테이블에 저장하므로 데이터가 엄청 많아지는 경우에는 오히려 성능이 안나올 수 있다.
		
		
		구현 클래스마다 테이블 전략
		- 쓰면 안되는 전략임
		- 각각 테이블을 묶지 않기때문에 서비스할때 문제가 생길 수 있다.
		- 여러 자식 테이블 함께 조회할때 성능이 아주 나쁨 => union 으로 가져옴
		
		
		
		*/
		

		
		//service.inheritanceTypeJoin(request,response);
		//service.inheritanceTypeSingle(request,response);
		
		
		
		/*
		 
		  @MappedSuperclass
		  - 공통 매핑 정보가 필요할 때 사용한다.
		  - 속성을 같이 쓰고 싶을때 각 테이블에 컬럼을 하나하나 추가해주는건 시간낭비이므로 MappedSuperclass 를 사용하여 컬럼을 공유한다.
		  - 상속관계 매핑이 아님
		  - 또한해당 객체는 엔티티가 아님!
		  - MappedSuperclass 에 대응되는 객체자체로 조회가 불가능하게 된다.(****)
		  - 추상클래스로 사용하는것을 권장한다 -> 직접 사용하는 경우가 없으므로
		  
		 */
		
		//service.mappedSuperClass(request,response);
		
		
		
		
		
		return "";
	}
	
	
	
	
	// 요구사항 추가
	@RequestMapping(value = "jpatest2.action", method = { RequestMethod.GET })
	public String jpatest2(HttpServletRequest request, HttpServletResponse response) {
		
		
		// 요구사항 추가
		
		/*
		 
		 요구사항 추가
		 - 상품의 종류는 음반, 도서, 영화가 있고 이후 더 확장될 수 있다.
		 - 모든 데이터는 등록일과 수정일이 필수이다.
		  
		  
		 */
		
		
		
		service.addTesting(request,response);
		
		return "";
		
	}
	
	
	
	// 프록시
	@RequestMapping(value = "proxyTest.action", method = { RequestMethod.GET })
	public String proxyTest(HttpServletRequest request, HttpServletResponse response) {
		
		
		/*
		 
		프록시와 연관관계 정리
		
		
		프록시
		- em.find() vs em.getReference()
		
		- em.find() : 데이터베이스를 통해서 실제 엔티티 객체 조회
		- em.getReference() : 데이터베이스 조회를 미루는 가짜(프록) 엔티티 객체 조회 / 하이버네이트가 내부의 라이브러를 써서 가짜 엔티티 객체를 만든다.
		 
		  
		프록시의 특징(***)
		- 프록시 객체는 처음 살용할 때 한번만 초기화 된다.
		- 프록시 객체를 초기화 할때, 프록시 객체가 실제 엔티티로 바뀌는 것은 아님, 초기화 되면 프록시 객체를 통해서 실제 엔티티에 접근이 가능하다.
		- 프록시 객체는 원본 엔티티를 상속받음, 따라서 타입 체크시 주의해야한다. (== 비교 실패, 대신 instance of 사용해야 한다.)
		- 영속성 컨텍스트에 찾는 엔티티가 이미 있으면 em.getReference() 를 호출해도 실제 엔티티를 반환한다.
		- 영속성 컨텍스트에 도움을 받을 수 없는
		  
		*/
		
		
		
		service.proxyTesting(request,response);
		
		return "";
		
	}
	
	
	@RequestMapping(value = "lazyLoading.action", method = { RequestMethod.GET })
	public String lazyLoading(HttpServletRequest request, HttpServletResponse response) {
		
		
		/*
		 
		 즉시로딩과 지연로딩
		 User 을 조회하는데 굳이 Team을 조회해야 하나?
		 -> 지연로딩 옵션을 지원한다.
		 
		 실무에서는 지연 로딩만 사용하는 것을 권장한다 (***)
		 즉시 로딩을 적용하면 예상하지 못한 SQL 이 발생할 수 있다.
		 
		 조인이 한두개면 상관없는데 실무에서는 조인이 막 몇십개 걸려있을 수도 있는데 그럴때마다 즉시로딩을 해준다면 성능이 너무 안좋아 질것이다.
		 
		 ManyToOne, OneToOne 은 기본이 즉시 로딩 이다 -> LAZY 로 바꿔줘야 한다.
		 하지만 OneToMany ManyToMany 는 기본이 지연로딩이다.
		*/
		
		
		
		service.lazyTesting(request,response);
		
		return "";
		
	}
	
	
	// 영속성 전이
	@RequestMapping(value = "cascade.action", method = { RequestMethod.GET })
	public String cascade(HttpServletRequest request, HttpServletResponse response) {
		
		
		/*
		 
		  특정 엔티티를 영속 상태로 만들 때 연관된 엔티티도 함께 영속 상태로 만들고 싶을 때 사용해준다.
		  ex) 부모 엔티티를 저장할 때 자식 엔티티도 함께 저장함.
		 
		 
		*/
		
		
		
		service.cascadeTesting(request,response);
		
		return "";
		
	}
	
	
	// 고아객체
	@RequestMapping(value = "orphan.action", method = { RequestMethod.GET })
	public String orphanTest(HttpServletRequest request, HttpServletResponse response) {
		
		
		/*
		 
		 고아 객체 제거 : 부모 엔티티와 연관관계가 끊어진 자식 엔티티를 자동으로 삭제한다.
		 
		 orphanRemoval = true
		 
		 CascadeType.ALL + orphanRemoval = true 
		 => 스스로 생명주기를 관리하는 엔티티는 em.persist() 로 영속화, em.remove() 로 제거
		 => 두 옵션을 모두 활성화 하면 부모 엔티티를 통해서 자식의 생명 주기를 관리할 수 있다.
		 
		
		 
		 
		*/
		
		
		
		service.orphanTest(request,response);
		
		return "";
		
	}
	
	//JPA 데이터 분류
	@RequestMapping(value = "jpaDataValue.action", method = { RequestMethod.GET })
	public String jpaDataValue(HttpServletRequest request, HttpServletResponse response) {
		
		
		/*
		 
		
		JPA 에는 크게 두가지의 데이터 타입이 존재한다.
		
		1. 엔티티 타입
		- @Entity 로 정의하는 객체
		- 데이터가 변해도 식별자로 지속해서 추적 가능
		- 예 ) 회원 엔티티의 키나 나이 값을 변경해도 식별자로 인식 가능하다.
		
		
		2. 값 타입
		- int ,Integer, String 처럼 단순히 값으로 사용하는 자바 기본 타입이나 객체
		- 식별자가 없고 값만 있으므로 변경시 추적이 불가능
		
		
		
		 
		 
		*/
		
		
		
		service.jpaDataValueTest(request,response);
		
		return "";
		
	}
	
	
	//embeded type
	@RequestMapping(value = "embededValue.action", method = { RequestMethod.GET })
	public String embededValue(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {
			
		
		
		/*
		 
		 
		 - 잘 설계한 ORM 애플리케이션은 매핑한 테이블의 수보다 클래스의 수가 더 많다.
		 - 객체와 테이블을 매우 세밀하게 매핑하는 것이 가능하다.
		 
		 
		 
	
		 */
		
		service.embededValueTest(request,response,cd);
		
		return "";
		
	}
	
	
	//값 타입과 불변 객체
	@RequestMapping(value = "valueAndEmmutable.action", method = { RequestMethod.GET })
	public String valueAndEmmutable(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {
			
		
		
		/*
		 
		 
		 값 타입은 무조건 불변으로 만들어주는게 사이드 이펙트를 발생시키지 않는다 !
		 
		 
		 
	
		 */
		
		service.valueAndEmmutableTest(request,response,cd);
		
		return "";
		
	}
	
	
	//값 타입의 비교
	@RequestMapping(value = "valueVersus.action", method = { RequestMethod.GET })
	public String valueVersus(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {
			
		
		
		/*
		 
		 
		 값 타입의 비교
		 
		 1. 동일성(identity) 비교 : 인스턴스의 참조 값을 비교 , == 사용
		 2. 동등성(equivalence) 비교 : 인스턴스의 값을 비교 equals() 를 사용
		 
		 그러므로 값 타입은 equals 를 사용해서 비교해야 한다.
		 
		 
	
		 */
		
		service.valueVersusTest(request,response,cd);
		
		return "";
		
	}
	
	
	//값 타입의 컬렉션
	@RequestMapping(value = "valueCollection.action", method = { RequestMethod.GET })
	public String valueCollection(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {
			
		
		
		/*
		 
		 
		 값 타입 컬렉션
		 - 값 타입을 하나 이상 저장할 때 사용
		 - @ElementCollection, @CollectionTable 사용
		 - 데이터베이스는 컬렉션을 같은 테이블에 저장할 수 없다.
		 - 컬렉션을 저장하기 위한 별도의 테이블이 필요하다.
		 
		 
	
		 */
		
		service.valueCollection(request,response,cd);
		
		return "";
		
	}
	
	
	
	// JPA 다양한 쿼리 방법을 지원한다.
	@RequestMapping(value = "jpaQueryTest.action", method = { RequestMethod.GET })
	public String jpaQueryTest(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {
			
		
		
		/*
		 
		 
		 JPQL
		 - JPA 를 사용하면 엔티티 객체를 중심으로 개발
		 - 문제는 검색 쿼리
		 - 검색을 할 때도 테이블이 아닌 엔티티 객체를 대상으로 검색해야한다.
		 - 모든 디비 데이터를 객체로 변환해서 검색하는 것은 불가능하다.
		 - 애플리케이션이 필요한 데이터만 디비에서 불러오려면 결국 검색조건이 포함된 쿼리가 필요하다.
		 
		 - 그래서 SQL 과 기능이 비슷한 JPQL 이라는 객체 지향 쿼리를 언어를 제공한다.
		 
	
		 */
		
		service.jpaQueryTesting(request,response);
		
		return "";
		
	}
	
	
	// JPQL Start
	@RequestMapping(value = "jpqlStartTest.action", method = { RequestMethod.GET })
	public String jpqlStart(HttpServletRequest request, HttpServletResponse response, CommonDateFormat cd) {
			
		
		
		/*
		 
		- JPQL은 객체지향 쿼리 언어다. 따라서 테이블을 대상으로 쿼리하는 것이 아니라 엔티티 객체를 대상으로 쿼리한다.
		- JPQL은 SQL 을 추상화해서 특정 데이터베이스 SQL에 의존하지 않는다.
		- JPQL은 결국 SQL로 변환된다.
		
		
		- 엔티티와 속성은 대소문자 구분한다.
		- JPQL 키워드는 대소문자 구분하지 않는다.(select from where ~)
		- 엔티티의 이름을 사용해야지 테이블의 이름을 사용하면 사용할 수 없다.
		- 별칭은 필수로 지정해야 한다. (as 는 생략 가능)
		 
		
		
		
		 */
		
		service.jpqlStartTest(request,response);
		
		return "";
		
	}
	
	
	
	
}

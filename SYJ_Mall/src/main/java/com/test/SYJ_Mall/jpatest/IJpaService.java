package com.test.SYJ_Mall.jpatest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IJpaService {

	public void jpaTest(HttpServletRequest request, HttpServletResponse response); 
	
	public void jpaFind(HttpServletRequest request, HttpServletResponse response);
	
	public void jpaFindDelete(HttpServletRequest request, HttpServletResponse response);

	public void jpaUpdate(HttpServletRequest request, HttpServletResponse response);

	public void jpaSelect(HttpServletRequest request, HttpServletResponse response);

	public void permanencConcept(HttpServletRequest request, HttpServletResponse response);

	public void permanenceAdvantage(HttpServletRequest request, HttpServletResponse response);
	
	public void permanenceIdentity(HttpServletRequest request, HttpServletResponse response);
	
	public void permanenceWrite(HttpServletRequest request, HttpServletResponse response);
	
	public void permanenceUpdateCheck(HttpServletRequest request, HttpServletResponse response);
	
	public void flushTesting(HttpServletRequest request, HttpServletResponse response);
	
	public void flushJpql(HttpServletRequest request, HttpServletResponse response);
	
	public void detachTest(HttpServletRequest request, HttpServletResponse response);

	public void EntityTableTest(HttpServletRequest request, HttpServletResponse response);
	
	public void identityTableTest(HttpServletRequest request, HttpServletResponse response);

	public void example01(HttpServletRequest request, HttpServletResponse response);

	public void relationMapping01(HttpServletRequest request, HttpServletResponse response);

	public void relationMapping02(HttpServletRequest request, HttpServletResponse response);

	public void relationMappingMistake(HttpServletRequest request, HttpServletResponse response);

	public void infinityLoop(HttpServletRequest request, HttpServletResponse response);

	public void oneToOne(HttpServletRequest request, HttpServletResponse response);

	public void inheritanceTypeJoin(HttpServletRequest request, HttpServletResponse response);

	public void inheritanceTypeSingle(HttpServletRequest request, HttpServletResponse response);

	public void mappedSuperClass(HttpServletRequest request, HttpServletResponse response);

	public void addTesting(HttpServletRequest request, HttpServletResponse response);

	public void proxyTesting(HttpServletRequest request, HttpServletResponse response);

	public void lazyTesting(HttpServletRequest request, HttpServletResponse response);

	public void cascadeTesting(HttpServletRequest request, HttpServletResponse response);

	public void orphanTest(HttpServletRequest request, HttpServletResponse response);
	
}	
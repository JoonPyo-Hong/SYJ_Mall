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
	
}
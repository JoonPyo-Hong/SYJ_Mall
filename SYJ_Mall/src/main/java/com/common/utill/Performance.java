package com.common.utill;

/**
 * 성능확인 관련 클래스
 * @author shin
 *
 */
public class Performance {
	
	private long startTime;
	private long endTime;
	private long diffTime;
	
	public Performance() {
		this.startTime = System.currentTimeMillis();
	}
	
	public void getElapseTimeMs() {
		this.endTime = System.currentTimeMillis();
		diffTime = (endTime - startTime);
		
		System.out.printf("elapsed time : %dms\n",diffTime);
	}

}

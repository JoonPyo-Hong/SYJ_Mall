package com.common.utill;

import java.util.HashMap;
import java.util.Map;

/**
 * Performance Check Related Classes
 * @author shin
 *
 */
public class Performance {
	
	
	private long startTime;
	private long startMemory;
	
	
	public Performance() {
		System.out.println("test");
		this.startTime = System.currentTimeMillis();
		this.startMemory = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
	}
	
	public void checkPerformance() {
		long endMemory = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
		long endTime = System.currentTimeMillis();
		
		long memoryUsed = endMemory - startMemory;
        long timeElapsed = endTime - startTime;
		
		System.out.println("Time elapsed: " + timeElapsed + " milliseconds");
        System.out.println("Memory used: " + memoryUsed + " bytes");
	}

}

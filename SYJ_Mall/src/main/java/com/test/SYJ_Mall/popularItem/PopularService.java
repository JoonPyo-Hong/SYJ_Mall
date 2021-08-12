package com.test.SYJ_Mall.popularItem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PopularService implements IPopularService{
	
	@Autowired
	private IPoupularDAO dao;
	
	
	
}

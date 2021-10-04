package com.test.SYJ_Mall.newProduct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewproductService implements INewProductService {
	@Autowired
	private INewProductDAO dao;
	
}

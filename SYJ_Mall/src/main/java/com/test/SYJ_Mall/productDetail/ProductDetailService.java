package com.test.SYJ_Mall.productDetail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.SYJ_Mall.newProduct.INewProductDAO;

@Service
public class ProductDetailService implements IProductDetailService{
	
	@Autowired INewProductDAO dao;
	
}

package com.test.SYJ_Mall.charProdt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CharProdtService implements ICharProdtService{
	
	@Autowired
	private ICharProdtDAO dao;
}

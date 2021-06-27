package com.test.SYJ_Mall.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	private MainDAO dao;


	@Override
	public List<MainDTO> list() {
	
		return dao.list();
	}

}

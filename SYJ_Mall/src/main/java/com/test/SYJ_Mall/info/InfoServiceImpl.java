package com.test.SYJ_Mall.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.SYJ_Mall.main.MainDAO;

@Service
public class InfoServiceImpl  implements InfoService{
	@Autowired
	private InfoDAO dao;
	@Override
	public List<InfoDTO> InfoSelect() {
		// TODO Auto-generated method stub
		return dao.InfoSelect();
	}

}

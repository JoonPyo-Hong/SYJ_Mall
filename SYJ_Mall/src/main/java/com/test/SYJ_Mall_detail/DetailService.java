package com.test.SYJ_Mall_detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.SYJ_Mall.main.MainDAO;
@Service
public class DetailService implements IDetailService{
	@Autowired
	private IDetailDAO dao;
	public List<DetailDTO> DetailSelect() {
		// TODO Auto-generated method stub
		return dao.lisDetailSelectt();
	}

}

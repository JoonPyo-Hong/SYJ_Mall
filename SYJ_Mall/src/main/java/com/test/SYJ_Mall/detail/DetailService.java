package com.test.SYJ_Mall.detail;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DetailService implements IDetailService{
	@Autowired
	private IDetailDAO dao;
	public List<DetailDTO> DetailSelect(Integer d_seq) {
		// TODO Auto-generated method stub
		return dao.lisDetailSelectt(d_seq);
	}
	@Override
	public List<String> HeaderSelect(Integer d_seq) {
		// TODO Auto-generated method stub
		return dao.HeaderSelect(d_seq);
	}
	@Override
	public List<FeedDTO> FeedSelect(Integer d_seq) {
		// TODO Auto-generated method stub
		return dao.FeedSelect(d_seq);
	}
	@Override
	public List<FeedDTO> FeedSelect2(Integer d_seq) {
		// TODO Auto-generated method stub
		System.out.println(d_seq);
		return dao.FeedSelect2(d_seq);
	}
	@Override
	public Integer heart_select(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		System.out.println(map.get("m_seq"));
		System.out.println(map.get("f_seq"));
		return dao.heart_select(map);
	}

}

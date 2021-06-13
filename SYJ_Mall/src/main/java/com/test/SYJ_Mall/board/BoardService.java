package com.test.SYJ_Mall.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private BoardDAO dao;

	@Override
	public List<BoardDTO> noticelist(BoardDTO dto) {
		return dao.noticelist(dto);
	}

}

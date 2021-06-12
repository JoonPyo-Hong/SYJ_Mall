package com.test.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardService implements IBoardService{
	
	@Inject
    private BoardDAO dao;
	
	@Override
	public List<BoardDTO> noticelist(BoardDTO dto) {
		return dao.noticelist(dto);
	}
	
}

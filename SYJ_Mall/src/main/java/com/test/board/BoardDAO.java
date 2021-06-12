package com.test.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class BoardDAO implements IBoardDAO{
	@Inject
    private SqlSession session;
	
	@Override
	public List<BoardDTO> noticelist(BoardDTO dto) {

		return session.selectList("noticelist",dto);
	}

}

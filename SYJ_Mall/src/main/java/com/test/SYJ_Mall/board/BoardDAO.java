package com.test.SYJ_Mall.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements IBoardDAO{
	@Autowired
    private SqlSession session;
	
	@Override
	public List<BoardDTO> noticelist(PagingDTO dto) {

		return session.selectList("board.noticelist",dto);
	}

	public List<BoardDTO> listbtn(BoardDTO dto) {
		// TODO Auto-generated method stub
		return session.selectList("board.listbtn",dto);
	}

	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return 0;
	}

}

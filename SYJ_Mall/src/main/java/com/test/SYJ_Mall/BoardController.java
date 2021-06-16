package com.test.SYJ_Mall;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.SYJ_Mall.board.BoardDTO;
import com.test.SYJ_Mall.board.BoardService;

/**
 * 게시판 컨트롤러 역할
 * 
 * @author joonpyo-hong
 *
 */
@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	/*---------------------------------------------------게시판 페이지------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------------------------------*/
	// 게시판 리스트 형식 출력
	@RequestMapping(value = "/notice_list.action", method = { RequestMethod.GET })
	public String login(BoardDTO dto, Model model) {

		List<BoardDTO> list = service.noticelist(dto);
		model.addAttribute("list", list);

		return "/Board/NoticeList";
	}
	// 게시판 리스트에서의 확장 버튼
		@RequestMapping(value = "/list_btn.action", method = { RequestMethod.POST })
		public List<BoardDTO> list_btn(BoardDTO dto, Model model) {
			List<BoardDTO> list = service.noticelist(dto); 
			
			return list;
		}
	

}

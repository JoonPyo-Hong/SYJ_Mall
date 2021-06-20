package com.test.SYJ_Mall;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.SYJ_Mall.board.BoardDTO;
import com.test.SYJ_Mall.board.BoardService;
import com.test.SYJ_Mall.board.PagingDTO;

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
	public String login(PagingDTO dto, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = service.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		dto = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", dto);
		model.addAttribute("list",service.noticelist(dto));
		System.out.println(dto.toString());
		System.out.println(service.noticelist(dto).toString());
		return "/Board/NoticeList";
	}

	// 게시판 리스트에서의 확장 버튼
	@RequestMapping(value = "/list_btn.action", method = { RequestMethod.POST })
	@ResponseBody
	public Object list_btn(BoardDTO dto) {
		List<BoardDTO> list = service.listbtn(dto);
//			System.out.println(dto.getSeq());
//			System.out.println(list);
		return list;
	}

}

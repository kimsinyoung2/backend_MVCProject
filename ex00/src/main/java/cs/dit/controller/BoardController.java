package cs.dit.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import cs.dit.domain.BoardVO;
import cs.dit.domain.CommentVO;
import cs.dit.service.BoardService;
import cs.dit.service.CommentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService service;
	private final CommentService commentService;
	
	
	@GetMapping("mapleTable")
	public String maplegetList(Model model) {
		model.addAttribute("list", service.mapleGetList());
		return"/board/mapleTable";
		
	}
	
	@GetMapping("lostTable")
	public String lostgetList(Model model) {
		model.addAttribute("list", service.lostGetList());
		return"/board/lostTable";
		
	}
	
	@GetMapping("lolTable")
	public String lolgetList(Model model) {
		model.addAttribute("list", service.lolGetList());
		return"/board/lolTable";
		
	}
	
	@GetMapping("writing")
	public String getList() {
		return"/board/writing";
		
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		
		session.invalidate();
		
		return"redirect:/user/login";
		
	}
	
	
	@PostMapping("insert")
	public String insert(BoardVO board){
		int insert = service.insert(board);
		return "redirect:/board/mapleTable";
	}
	
	@PostMapping("commentInsert")
	public String commentInsert(CommentVO comments) {
		int commentInsert = commentService.insert(comments);
		return "redirect:/board/get?bno=" + comments.getBno();
	}
	
	@PostMapping("modify")
	public String modify(BoardVO board) {
		
		int count = service.modify(board);
		
		log.info(count);
		
		return "redirect:/board/mapleTable";
	}
	
	@PostMapping("commentModify")
	public String commentModify(CommentVO comment) {
		
		int count = commentService.modify(comment);
		
		log.info(count);
		
		return "redirect:/board/get?bno=" + comment.getBno();
	}
	
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(Long bno) {
		
		int count = service.delete(bno);
		
		return "redirect:/board/mapleTable";
	}
	
	@RequestMapping(value="commentDelete", method = RequestMethod.GET)
	public String commentDelete(Long cno) {
		
		CommentVO comment = commentService.get(cno);
		
		int count = commentService.delete(cno);
		
		return "redirect:/board/get?bno=" + comment.getBno();
	}
	
	@GetMapping({"get", "count"})
	public String get(Long bno, Model model, HttpServletRequest req, HttpServletResponse resp) {
		
		service.checkCookies(req, resp,  bno);
		
		//게시글 불러오는것
		BoardVO board = service.get(bno);
		
		//댓글불러오기
		List<CommentVO> comments = commentService.getList(bno);
		
		log.info(comments.toString());
		log.info(board.toString());
		model.addAttribute("board", board);
		model.addAttribute("comments", comments);
		return"/board/detail";
	}
	
	@GetMapping("update")
	public String get(Long bno, Model model) {
		BoardVO board = service.get(bno);
		log.info(board.toString());
		model.addAttribute("board", board);
		return"/board/update";
	}
	
	@GetMapping("commentUpdate")
	public String commentUpdate(Long cno, Model model) {
		CommentVO comment = commentService.get(cno);
		log.info(comment.toString());
		model.addAttribute("comment", comment);
		return"board/commentUpdate";
	}
}

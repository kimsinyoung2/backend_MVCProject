package cs.dit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import cs.dit.domain.BoardVO;

public interface BoardService {
	
	//전체 목록
	public List<BoardVO> mapleGetList();
	
	public List<BoardVO> lostGetList();
	
	public List<BoardVO> lolGetList();
	
	
	//게시글 한개
	public BoardVO get(Long bno);
	
	public int count(Long bno); 
	
	public int insert(BoardVO board);
	
	public int delete(Long bno);
	
	public int modify(BoardVO board);

	public void main(BoardVO board);

	void checkCookies(HttpServletRequest req, HttpServletResponse resp, Long id);

	void addPostCookie(HttpServletResponse resp, Long id);
	
}

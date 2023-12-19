package cs.dit.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cs.dit.domain.BoardVO;
import cs.dit.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	
	private final BoardMapper mapper;
	
	@Override
	public List<BoardVO> mapleGetList() {
		return mapper.mapleGetList();
	}
	
	@Override
	public List<BoardVO> lostGetList() {
		return mapper.lostGetList();
	}
	
	@Override
	public List<BoardVO> lolGetList() {
		return mapper.lolGetList();
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("service - get--------------");
		return mapper.get(bno);
	}

	@Override
	public int insert(BoardVO board) {
		return mapper.insert(board);
	}

	@Override
	public int delete(Long bno) {
		log.info("service - remove -----------------");
		return mapper.delete(bno);
	}

	@Override
	public int modify(BoardVO board) {
		// TODO Auto-generated method stub
		return mapper.modify(board);
	}

	@Override
	public void main(BoardVO board) {
		// TODO Auto-generated method stub
		
	}


	public int count(Long bno) {
		return mapper.count(bno);
	}
	
	@Override
	  public void checkCookies(HttpServletRequest req, HttpServletResponse resp, Long id) {
	    Cookie[] cookies = req.getCookies();

	    if (cookies == null) addPostCookie(resp, id);
	    else {
	      for (Cookie cookie : cookies)
	        if (cookie.getName().equals("PostCookie" + id)) return;
	      addPostCookie(resp, id);
	    }
	  }

	@Override
	  public void addPostCookie(HttpServletResponse resp, Long id) {
	    this.count(id);
	    Cookie cookie = new Cookie("PostCookie" + id, String.valueOf(id));
	    cookie.setMaxAge(24 * 60 * 60);
	    resp.addCookie(cookie);
	  }



}

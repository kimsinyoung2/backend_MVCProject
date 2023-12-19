package cs.dit.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cs.dit.domain.BoardVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {

	@Autowired
	private BoardService service;
	
	@Test
	public void testGetList() {
		log.info("service getList test------------");
		
		List<BoardVO> list = service.mapleGetList();
		for(BoardVO board : list) {
			log.info(board);
		}
	}
	
	@Test
	public void getOne() {
		log.info("service get test------------");
		
			log.info(service.get(1L));
	}
	
	@Test
	public void register() {
		BoardVO board = new BoardVO();
		board.setTitle("ㅎㅇ");
		board.setContent("ㅂ2");
		board.setWriter("임진");
		
		service.insert(board);
	}
	
	@Test
	public void remove() {
		log.info("service remove test------------");
		service.delete(5L);
	}
	
	@Test
	public void Modify() {
	log.info("Modify---------------------------");
	BoardVO board = service.get(1L);
	board.setContent("진짜 졸린다!!!!");
	log.info("Modify result : " + service.modify(board));
	}
}

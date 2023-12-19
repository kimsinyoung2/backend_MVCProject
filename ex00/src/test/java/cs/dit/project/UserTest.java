package cs.dit.project;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cs.dit.domain.UserVO;
import cs.dit.mapper.UserMapper;
import cs.dit.service.BoardServiceTest;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserTest {
	
	
	@Autowired UserMapper usermapper; 
	
	
	@Test
	public void UserSelect() {
		UserVO user = usermapper.userSelect(1L);
		
		log.info(user.toString());
	}
	
	@Test
	public void UserList() {
		List<UserVO> user = usermapper.userList();
		
		for(UserVO item : user) {
			log.info(item.toString());
		}
	}


}

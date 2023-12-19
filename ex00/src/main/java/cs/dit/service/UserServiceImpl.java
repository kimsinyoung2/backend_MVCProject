package cs.dit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cs.dit.domain.UserVO;
import cs.dit.mapper.BoardMapper;
import cs.dit.mapper.UserMapper;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public void register(UserVO user){
		// TODO Auto-generated method stub
		mapper.register(user);
		
	}

}

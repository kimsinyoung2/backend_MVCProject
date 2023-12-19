package cs.dit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cs.dit.domain.UserVO;

@Mapper
public interface UserMapper {
	UserVO userSelect(Long id);
	
	List<UserVO> userList();
	
	UserVO userCheck(UserVO user);
	
	void register(UserVO user);
	
	UserVO registerCheck(UserVO user);
}

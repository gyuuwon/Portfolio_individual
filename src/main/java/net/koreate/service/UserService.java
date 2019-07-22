package net.koreate.service;

import java.util.Map;

import net.koreate.vo.UserVO;

public interface UserService {

	void signUp(UserVO vo) throws Exception;
	
	UserVO signIn(Map<String, String> paramMap) throws Exception;
	
	UserVO getUserById(String uid) throws Exception;

	UserVO uIdCheck(Map<String, String> paramMap)throws Exception;

}

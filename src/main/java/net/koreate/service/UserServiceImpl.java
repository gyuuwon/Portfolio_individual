package net.koreate.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.dao.UserDAO;
import net.koreate.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	UserDAO dao;

	@Override
	public void signUp(UserVO vo) throws Exception {
		dao.signUp(vo);
	}

	@Override
	public UserVO signIn(Map<String, String> paramMap) throws Exception {
		System.out.println(paramMap.get("umail"));
		System.out.println(paramMap.get("umailVendor"));
		System.out.println(paramMap.get("upw"));
		UserVO uv = dao.signIn(paramMap);
		System.out.println(uv);
		return uv;
	}

	@Override
	public UserVO getUserById(String umail) throws Exception {
		return dao.getUserById(umail);
	}

	@Override
	public UserVO uIdCheck(Map<String, String> paramMap) throws Exception{
		return dao.uIdCheck(paramMap);
	}

	
	
	
	
}

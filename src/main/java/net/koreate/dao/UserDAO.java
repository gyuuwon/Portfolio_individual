package net.koreate.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import net.koreate.vo.UserVO;

public interface UserDAO {
	
	@Insert("INSERT INTO port_user(umail,umailVendor,upw,uname,uphone,gender) VALUES(#{umail},#{umailVendor},#{upw},#{uname},#{uphone},#{gender})")
	void signUp(UserVO vo) throws Exception;
	
	@Select("SELECT * FROM port_user WHERE umail = #{umail}")
	UserVO getUserById(String umail) throws Exception;
	
	@Select("SELECT * FROM port_user WHERE umail = #{umail} AND umailVendor = #{umailVendor}")
	UserVO uIdCheck(Map<String, String> paramMap) throws Exception;
	
	
	@Select("SELECT * FROM port_user WHERE umail = #{umail} AND umailVendor = #{umailVendor} AND upw = #{upw}")
	UserVO signIn(Map<String, String> paramMap) throws Exception;

}

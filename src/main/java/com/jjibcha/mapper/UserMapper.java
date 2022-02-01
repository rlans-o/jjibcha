package com.jjibcha.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.UserVO;



@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface UserMapper {

	// 회원가입
		public void join(UserVO vo) throws Exception;
		
		// 로그인//
		public UserVO login(String userID, String userPassword) throws Exception;
	
}

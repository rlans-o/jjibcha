package com.jjibcha.service;

import com.jjibcha.vo.UserVO;


public interface UserService {

	public void join(UserVO vo) throws Exception;
	
	public UserVO login(UserVO vo) throws Exception;
	
	
}

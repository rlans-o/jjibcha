package com.jjibcha.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjibcha.vo.UserVO;
import com.jjibcha.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;

	@Override
	public void join(UserVO vo) throws Exception {
		// 컨트롤러 -> 서비스 호출 -> DAO 호출 -> Mapper -> DB
		System.out.println("S : 회원가입동작");
		if (vo == null) {
			// 처리
			return;
		}
		mapper.join(vo);

	}

	@Override
	public UserVO login(UserVO vo) throws Exception {

		return mapper.login(vo);
		
	}
	
	
}

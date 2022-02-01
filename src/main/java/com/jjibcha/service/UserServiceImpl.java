package com.jjibcha.service;

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
	public UserVO login(UserVO vo) {

		System.out.println("S : 컨트롤러에서 호출받으면 필요한 정보를 받아서 DAO로 전달");
		UserVO returnDTO = null;
		try {
			returnDTO = mapper.login(vo.getUserID(), vo.getUserPassword());
		} catch (Exception e) {
			e.printStackTrace();
			returnDTO = null; //실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 = 예외처리
		}
		return returnDTO; //null이 반환되면 앞의 코드가 문제가 있다는 것을 바로 알수있다.

	}
	
	
}

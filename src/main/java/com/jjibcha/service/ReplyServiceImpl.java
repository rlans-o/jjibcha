package com.jjibcha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjibcha.mapper.ReplyMapper;
import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public List<ReplyVO> list(PageObject pageObject) {
		// 전체 데이터를 가져오기 위해서 getRow()가 필요하다. pageObject에 셋팅해야만 한다.
		
		return mapper.list(pageObject);
	}
	
	@Override
	public void getRow(PageObject pageObject) {
	
		
	}

	@Override
	public Integer write(ReplyVO vo) {
		
		return mapper.write(vo);
	}

	@Override
	public Integer update(int rno) {

		return null;
	}

	@Override
	public Integer delete(int rno) {

		return null;
	}

}

package com.jjibcha.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<ReplyVO> list(PageObject pageObject, int no) {
		// 전체 데이터를 가져오기 위해서 getRow()가 필요하다. pageObject에 셋팅해야만 한다.
		
		pageObject.setTotalRow(mapper.getRow(no));
		// mybatis에서는 데이터를 한개만 받도록 설계되어져 있다.
		// 넘겨야할 것은 pageObject와 no를 넘겨야한다. = > 하나로 만들어 준다. : class , map
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("pageObject", pageObject);
		pageInfo.put("no", no);
		
		return mapper.list(pageInfo);
	}
	
	@Override
	public void getRow(int no) {
		
		
	}

	@Override
	public Integer write(ReplyVO vo) {
		
		return mapper.write(vo);
	}

	@Override
	public Integer update(ReplyVO vo) {

		return null;
	}

	@Override
	public Integer delete(int rno) {

		return null;
	}


}

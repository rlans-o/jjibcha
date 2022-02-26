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
	private ReplyMapper replyMapper;

	@Override
	public int enrollReply(ReplyVO vo) {
		
		int result = replyMapper.enrollReply(vo);

		return result;
	}

}
